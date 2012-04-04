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
;;(list-operator * '(1 2 3 4 5))
;;(list-operator / '(1 2 3 4 5))
;;(list-operator + '(1 2 3 4 5))
;;(list-operator - '(1 2 3 4 5))

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
