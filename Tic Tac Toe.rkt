;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Tic Tac Toe|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Tick Tac Toe
;since examples 201 - 212 are all a part of the same program, they will all be enclosed in this file, and labeled accordingly.
;Additionally, Ex. 195, 197,199, and 200 are necessary so they're here as well.


;Right Now we need to do 195 and 197

;preamble
;;a world is a structure: (make-world st turn)

;board is a board, children are list
(define-struct node (board children))

;solution tree is either:
;'()
;node

;;A board value (bval) is either:
; 1. 'X
; 2. 'O
; 3. 'B

;;these are all bvals
(define-struct board (p0 p1 p2 p3 p4 p5 p6 p7 p8))

;; A turn is either 'X or 'O
(define INIT-TURN 'X)
(define O-TURN 'O)

;board turn -> st
;purpose: create the st for the given board.
(define (create-st board turn)
  (make-node board
             (process-blanks board
                             (find-blanks board)
                             turn)))

(define (process-blank board lobps turn)
  (if (empty? lobpos)
      '()
      (cons (create-st
             (place-on-board a-board (first lobpos) turn)
             (if (eq? turn 'X) 'O 'X))
            (process-blanks board (rest lobpos) turn))))

(define-struct world (st turn))

(define-struct world 
(define (run a-name)
  (big-bang INIT-WORLD
    (on-draw draw-world)
    (on-mouse process-mouse)
    (on-tick process-tick)
    (stop-when game-over? draw-last-world)
    (name A-NAME)))
  )

(define NAME "Tic Tac Toe")
(define TILE-LEN 100)
(define TILE CLR 'green)
(define WIDTH ( * 3 TILE-LEN))
(define HEIGHT (* 3 TILE-LEN))
(define E-SCENE (empty-scene WIDTH HEIGHT))

