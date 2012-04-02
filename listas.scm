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
   ((eq? l '()) '())
   ((eq? (car l) e) (cons new (cons e (loop (cdr l)))))
   (else
    (loop (cdr l))))))
;(insert-left 'a 'b '(b b b b b))

;;10
(define (insert-right new e list)
  (let loop ((l list))
  (cond
   ((eq? l '()) '())
   ((eq? (car l) e) (cons e (cons new (loop (cdr l)))))
   (else
    (loop (cdr l))))))