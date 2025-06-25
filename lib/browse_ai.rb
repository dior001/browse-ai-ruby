require 'browse_ai/version'

module BrowseAi
  autoload :Client, 'browse_ai/client'
  autoload :DSL, 'browse_ai/dsl'
  autoload :Resources, 'browse_ai/resources'
  autoload :Errors, 'browse_ai/errors'
  autoload :Utils, 'browse_ai/utils'

  class << self
    # @return [String]
    attr_accessor :api_key
    attr_accessor :url, :logger
  end

  self.url = 'https://api.browse.ai/v2/'

  module_function

  # @return [BrowseAi::Client]
  def client
    @client ||= Client.new(BrowseAi.api_key, BrowseAi.url)
  end
end
