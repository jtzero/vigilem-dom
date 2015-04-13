require 'vigilem/support/core_ext'

require 'vigilem/support/utils'

require 'vigilem/dom'

module Vigilem
module DOM
  # 
  # @see W3C::DOM3::KeyboardEvent
  class KeyboardEvent < ::W3C::DOM3::KeyboardEvent
    
    attr_reader :os_specific, :modifier_state #@todo, :chr
    
    # 
    # @see    #SharedKeyboardAndMouseEventInit
    # @param  [String || Symbol] type
    # @param  [Hash] options
    # @option [String] :key
    # @option [String] :code
    # @option [Hash] :location 
    # @option :location [Integer] 0x00 DOM_KEY_LOCATION_STANDARD
    # @option :location [Integer] 0x01 DOM_KEY_LOCATION_LEFT
    # @option :location [Integer] 0x02 DOM_KEY_LOCATION_RIGHT
    # @option :location [Integer] 0x03 DOM_KEY_LOCATION_NUMPAD
    # @option [TrueClass || FalseClass] repeat
    # @option[Hash] :modifiers || :modifier_state
    # @option modifiers [TrueClass || FalseClass || NilClass] :alt, :altKey
    # @option modifiers [TrueClass || FalseClass || NilClass] :alt_graph, :AltGraph
    # @option modifiers [TrueClass || FalseClass || NilClass] :caps_lock, :CapsLock
    # @option modifiers [TrueClass || FalseClass || NilClass] :control, :ctrl, :ctrlKey
    # @option modifiers [TrueClass || FalseClass || NilClass] :meta, :metaKey
    # @option modifiers [TrueClass || FalseClass || NilClass] :num_lock, :NumLock
    # @option modifiers [TrueClass || FalseClass || NilClass] :scroll, :scroll_lock
    # @option modifiers [TrueClass || FalseClass || NilClass] :shift, :shiftKey
    # @option modifiers [TrueClass || FalseClass || NilClass] :symbol, :symbol_lock
    # @param  [Hash] os_specific
    def initialize(type, options={})
      raise TypeError, "invalid type `#{type}'" if strict = Vigilem::DOM.strict and not self.class.types.include?(type)
      @type = type
      @key = options[:key] ||= ''
      if options[:location] and strict and (kl = KeyLocations).constants.none? {|const| kl.const_get(const) == options[:location] }
        raise ArgumentError, "invalid location `#{options[:location]}'" 
      end
      @location = options[:location] ||= 0
      @repeat = options[:repeat] ||= false
      @os_specific = self.class.hash_frozen_clone(options[:os_specific] || {})
      
      mod_state = if (usr_mod = options[:modifiers] || options[:modifier_state])
                    Support::Utils.deep_dup(usr_mod)
                  else
                    {}
                  end
      
      mod_dict = self.class.shared_keyboard_and_mouse_event_init(mod_state)
      
      super(type, mod_dict.merge(options))
    end
    
    @dom_3_attrs = ::W3C::DOM3::KeyboardEvent.instance_variable_get(:@dom_3_attrs) + ::W3C::DOM4::Event.instance_variable_get(:@attrs)
    
    # make ruby-esq versions `alt_key'
    @attrs = ::W3C::DOM3::KeyboardEvent.instance_variable_get(:@attrs) + ::W3C::DOM4::Event.instance_variable_get(:@attrs)
    
    @attrs.each do |method_name|
      
      snake_case = method_name.to_s.snakecase.to_sym
      
      snake_case = "#{snake_case}?" if snake_case[0..1] == 'is'
      
      alias_method snake_case, method_name
    end
    
    # 
    # @param  [#to_s] key_type
    # @return [KeyboardEvent]
    def copy_to(key_type)
      copy = Support::Utils.deep_dup(self)
      copy.instance_variable_set(:@type, key_type.to_s)
      copy
    end
    
    # has @type @key @location, so the object can be distinguised from other KeyboardEvents
    # @return [String]
    def to_s
      "#{super().chop} @type=#{@type.inspect} @key=#{@key.inspect} @location=#{location.inspect}>"
    end
    
    # 
    # @return [String]
    def inspect
      "<#{self.class}:0x#{self.object_id} #{instance_variables.map {|var| "#{var}=#{instance_variable_get(var).inspect}" }.sort_by {|name| name[1..2]}.join(' ')}>"
    end
    
    class << self
      
      # 
      # @return [Array<String>]
      def types
        @types ||= %w(keyup keypress keydown)
      end
      
      # this is not a hash so that the values can be #joined as a regex
      # the last value of each group is the DOM value without the prefix
      # @return [Array<Array<Symbol>>]
      def alternative_key_names
        @alternative_key_names ||= [[:alt, :menu, :altKey], [:alt_graph, :AltGraph], [:caps_lock, :CapsLock], [:ctrl, :control, :ctrlKey], 
                                    [:Fn], [:fn_lock, :FnLock], [:Hyper], [:meta, :metaKey], [:num_lock, :NumLock], [:OS], 
                                    [:scroll_lock, :ScrollLock], [:shift, :shiftKey], [:Super], [:Symbol], [:symbol_lock, :SymbolLock]]
      end
      
      # converts a common key to shared_keyboard_and_mouse_event_init_key
      # dom_3 are not prefixed by keyModifierState
      # @todo   rename to *_member
      # @param  [#to_s] key_name
      # @return [Symbol || NilClass]
      def shared_keyboard_and_mouse_event_init_key(key_name)
        key_group = alternative_key_names.find {|key_grp| /^(#{key_grp.join('|')})$/i =~ key_name.to_s }
        if key_group
          if @dom_3_attrs.include?(correct_key = key_group.last)
            correct_key 
          else
            "keyModifierState#{correct_key}".to_sym
          end
        end
      end
      
      # gets the keys for SharedKeyboardAndMouseEventInit 
      # @todo   rename to *_members
      # @return [Array<Symbol>]
      def shared_keyboard_and_mouse_event_init_keys
        shared_keyboard_and_mouse_event_init_keys ||= alternative_key_names.map do |key_grp| 
            if @dom_3_attrs.include?(correct_key = key_grp.last) 
              correct_key
            else
              "keyModifierState#{correct_key}".to_sym
            end
          end
      end
      
      # @todo move to new file 
      # @note for version WD-uievents-20150319 this is renamed to EventModifierInit and KeyboardEventInit
      # converts common names to SharedKeyboardAndMouseEventInit
      # @param  [Hash || Array] hsh_or_ary
      # @return [Hash]
      def SharedKeyboardAndMouseEventInit(hsh_or_ary)
        
        hsh = if hsh_or_ary.is_a?(Hash)
          hsh_or_ary
        else
          Hash[hsh_or_ary.zip([true] * hsh_or_ary.size)]
        end
        
        alternative_key_names.each_with_object({}) do |key_grp, out_hash|
          skamei_name = shared_keyboard_and_mouse_event_init_key(key_grp.last)
          matched_usr_key = hsh.keys.find {|usr_key| usr_key =~ /^(#{key_grp.join('|')}|#{skamei_name})$/i }
          out_hash[skamei_name] = !!hsh[matched_usr_key]
        end
      end
      
      alias_method :shared_keyboard_and_mouse_event_init, :SharedKeyboardAndMouseEventInit
    end
    
    # 
    # 
    # @return [Hash] 
    def modifier_state
      @modifier_state ||= Hash[DOM::KeyValues::ModifierKeys.zip([false] * DOM::KeyValues::ModifierKeys.size)].tap {|hsh| hsh.default = false }.freeze
    end
    
   private
    
    # @todo depricate
    # @param  [Hash] hsh_obj
    # @return [Hash] cloned obj
    def self.hash_frozen_clone(hsh_obj)
      hsh_obj.map.with_object({}) do |(key, value), hsh| 
        hsh[key] = value.clone rescue value
      end.freeze
    end
  end
end
end
