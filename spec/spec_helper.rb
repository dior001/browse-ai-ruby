require 'webmock/rspec'
require 'browse_ai'
require 'vcr'
include BrowseAi::Resources

APP_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..'))
cnf = YAML.load_file(File.join(APP_ROOT, 'config/gem_secret.yml'))
browse_ai_api_key = cnf['browse_ai_api_key']

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
  c.filter_sensitive_data('<BROWSE_AI_API_KEY>') { browse_ai_api_key }
end

RSpec.configure do |config|
  config.before do
    BrowseAi.api_key = browse_ai_api_key
  end
end
