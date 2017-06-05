require 'yaml'

def get_data(data_file)
  begin
    YAML::load_file(data_file)
  rescue => e
    raise "Error reading #{data_file}: #{e}"
  end
end  

def process(data_file)
  data = get_data(data_file)
  data.values.inject(0){|s,v| s += v}
end