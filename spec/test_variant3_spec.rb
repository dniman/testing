require './test'

RSpec.describe  "test_variant3_spec.rb" do
  let(:path) { File.expand_path('../tmp', __FILE__) }

  describe "#get_data" do
    it "loads yaml file" do
      File.write("#{path}/good.yml", "a: 1\nb: 2\nc: 3")

      allow(YAML).to receive(:load_file).with('spec/tmp/good.yml').and_return({'a' => 1, 'b' => 2, 'c' => 3})
      expect(load_file('spec/tmp/good.yml')).to eq({'a' => 1, 'b' => 2, 'c' => 3})

      FileUtils.rm_rf("#{path}/good.yml")
    end

    it "raises an error if yml-file is badly formatted" do
      File.write("#{path}/bad.yml", "a: 1\nb: 2\nc: 3\n$")

      allow(YAML).to receive(:load_file).with('spec/tmp/bad.yml').and_raise(RuntimeError, 'Error reading ')
      expect { load_file('spec/tmp/bad.yml') }.to raise_error(RuntimeError, /Error reading /)

      FileUtils.rm_rf("#{path}/bad.yml")
    end
  end
end  

def load_file(file)
  YAML.load_file(file)
end  