require 'w3c/dom'

module Vigilem
module DOM
  
  class << self
    attr_writer :strict
    # controls checking of various values
    # @return [TrueClass||FalseClass]
    def strict
      @strict ||= true
    end
  end
  
  KeyValues = ::W3C::DOM3::KeyValues
  CodeValues = ::W3C::DOM3::CodeValues
  
  Event = ::W3C::DOM4::Event
  
  UIEvent = ::W3C::DOM3::UIEvent
  
  require 'vigilem/dom/keyboard_event'
  
end
end

require 'vigilem/dom/utils'