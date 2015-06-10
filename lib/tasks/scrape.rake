data_filepath = "#{root_dir}/tmp/data.json"

desc 'Pull the data from the internet, save it to a local file'
task 'scrape' do
  require_relative 'services/scrape'
  Scrape.call data_filepath
end

