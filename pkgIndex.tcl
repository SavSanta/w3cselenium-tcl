package ifneeded lambda 1 [list source [file join $dir utils lambda.tcl]]

package ifneeded xvfbwrapper 0.1 [list source [file join $dir xvfbwrapper.tcl]]
package ifneeded browser_info 0.1 [list source [file join $dir browser_info.tcl]]

package ifneeded selenium::utils::process 0.1 [list source [file join $dir utils process.tcl]]
package ifneeded selenium::utils::json 0.1 [list source [file join $dir utils json.tcl]]
package ifneeded selenium::utils::walkin 0.1 [list source [file join $dir utils walkin.tcl]]
package ifneeded selenium::utils::url_codification 0.1 [list source [file join $dir utils url_codification.tcl]]
package ifneeded selenium::utils::tempdir 0.1 [list source [file join $dir utils tempdir.tcl]]
package ifneeded selenium::utils::port 0.1 [list source [file join $dir utils port.tcl]]
package ifneeded selenium::utils::selectors 0.1 [list source [file join $dir utils selectors.tcl]]
package ifneeded selenium::utils::base64 0.1 [list source [file join $dir utils base64.tcl]]
package ifneeded selenium::utils::types 0.1 [list source [file join $dir utils types types.tcl]]
package ifneeded selenium::utils::types::json 0.1 [list source [file join $dir utils types json.tcl]]

package ifneeded selenium 4.0.0 "
                    [list source [file join $dir commands.tcl]]
					[list source [file join $dir exceptions.tcl]]
					[list source [file join $dir by.tcl]]
					[list source [file join $dir keys.tcl]]
                    [list source [file join $dir mouse_buttons.tcl]]
					[list source [file join $dir desired_capabilities.tcl]]
					[list source [file join $dir application_cache.tcl]]
					[list source [file join $dir http_templates_of_webdriver_protocol.tcl]]
					[list source [file join $dir remote_connection.tcl]]
					[list source [file join $dir error_handler.tcl]]
                    [list source [file join $dir mixin_for_element_retrieval.tcl]]
                    [list source [file join $dir mixin_for_scrolling.tcl]]
                    [list source [file join $dir mixin_for_mouse_interaction.tcl]]
                    [list source [file join $dir webelement.tcl]]
                    [list source [file join $dir container_of_webelements.tcl]]
                    [list source [file join $dir select_element.tcl]]
					[list source [file join $dir webdriver.tcl]]
					[list source [file join $dir wait.tcl]]
					[list source [file join $dir expected_condition.tcl]]
                    [list source [file join $dir version.tcl]]"
                    
package ifneeded selenium::chrome 0.1 [list source [file join $dir webdrivers chrome.tcl]]
package ifneeded selenium::chromium 0.1 [list source [file join $dir webdrivers chromium.tcl]]
package ifneeded selenium::opera 0.1 [list source [file join $dir webdrivers opera.tcl]]
package ifneeded selenium::phantomjs 0.1 [list source [file join $dir webdrivers phantomjs.tcl]]
package ifneeded selenium::ie 0.1 [list source [file join $dir webdrivers ie.tcl]]

package ifneeded selenium::firefox 0.1 [list source [file join $dir webdrivers firefox webdriver.tcl]]
package ifneeded selenium::firefox::profile 0.1 [list source [file join $dir webdrivers firefox profile.tcl]]
package ifneeded selenium::firefox::manifest 0.1 [list source [file join $dir webdrivers firefox manifest.tcl]]
