require 'vigilem/support/core_ext'

module W3C
module DOM3
  # @todo Is this currently done correctly/could it be better? When true, implementations must also initialize 
  #       the event object's key modifier 
  #       state such that calls to the MouseEvent.getModifierState() or 
  #       KeyboardEvent.getModifierState() when provided with either the parameter 'Control' 
  #       or the parameter 'Accel' must return true.
  # http://www.w3.org/TR/2014/WD-DOM-Level-3-Events-code-20140612/
  # http://www.w3.org/TR/2014/WD-DOM-Level-3-Events-key-20140612/
  # 
  # http://www.w3.org/TR/2014/WD-DOM-Level-3-Events-20140925/#idl-def-KeyboardEvent
  # 
  # https://developer.mozilla.org/en-US/docs/Web/API/KeyboardEvent.code
  class KeyboardEvent < UIEvent
    
    module KeyLocations
      DOM_KEY_LOCATION_STANDARD = 0x00
      DOM_KEY_LOCATION_LEFT     = 0x01
      DOM_KEY_LOCATION_RIGHT    = 0x02
      DOM_KEY_LOCATION_NUMPAD   = 0x03
    end
    
    include KeyLocations
    
    # KeyboardEventInit : SharedKeyboardAndMouseEventInit
    # @param [String] typeArg
    # @param [Hash] keyboardEventInitDict
    # @option  keyboardEventInitDict
    def initialize(typeArg, keyboardEventInitDict={})
      @key = keyboardEventInitDict[:key] || ''
      
      if (not @key.empty?) and keyboardEventInitDict[:code].to_s.empty?
        raise ArgumentError, "keyboardEventInitDict[:key] has a value `#{keyboardEventInitDict[:key]}' while keyboardEventInitDict[:code] is `nil'"
      end
      
      @code = keyboardEventInitDict[:code] || ''
      
      @location = keyboardEventInitDict[:location] || 0
      @repeat = keyboardEventInitDict[:repeat] || false
      @isComposing = keyboardEventInitDict[:isComposing] || false
      
      @modifier_state = Hash[DOM3::KeyValues::ModifierKeys.zip([!!keyboardEventInitDict[:ctrlKey],
                        !!keyboardEventInitDict[:altKey],
                        !!keyboardEventInitDict[:keyModifierStateAltGraph],
                        !!keyboardEventInitDict[:keyModifierStateCapsLock],
                        !!keyboardEventInitDict[:ctrlKey],
                        !!keyboardEventInitDict[:keyModifierStateFn],
                        !!keyboardEventInitDict[:keyModifierStateFnLock],
                        !!keyboardEventInitDict[:keyModifierStateHyper],
                        !!keyboardEventInitDict[:metaKey],
                        !!keyboardEventInitDict[:keyModifierStateNumLock],
                        !!keyboardEventInitDict[:keyModifierStateOS],
                        !!keyboardEventInitDict[:keyModifierStateScrollLock],
                        !!keyboardEventInitDict[:shiftKey],
                        !!keyboardEventInitDict[:keyModifierStateSuper],
                        !!keyboardEventInitDict[:keyModifierStateSymbol],
                        !!keyboardEventInitDict[:keyModifierStateSymbolLock]])]
      @modifier_state.default = false
      @modifier_state.freeze
      super(typeArg, keyboardEventInitDict)
    end
    
   private
    
    # attrs and modifier_state
    @modifer_attrs = [:ctrlKey, :shiftKey, :altKey, :metaKey]
    
    @dom_3_attrs = [:key, :code, :location, :repeat, :isComposing] + @modifer_attrs
    # Legacy, introduced in DOM Level 3:
    @attrs = @dom_3_attrs + [:charCode, :keyCode, :which]
    
   public
    attr_reader *@attrs
    
    # defines methods for the modifiers that are also
    # attr's
    @modifer_attrs.each do |attr|
      if attr == :ctrlKey
        define_method(attr) do
          instance_variable_get(:@modifier_state)['Control']
        end
      else
        define_method(attr) do
          instance_variable_get(:@modifier_state)[attr.to_s.gsub(/key/i, '').titlecase]
        end
      end
    end
    
    # Queries the state of a modifier using a key value.
    # 
    # @param  [String] keyArg A modifier key value
    # @return [TrueClass || FalseClass] 
    def getModifierState(keyArg)
      !!@modifier_state[keyArg]
    end
    
  end
end
end
