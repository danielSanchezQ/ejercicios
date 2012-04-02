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
      (cdr l)
      (cons (car (reverse l)) (loop (- n 1) 
                                    (cdr l))))))