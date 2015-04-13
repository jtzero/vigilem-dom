require 'ostruct'

require 'w3c/dom4/event'

require 'w3c/dom3/ui_event'

require 'w3c/dom3/keyboard_event'

require 'w3c/dom3/key_values'

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
    
    [:altKey, :keyModifierStateAltGraph, :keyModifierStateCapsLock, :ctrlKey, 
      :keyModifierStateFn, :keyModifierStateFnLock, :keyModifierStateHyper, :metaKey, 
      :keyModifierStateNumLock, :keyModifierStateOS, :keyModifierStateScrollLock, 
      :shiftKey, :keyModifierStateSuper, :keyModifierStateSymbol, 
                        :keyModifierStateSymbolLock].zip(W3C::DOM3::KeyValues::ModifierKeys - ['Accel']).each do |keid_name, mod_name|
      it "returns true on `#{mod_name}' when `keyboardEventInitDict[:#{keid_name}] == true' is passed in the constructor" do
        expect(described_class.new('keydown', keid_name => true).getModifierState(mod_name)).to be_truthy
      end
    end
    
  end
  
  describe 'boolean attribute values' do
    [:ctrlKey, :shiftKey, :altKey, :metaKey, :repeat, :isComposing].each do |attr_name|
      describe "##{attr_name}" do
        it "is truthy when `:#{attr_name}=>true' is passed in to the contructor" do
          expect(described_class.new('keydown', attr_name => true).public_send(attr_name)).to be_truthy
        end
      end
    end
    
    let(:event) do
      described_class.new('keydown', {:key => 'A', :code => 'KeyA', :location => 1})
    end
    
    {:key => 'A', :code => 'KeyA', :location => 1}.each do |k, v|
      describe "##{k}" do
        it 'returns the value passed in on the method by the same name' do
          expect(event.public_send(k)).to eql(v)
        end
      end
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
