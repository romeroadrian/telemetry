# Stub all requests to ElasticSearch
RSpec.configure do |config|
  config.before(:each) do
    stub_request(:any, /localhost:9200/)
  end
end
