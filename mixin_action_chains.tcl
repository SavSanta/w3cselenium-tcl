namespace eval ::selenium {

	oo::class create Mixin_Action_Chains {
		# Making already set variables from higher scope available here
        variable Mouse_Button Command session_ID


		method w3c_reset_actions {} {

			my execute $Command(W3C_RELEASE_ACTIONS) sessionId $session_ID

		}

		method w3c_click {{element_ID ""}} {
			if {$element_ID ne ""} {
				my w3c_move_to_element $element_ID
			} 


			set action_payload {
				[
				 {
				   "type": "pointer",
				   "id": "finger1",
				   "parameters": {"pointerType": "mouse"},
				   "actions": [
					 {"type": "pointerDown", "button": 0},
					 {"type": "pause", "duration": 150},
					 {"type": "pointerUp", "button": 0}
				   ]
				 }
				]
			 }
			
			my execute $Command(W3C_PERFORM_ACTIONS) sessionId $session_ID actions $action_payload
            
		}


		method w3c_click_and_hold {{element_ID ""}} {

			if {$element_ID ne ""} {
				my w3c_move_to_element $element_ID
			}

			 set action_payload {
				[
				 {
				   "type": "pointer",
				   "id": "finger1",
				   "parameters": {"pointerType": "mouse"},
				   "actions": [
					 {"type": "pointerDown", "button": 0}
				   ]
				 }
				]
			 }

			my execute $Command(W3C_PERFORM_ACTIONS) sessionId $session_ID actions $action_payload

		}


		method w3c_context_click {{element_ID ""}} {

			if {$element_ID ne ""} {
				my w3c_move_to_element $element_ID
			}


			 set action_payload {
				[
				 {
				   "type": "pointer",
				   "id": "mouse1",
				   "parameters": {"pointerType": "mouse"},
				   "actions": [
					 {"type": "pointerDown", "button": 2},
					 {"type": "pause", "duration": 200},
					 {"type": "pointerUp", "button": 2}
				   ]
				 }
				]
			 }

			my execute $Command(W3C_PERFORM_ACTIONS) sessionId $session_ID actions $action_payload
			

		}

		method w3c_double_click {{element_ID ""}} {

			if {$element_ID ne ""} {
				my w3c_move_to_element $element_ID
			}

			 set action_payload {
				[
				 {
				   "type": "pointer",
				   "id": "mouse1",
				   "parameters": {"pointerType": "mouse"},
				   "actions": [
					 {"type": "pointerDown", "button": 0},
					 {"type": "pause", "duration": 150},
					 {"type": "pointerUp", "button": 0},
					 {"type": "pause", "duration": 200},
					 {"type": "pointerDown", "button": 0},
					 {"type": "pause", "duration": 150},
					 {"type": "pointerUp", "button": 0}
				   ]
				 }
			   ]
			 }
			 
			my execute $Command(W3C_PERFORM_ACTIONS) sessionId $session_ID actions $action_payload
		}

		method w3c_drag_and_drop { element_start, element_end } {

			my w3c_click_and_hold $element_start
			my w3c_move_to_element $element_end
			my w3c_release
			return

			}


		#method drag_and_drop_by_offset {source, xoffset, yoffset }
		#method move_by_offset {self, xoffset, yoffset }

		method w3c_move_to_element {element_ID {xoff ""} {yoff ""}} {
			variable duration 500
			if {$element_ID eq ""} {
				throw {Missing Element} {Error: Element ID Must Be Supplied}
			}

			if {[string is integer $xoff] && [string is integer $yoff]} {
				set element_rect [my execute $Command(W3C_GET_ELEMENT_RECT) sessionId $session_ID id $element_ID]
				set element_rect_x [expr int( [dict get $element_rect value width] )]
				set element_rect_y [expr int( [dict get $element_rect value height] )]

				set left_offset [expr $element_rect_x / 2 ]
				set top_offset [expr $element_rect_y / 2 ]

				set xcoord [expr -$left_offset + { $element_rect_x | 0} ]
				set ycoord [expr -$top_offset + { $element_rect_y | 0} ]
			} else {
				set xcoord 0
				set ycoord 0
			}


			set action_payload "
				
				\[
				 {
				   \"type\": \"pointer\",
				   \"id\": \"mouse1\",
				   \"parameters\": {\"pointerType\": \"mouse\"},
				   \"actions\": \[
					 {\"type\": \"pointerMove\", \"origin\": {\"element-6066-11e4-a52e-4f735466cecf\": \"$element_ID\"}, \"duration\": $duration, \"x\": $xcoord, \"y\": $ycoord}
				   \]
				 }
				 \]
			
			"

			my execute $Command(W3C_PERFORM_ACTIONS) sessionId $session_ID actions $action_payload

		}



		method w3c_move_to_element_with_offset {element_ID, xoff, yoff } {

			if {$element_ID eq "" || xoff eq "" || yoff eq "" } {
					throw {Missing Parameters} {Error: an element ID, an x-offset, and a y-offset must be supplied}
				}
				
				# Just call out to the other proc with a fully supplied signature.
				my w3c_move_to_element $element_ID $xoff $yoff

		}

		method w3c_send_keys {keys_to_send {element_ID ""}} {
			
			if {0} {
				
				
				
				
			} else {
					
					
					
					}
			
			
			}

		method w3c_send_keys_to_element {keys_to_send element_ID} {
			
			if {$keys_to_send eq "" || $element_ID eq "" } {
					throw {Missing Parameters} {Error: an element ID and keys to send must be supplied.}
				}
				
			my w3c_click $element_ID	
			my w3c_send_keys $keys_to_send $element_ID
			
			}		
		
		method w3c_release {} {

			my execute $Command(W3C_RELEASE_ACTIONS) sessionId $session_ID

			}
			

		#method release_pointer {{element_ID ""}} {
			##  TODO Action Scheduler 
			#}

		#method release_key {{element_ID ""}} {
			## TODO Action Scheduler 

			#}

		#method w3c_perform {} {
			## TODO Action Scheduler 

			#}

		#method key_down {value, {element ""}} {
			## TODO Action Scheduler 

			#}
		
		#method key_up {value {element ""}} {
			## TODO Action Scheduler 

			#}


		#method w3c_pause {seconds} {
			## TODO Action Scheduler 

			#}


								}
						}
