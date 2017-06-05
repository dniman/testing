require './test'

RSpec.describe "test_variant1_spec.rb" do
  describe "#get_data" do
    it "loads yaml file" do
      allow(YAML).to receive(:load_file).with('/some/file.yml').and_return({'a' => 1, 'b' => 2, 'c' => 3})
      expect(get_data('/some/file.yml')).to eq({'a' => 1, 'b' => 2, 'c' => 3})
    end

    it "raises an error if yml-file is badly formatted" do
      allow(YAML).to receive(:load_file).with('/some/file.yml').and_raise(RuntimeError)
      expect { get_data('/some/file.yml') }.to raise_error(RuntimeError, /Error reading /)
    end
  end

  describe "#process" do
    it "gets data from file" do
      data = {'a' => 1, 'b' => 2, 'c' => 3}
      expect_any_instance_of(Object).to receive(:get_data).with('/some/file.yml').and_return(data)
      process('/some/file.yml')
    end

    it "returns 6" do
      data = {'a' => 1, 'b' => 2, 'c' => 3}
      allow_any_instance_of(Object).to receive(:get_data).with('/some/file.yml').and_return(data)
      expect(process('/some/file.yml')).to eq(6)
    end
  end
end