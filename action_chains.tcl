# action_chains

namespace eval ::selenium {
	
    
    oo::class create Mixin_Actions {
        variable action_list {}
        

        
        method perform {} {
			
			}
        
        method reset_actions {} {
            
            my execute $Command(W3C_RELEASE_ACTIONS) sessionId $session_ID
            
        }
        
        method click {{element_ID ""}} {
            if {element_ID ne ""} {
                my move_to_element $element_ID
            }
            
            
             set bex {
               "actions": [
                 {
                   "type": "pointer",
                   "id": "finger1",
                   "parameters": {"pointerType": "mouse"},
                   "actions": [
                     {"type": "pointerDown", "button": 0},
                     {"type": "pause", "duration": 200},
                     {"type": "pointerUp", "button": 0}
                   ]
                 }
                 ]
             }      
            
            
        }
        
        method click_and_hold {{element_ID ""}} {
            
            if {element_ID ne ""} {
                my move_to_element $element_ID
            }
            
            
             set bex {
               "actions": [
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
            
            
        }
        
        
        
        method context_click {{element_ID ""}} {
            
            if {element_ID ne ""} {
                my move_to_element $element_ID
            }
            
            
             set bex {
               "actions": [
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
            
            
        }
    
    
        method double_click {{element_ID ""}} { 

            if {element_ID ne ""} {
                my move_to_element $element_ID
            }
            
            
            
             set bex {
               "actions": [
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
        }
        
        
        method drag_and_drop { element_start, element_end } {
            
            my click_and_hold {element_start}
            my move_to_element {element_end}
            my release {}
            return
            
            }
        
        
        
        #method drag_and_drop_by_offset {source, xoffset, yoffset }
        #method move_by_offset {self, xoffset, yoffset }
        
        method move_to_element {element_ID } {
            if {element_ID eq ""} {
                throw {Missing Element} {Error: Element ID Must Be Supplied}
            }
            
            my execute $Command(W3C_GET_ELEMENT_RECT) sessionId $session_ID id $element_ID]
            set element_rect_x [dict get element_rect width] 
            set element_rect_y [dict get element_rect height] 

            set left_offset [expr element_rect_x / 2 ]
            set top_offset [expr element_rect_y / 2 ]
            set xcoord [set expr -left_offset + { element_rect_x | 0} ]
            set ycoord [set expr -top_offset + { element_rect_y | 0} ]
        
            set action_payload "
                {
               \"actions\": \[
                 {
                   \"type\": \"pointer\",
                   \"id\": \"finger1\",
                   \"parameters\": {\"pointerType\": \"mouse\"},
                   \"actions\": \[
                     {\"type\": \"pointerMove\", \"duration\": $duration, \"x\": xcoord, \"y\": ycoord}
                   \]
                 }
                        \]
            }
            "
        
        
        }
        
        
        method move_to_element_with_offset {element_ID, xoffset, yoffset } {
        
            my execute $Command(W3C_GET_ELEMENT_RECT) sessionId $session_ID id $element_ID]
            set element_rect_x [dict get element_rect width] 
            set element_rect_y [dict get element_rect height] 
            
            set left_offset [expr element_rect_x / 2 ]
            set top_offset [expr element_rect_y / 2 ]
            set left [set expr -left_offset + { element_rect_x | 0} ]
            set top [set expr -top_offset + { element_rect_y | 0} ]
			} else {
				set left 0
				set top 0
			}
        
        
        
        }
        
        
        
        #method pause {seconds} {
        
			#}
			
			
        method release {} {
            
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
        
        
        
        
        
        
        
                                }
    
      
    
    
                        }
