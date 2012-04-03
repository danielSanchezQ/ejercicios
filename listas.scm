;;2
(define (list-ref-right list index)
  (list-ref (reverse list) index))

;;4
(define (palindrome? list)
  (equal? list (reverse list)))

;;6
(define (rotate-rigth list n)
  (let loop ((counter n)
             (l list))
  (if (= counter 0) 
      l
      (cons (take-right l 1) (loop (- n 1) 
                                    (drop-right 1))))))

;;8
(define (insert-left new e list)
  (let loop ((l list))
  (cond
   ((null? l) '())
   ((eq? (car l) e) (cons new (cons e (loop (cdr l)))))
   (else
    (loop (cdr l))))))
;(insert-left 'a 'b '(b b b b b))

;;10
(define (insert-right new e list)
  (let loop ((l list))
  (cond
   ((null? l) '())
   ((eq? (car l) e) (cons e (cons new (loop (cdr l)))))
   (else
    (loop (cdr l))))))


;;12
(define (remove-at n list)
  (let loop ((counter n)
             (l list))
    (cond
     ((= counter 0) (cdr l))
     (else
      (cons (car l) (loop (- counter 1)
                          (cdr l)))))))
;;14
#;(define (pack list)
  (let loop ((l list))
    (cond
     ((null? l) '())
     ((equal? (car l) (cadr l)) (cons (cons (car l) (loop (cddr l))) '()))
     (else
      (cons (car l) (loop (cdr l)))))))
;;16 necesita srfi1
(define (grupo num list)
  (let loop ((l list))
    (cond
     ((null? l) '())
     ((<= (length l) num) l)
     (else
      (cons (list (take num l)) (list (loop (drop num l))))))))
;(grupo 2 '(a b c d e f g))
;;18
(define (take-higher list)
  (let loop ((l (cdr list))
             (n (car list)))
    (cond
     ((null? l) n)
     ((> n (car l)) (loop (cdr l) n))
     ((< n (car l)) (loop (cdr l) (car l))))))
(define (my-sort list)
  (let loop ((l list)
             (n (take-higher list)))
    (cond
     ((= n 0 ) '())
     (else
      (cons (loop l (- n 1)) (cons (filter (> (- n 1))) n))))))
(my-sort '(2 3 4 6 8 9 7 5 4))








