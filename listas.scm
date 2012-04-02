;;2
(define (list-ref-right list index)
  (list-ref (reverse list) index))

;;4
(define (palindrome? list)
  (equal? list (reverse list)))