#lang racket

;Write code to remove duplicates from a linked list

(module solution-1 racket
   (define (remove-dups l)
     (if (empty? l)
       '()
       (remove-duplicates-non-empty l)))
   
   (define (remove-duplicates-non-empty l)
     (define head (first l))
     (define tail (rest l))

     (if (member head tail)
       (remove-dups tail) 
       (cons head (remove-dups tail))))
   
   (remove-dups '(a b a a c d c)))

(module solution-2 racket
   (define (remove-dups l)
     (if (empty? l)
       '()
       (remove-duplicates-non-empty l)))
   
   (define (remove-duplicates-non-empty l)
     (define head (first l))
     (define tail (rest l))

     (if (is-in head tail)
       (remove-dups tail) 
       (cons head (remove-dups tail))))

   (define (is-in e l)
     (and (not (empty? l))
	  (or (eq? e (first l))
	      (is-in e (rest l)))))
   
   (remove-dups '(a b a a c d c)))

(require 'solution-2)

