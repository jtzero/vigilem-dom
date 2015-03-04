module W3C
module DOM4
  #
  # http://www.w3.org/TR/2014/WD-dom-20140710/#interface-event
  class Event
    NONE            = 0;
    CAPTURING_PHASE = 1;
    AT_TARGET       = 2;
    BUBBLING_PHASE  = 3;
    
    # 
    # @param  [String] type
    # @param  [Hash] eventInitDict
    def initialize(type, eventInitDict={})
      @type = type
      @bubbles = eventInitDict[:bubbles] || false
      @cancelable = eventInitDict[:cancelable] || false
      @timeStamp = Time.now.to_i
      @isTrusted = true
    end
    
   private
                                                                                                   # Unforgeable
    @attrs = [:type, :target, :currentTarget, :eventPhase, :bubbles, :cancelable, :defaultPrevented, :isTrusted, :timeStamp]
    
   public 
    attr_reader *@attrs
    
    def stopPropagation() end
    def stopImmediatePropagation() end
    def preventDefault() end
    
  end
end
end
