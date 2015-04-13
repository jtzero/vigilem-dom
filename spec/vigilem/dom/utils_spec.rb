require 'vigilem/dom/utils' 

describe Vigilem::DOM::Utils do
  describe '::name_codes' do
    it 'is a map of common strings to DOM values' do
      expect(described_class::name_codes.keys.map(&:class).uniq).to contain_exactly(String)
      expect(described_class::name_codes.values.map(&:class).uniq).to contain_exactly(Fixnum)
    end
  end
  
  describe '::codes_regex' do
    it 'it is a map of common patterns to DOM values' do
      expect(described_class::codes_regex.keys.map(&:class).uniq).to contain_exactly(Fixnum)
      expect(described_class::codes_regex.values.map(&:class).uniq).to contain_exactly(Regexp)
    end
  end
  
  describe '::common_str_to_dom_location' do
    it 'converts some common strings to DOM Location Codes' do
      expect(described_class::common_str_to_dom_location('L')).to eql(1)
    end
  end
  
  shared_examples '::to_dom_location_common_str' do
    it 'converts some common strings to DOM Location Codes' do
      expect(described_class::to_dom_location_common_str(1)).to eql('L')
    end
    
    it 'defaults to empty String' do
      expect(described_class::to_dom_location_common_str(nil)).to eql('')
    end
  end
  
  describe '::to_dom_location_common_str' do
    it_behaves_like '::to_dom_location_common_str'
  end
  
  describe '::dom_location_to_common_str' do
    it_behaves_like '::to_dom_location_common_str'
  end
  
  it 'creates a shortcut constant' do
    expect(Object.const_get(:VDOM)).to eql(Vigilem.const_get(:DOM))
  end
end
