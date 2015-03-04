#http://www.w3.org/TR/DOM-Level-2-Events/idl/events.idl
require 'w3c/dom4/event'

describe W3C::DOM4::Event do
  
  describe 'constants' do 
    it 'will equal the value given in the dom spec' do
      expect(described_class::NONE).to eql(0)
      expect(described_class::CAPTURING_PHASE).to eql(1)
      expect(described_class::AT_TARGET).to eql(2)
      expect(described_class::BUBBLING_PHASE).to eql(3)
    end
  end
  
  describe 'read only attributes' do
    it %q(aren't allowed to be updated) do
      host = described_class.new('str')
      expect(
        described_class.instance_variable_get(:@attrs).map do |attr|
          begin
            host.public_send(:"#{attr}=", 'anything')
          rescue StandardError => e
            e
          end
        end
      ).to all(be_a NoMethodError)
    end
  
  end
  
end