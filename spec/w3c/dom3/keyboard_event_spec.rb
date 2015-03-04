require 'ostruct'

require 'w3c/dom4/event'

require 'w3c/dom3/ui_event'

require 'w3c/dom3/keyboard_event'

describe W3C::DOM3::KeyboardEvent do
  
  
  describe described_class::KeyLocations do
    it 'will match the w3c specs' do
      expect(described_class::DOM_KEY_LOCATION_STANDARD).to eql(0x00)
      expect(described_class::DOM_KEY_LOCATION_LEFT).to eql(0x01)
      expect(described_class::DOM_KEY_LOCATION_RIGHT).to eql(0x02)
      expect(described_class::DOM_KEY_LOCATION_NUMPAD).to eql(0x03)
    end
  end
  
  describe 'read only attributes' do
    it %q(aren't allowed to be updated) do
      event = described_class.new('str')
      expect(
        described_class.instance_variable_get(:@attrs).map do |attr|
          begin
            event.public_send(:"#{attr}=", 'anything')
          rescue StandardError => e
            e
          end
        end
      ).to all(be_a NoMethodError)
    end
  
  end
  
  describe '#getModifierState' do
    event = described_class.new('str', keyModifierStateNumLock: true)
    
    it 'returns the status of passed in key name, at the time the event was fired' do
      expect(event.getModifierState('NumLock')).to be_truthy
    end
    
  end
  
  describe '::new/initialize' do
    it 'errors if key have a value and code is empty' do
      expect do
        described_class.new('keyup', key: 'a', location: 0, repeat: false)
      end.to raise_error(ArgumentError)
    end
  end
  
end
