;;2
(define (list-ref-right list index)
  (list-ref (reverse list) index))