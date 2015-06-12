root_dir      = File.expand_path '../../', __dir__
data_filepath = "#{root_dir}/tmp/data.json"


desc 'Pull the data from the internet, save it to a local file'
task 'scrape' do
  require_relative 'scripts/scrape'
  Scrape.call data_filepath
end
