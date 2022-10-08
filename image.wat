(module

(import "env" "counter" (func $log (param $input i32) )) 
;;       ~~~   ~~~~~~~
;;       NAMES FROM JS    
;;                      ~~~~~~~~~~~~
;;                      DECLARATION OF FUNCTION



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; < MAIN FUNCTION ENTRY POINT >
;;
;; move and detect collisions between all of the objects in our app
(func $count (export "count") (result i32)
	
	(local $i i32) 														;; outer loop index
	;;(local.set $i (i32.const 0))


	;; LOOPING
	(loop $addcounter 

		;; BLOCK 
		;; CAN CREATE AREA WE CAN JUMP OUT LATER
		(block $break


			;; ---------------------------------------------------------------
			;; ACCESSING JS-FUNCTION WITH env OBJECT (IMPORTED OBJECT FROM JS)
			;; CALLING log FUNCTION
			(call $log (local.get $i))


			;; INCREMENT BY 1
			(local.set $i 
				(i32.add (local.get $i) (i32.const 1)) 
			)


			;; IF STATEMENT
			(br_if $break
				(i32.gt_u (local.get $i) (i32.const 100))
			)

			br $addcounter

		)
	)
	

	local.get $i



) ;; end of function


) ;; end of module