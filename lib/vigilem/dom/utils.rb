require 'vigilem/dom/keyboard_event'

module Vigilem
module DOM
  # @author jtzero
  # 
  # useful dom mapping methods
  module Utils
    
    # 
    # @return [Hash<String, Integer>]
    def name_codes
      @name_codes ||= Hash.new(KeyboardEvent::DOM_KEY_LOCATION_STANDARD).merge({
        'L' => KeyboardEvent::DOM_KEY_LOCATION_LEFT,
        'R' => KeyboardEvent::DOM_KEY_LOCATION_RIGHT,
        'NUMPAD' => KeyboardEvent::DOM_KEY_LOCATION_NUMPAD,
        'KP' => KeyboardEvent::DOM_KEY_LOCATION_NUMPAD
      })
    end
    
    # 
    # @return [Hash<Integer, Regexp>
    def codes_regex
      @codes_regex ||= { KeyboardEvent::DOM_KEY_LOCATION_LEFT => /left/i, 
                         KeyboardEvent::DOM_KEY_LOCATION_RIGHT => /right/i,
                         KeyboardEvent::DOM_KEY_LOCATION_NUMPAD => /numpad/i,
                         }
    end
    
    # @todo   rename dom_location_to_common_str
    # @param  [Integer] dom_location_code
    # @return [String]
    def to_dom_location_common_str(dom_location_code)
      (@code_names ||= name_codes.invert.tap {|obj| obj.default = '' })[dom_location_code]
    end
    
    #
    # @param  [String<'L', 'R', 'NUMPAD', 'KP', Object>] location
    # @return [Integer]
    def common_str_to_dom_location(location)
      name_codes[location]
    end
    
    extend self
  end
end
end

VDOM = ::Vigilem::DOM
