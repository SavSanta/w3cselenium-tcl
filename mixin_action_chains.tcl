namespace eval ::selenium {

	oo::class create Mixin_Action_Chains {
		# Making already set variables from higher scope available here
        variable Mouse_Button Command session_ID
		# Setting some variables in this particular namespace
		variable action_list {}
		# Cant be seen. Fix it
		variable duration 150


		method w3c_perform {} {

			}

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
				   "id": "finger1",
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
				   "id": "finger1",
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
			my w3c_release {}
			return

			}


		#method drag_and_drop_by_offset {source, xoffset, yoffset }
		#method move_by_offset {self, xoffset, yoffset }

		method w3c_move_to_element {element_ID} {
			variable duration 
			if {$element_ID eq ""} {
				throw {Missing Element} {Error: Element ID Must Be Supplied}
			}

			set element_rect [my execute $Command(W3C_GET_ELEMENT_RECT) sessionId $session_ID id $element_ID]
			set element_rect_x [expr int( [dict get $element_rect value width] )]
			set element_rect_y [expr int( [dict get $element_rect value height] )]

			set left_offset [expr $element_rect_x / 2 ]
			set top_offset [expr $element_rect_y / 2 ]

			set xcoord [expr -$left_offset + { $element_rect_x | 0} ]
			set ycoord [expr -$top_offset + { $element_rect_y | 0} ]

			set action_payload "
				
				\[
				 {
				   \"type\": \"pointer\",
				   \"id\": \"mouse1\",
				   \"parameters\": {\"pointerType\": \"mouse\"},
				   \"actions\": \[
					 {\"type\": \"pointerMove\", \"duration\": $duration, \"x\": $xcoord, \"y\": $ycoord}
				   \]
				 }
				 \]
			
			"

			my execute $Command(W3C_PERFORM_ACTIONS) sessionId $session_ID actions $action_payload

		}


		 ##This is still trash and I need to review and then fix it
		#method w3c_move_to_element_with_offset {element_ID, xoffset, yoffset } {

			#if {$element_ID ne ""} {

				#set element_rect [my execute $Command(W3C_GET_ELEMENT_RECT) sessionId $session_ID id $element_ID]]
				#set element_rect_x [dict get $element_rect width]
				#set element_rect_y [dict get $element_rect height]

				#set left_offset [expr $element_rect_x / 2 ]
				#set top_offset [expr $element_rect_y / 2 ]
				#set left [set expr -$left_offset + { $element_rect_x | 0} ]
				#set top [set expr -$top_offset + { $element_rect_y | 0} ]
			#} else {
				#set left 0
				#set top 0
			#}

		#}
		
		
		method w3c_release {} {

			my execute $Command(W3C_RELEASE_ACTIONS) sessionId $session_ID

			}


		#method release_pointer {{element_ID ""}} {
			## Prob Not Needed
			#}

		#method release_key {{element_ID ""}} {
			## Prob Not Needed

			#}


		#method send_keys {self, *keys_to_send }
		#method send_keys_to_element {self, element, *keys_to_send }


		#method key_down {self, value, element=None }
		#method key_up {self, value, element=None }



		#method w3c_pause {seconds} {

			#}


								}
						}
