require 'w3c/dom3/ui_event'

describe W3C::DOM3::UIEvent do
  
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