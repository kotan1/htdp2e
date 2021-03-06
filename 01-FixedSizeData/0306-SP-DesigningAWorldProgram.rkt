;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 0306-SP-DesigningAWorldProgram) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")))))
; Sample Problem: 
; Design a program that moves a car across the world canvas, from left to 
; right, at the rate of three pixels per clock tick.
;
; NOTE: the problem is solved by completing exercises 35 through 40.

; Physical Constants (general attributes of objects in the world)
(define WIDTH-OF-WORLD 200)
(define WHEEL-RADIUS   5)
(define WHEEL-DISTANCE (* WHEEL-RADIUS 5))

; Graphical Constants (images of objects in the world)
(define BACKGROUND (empty-scene WIDTH-OF-WORLD (/ WIDTH-OF-WORLD 2)))
(define WHEEL (circle WHEEL-RADIUS "solid" "black"))
(define SPACE (rectangle  (* 4 WHEEL-RADIUS) WHEEL-RADIUS "solid" "white"))
(define BOTH-WHEELS (beside WHEEL SPACE WHEEL))

; WorldState is a Number
; interpretation: the number of pixels between the left border and the car

; render
; clock-tick-handler
; key-stroke-handler
; mouse-event-handler
; end?

; WorldState -> Image
; places the image of the car x pixels from the left margin of
; the BACKGROUND image
(define (render x) BACKGROUND)

; WorldState -> WorldState
; adds 3 to x to move the car to the right
(define (tock x) x)

; WorldState -> WorldState
; launches the program from some initial state
(define (main ws)
  (big-bang ws
            [on-tick tock]
            [to-draw render]))

