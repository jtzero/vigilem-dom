require 'w3c/dom4/event'

# 
# http://www.w3.org/TR/DOM-Level-3-Events/#idl-def-UIEvent
# 
module W3C
module DOM3
  class UIEvent < DOM4::Event
    
    # 
    # @param [String] type
    # @param [Hash] eventInitDict
    # @option :view unused
    # @option :detail unused
    # @return self
    def initialize(type, eventInitDict={})
      @view = eventInitDict[:view] || nil 
      @detail = eventInitDict[:detail] || 0
      super(type, eventInitDict)
    end
    
   private
    @attrs = [:view, :detail]
    attr_writer *@attrs
    
   public
    
    attr_reader *@attrs
  end
end
end
