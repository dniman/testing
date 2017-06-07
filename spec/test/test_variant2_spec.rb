require './test'

RSpec.describe  "test_variant2_spec.rb" do
  describe "#get_data" do
    it "loads yaml file" do
      expect(get_data('spec/fixtures/good.yml')).to eq({'a' => 1, 'b' => 2, 'c' => 3})
    end

    it "raises an error if yml-file is badly formatted" do
      expect { get_data('spec/fixtures/bad.yml') }.to raise_error(RuntimeError, /Error reading /)
    end
  end
end  