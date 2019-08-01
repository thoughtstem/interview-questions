#lang racket

;2.1 Write code to remove duplicates from a linked list

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


(module solution-3 racket
	(define node%
	  (class object%
		 (init data)
		 (define current-data data)

		 (init next)
		 (define current-next next)

		 (define/public (get-next)
				current-next)

		 (define/public (get-data)
				current-data)

		 (super-new)))

	(define a 
	  (new node% 
	       [data 'a] 
	       [next #f]))

	(define b
	  (new node%
	       [data 'b]
	       [next a]))

	(displayln (send (send b get-next) get-data)))


