;;UTILITIES
(define (list-operator operator list)
  (let loop ((l list)
             (result (cond
                      ((eq? operator *) 1)
                      ((eq? operator /) 1)
                      (else
                       0))))
    (cond
     ((null? l) result)
     (else
      (loop (cdr l) (operator result (car l)))))))

(define (take-higher list)
  (let loop ((l (cdr list))
             (n (car list)))
    (cond
     ((null? l) n)
     ((> n (car l)) (loop (cdr l) n))
     ((< n (car l)) (loop (cdr l) (car l))))))

(define (take-lower list)
  (let loop ((l (cdr list))
             (n (car list)))
    (cond
     ((null? l) n)
     ((< n (car l)) (loop (cdr l) n))
     ((> n (car l)) (loop (cdr l) (car l))))))
;;(list-operator * '(1 2 3 4 5))
;;(list-operator / '(1 2 3 4 5))
;;(list-operator + '(1 2 3 4 5))
;;(list-operator - '(1 2 3 4 5))


;;2 MODA
(define (counter a list)
  (let loop ((l list)
             (counter 0))
    (cond
     ((null? l) counter)
     ((eq? a (car l)) (loop (cdr l) (+ counter 1)))
     (else
      (loop (cdr l) counter)))))
;(counter 1 '(1 2 3 5 1 2 3 4 1 1 1))

(define (moda list)
  (let loop ((l (cdr list))
             (n (counter (car list) list))
             (result (car list)))
    (cond
     ((null? l) result)
     ((> n (counter (car l) l)) (loop (cdr l) n result))
     ((= n (counter (car l) l)) (loop (cdr l) n (cons result (car l))))
     (else
      (loop (cdr l) (counter (car l) l) (car l))))))
;(moda '(1 1 1 3 3 3 4 4 4))

;;4 MEDIA GEOMETRICA
(define (geometric-mean l)
  (raizenesima(list-operator * l)))

;;6 SOLO CAMBIAR EL NOMBRE

;;8 MEDIA CUADRATICA
(define (quadratic-mean l)
  (sqrt(/ (list-operator + (map * l l)) (length l)))) 

(quadratic-mean '(1 1 1 1 1 1))
(quadratic-mean '(4 5 6 3 8))

;;10 RANGO MEDIO
(define (mid-range l-pairs)
  (/ (+ (take-higher l-pairs) (take-lower l-pairs)) 2))

(mid-range '(2 3 4 5 6))
