require 'spec_helper'

require 'vigilem/dom'

describe Vigilem::DOM::KeyboardEvent do
  
  subject { described_class.new('keyup', key: 'a', code: 'KeyA', location: 0, repeat: false) }
  
  describe '::new/initialization' do
    
    it 'sets the default modifier_state' do
      
      expect(subject.send(:modifier_state)).to eql({ "Accel"=>false, 
                      "Alt"=>false, "AltGraph"=>false, "CapsLock"=>false, 
                      "Control"=>false, "Fn"=>false, "FnLock"=>false, 
                      "Hyper"=>false, "Meta"=>false, "NumLock"=>false, 
                      "OS"=>false, "ScrollLock"=>false, "Shift"=>false, 
                      "Super"=>false, "Symbol"=>false, "SymbolLock"=>false})
    end
    
    it 'sets up the key by the argument' do
      expect(subject.key).to eql('a')
    end
    
    it 'sets up the code' do
      expect(subject.code).to eql('KeyA')
    end
    
    it 'sets up location by the argument' do
      expect(subject.location).to eql(0)
    end
    
    it 'sets up ctrlKey by defaults' do
      expect(subject.ctrlKey).to eql(false)
    end
    
    it 'sets up shiftKey by defaults' do
      expect(subject.shiftKey).to eql(false)
    end
    
    it 'sets up altKey by defaults' do
      expect(subject.altKey).to eql(false)
    end
    
    it 'sets up metaKey by defaults' do
      expect(subject.metaKey).to eql(false)
    end
    
    it 'sets up repeat by args' do
      expect(subject.repeat).to eql(false)
    end
    
  end
  
  describe '#copy_to' do
    it 'copies the existing keyboard event and converts it the type passed in' do
      expect(subject.copy_to('keydown').key).to eql('a')
    end
  end
  
end