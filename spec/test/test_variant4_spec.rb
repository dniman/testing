require './test'
require 'fakefs/safe'

RSpec.describe  "test_variant4_spec.rb" do

  describe "#get_data" do
    let(:path) { File.expand_path('../../tmp', __FILE__) }
    before(:each) do 
      FakeFS.activate! 
      FakeFS::FileSystem.clone(path)
    end

    after(:each) { FakeFS.deactivate! }

    it "loads yaml file" do
      File.write("#{path}/good.yml", "a: 1\nb: 2\nc: 3")
      expect(get_data("#{path}/good.yml")).to eq({"a" => 1, "b" => 2, "c" => 3})
    end

    it "raises an error if yml-file is badly formatted" do
      File.write("#{path}/bad.yml", "a: 1\nb: 2\nc: 3\n$")
      expect { get_data("#{path}/bad.yml") }.to raise_error(RuntimeError, /Error reading /)
    end
  end

end  