namespace eval ::selenium {    

	oo::class create Mixin_For_Mouse_Interaction {
        variable Mouse_Button Command

        method double_click {} {
            # Make double-click action.

            my execute $Command(DOUBLE_CLICK)
        }
        
		method click {{element_ID ""}} {
			# Make a click action on an element on a specific element if given or none if not.
            
            if {$element_ID eq ""} {
                #pointer_down(MouseButton.LEFT)
                #self.pointer_up(MouseButton.LEFT)
            } else {
                puts [info object variables my $sessionId]
                my execute $Command(MOVE_TO) id $element_ID             # Modified to add move in preliminary action to move mouse to element
                my execute $Command(CLICK_ELEMENT) sessionId [my $sessionId] id $element_ID     # Convert to Click_Element call here rather than actions object
            }
		}
        
        method click_and_hold {{element_ID ""}} {
            # Holds down the left mouse button on an element.
            # :Args:
            # - element_ID (OPTINAL): The element to mouse down.
            
            if {$element_ID ne ""} {
                my move_mouse_to_element $element_ID
            }
            
            my mouse_down RIGHT
        }
        
        method move_mouse {xoffset yoffset} {
            # Moving the mouse to an offset from current mouse position.

            my execute $Command(MOVE_TO) xoffset $xoffset yoffset $yoffset
        }
        
        method move_mouse_to_element {element_ID {xoffset {}} {yoffset {}}} {
            # Moving the mouse to the middle of an element, possibly adding some offsets
            
            if {($xoffset ne "") && ($yoffset ne "")} {
                my execute $Command(MOVE_TO) xoffset $xoffset yoffset $yoffset element $element_ID
            } else {
                my execute $Command(MOVE_TO) element $element_ID
            }
        }
        
        method mouse_down {buttonName} {
            # mouse down action
            
            my execute $Command(MOUSE_DOWN) button $Mouse_Button($buttonName)
        }
        
        method mouse_up {buttonName} {
            # mouse up action

            my execute $Command(MOUSE_UP) button $Mouse_Button($buttonName)
        }
        
    }
    
}
