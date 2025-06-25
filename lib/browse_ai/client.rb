require 'faraday'
require 'faraday/multipart'
require 'json'
require 'openssl'
require 'active_support/all'
require 'browse_ai/dsl'
require 'browse_ai/errors'
require 'browse_ai/utils'

module BrowseAi
  class Client
    include DSL
    include Errors
    include Utils

    REQUESTS = %i[get post put delete]
    HEADERS = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }

    def initialize(api_key = BrowseAi.api_key, url = BrowseAi.url)
      @api_key = api_key
      @url = url

      # Setup HTTP request connection to UpWoof.
      @connection ||= Faraday.new do |builder|
        builder.request :multipart
        builder.request :url_encoded
        builder.response :logger
        builder.adapter Faraday.default_adapter
      end
    end

    # @param [:get, :post, :put, :delete] method.
    # @param [String] path.
    # @param [Hash] query (optional).
    # @param [Hash] headers request headers (optional).
    # @raise [ArgumentError] If the response is blank.
    # @raise [ResourceNotFoundError] If the response code is 404.
    # @raise [ClientError] If the response code is not in the success range.
    # @return [Faraday::Response] server response.
    def request(method, path, query = {}, headers = {})
      headers.reverse_merge!(default_headers)

      unless REQUESTS.include?(method)
        raise ArgumentError,
              "Unsupported method #{method.inspect}. Only :get, :post, :put, :delete are allowed"
      end

      token_url = UrlHelper.build_url(path: "#{@url}#{path}")
      payload = nil
      if query.present?
        accept = headers.present? ? headers['Accept'] : nil
        payload = if accept.present? && accept == 'application/json'
                    JSON.generate(query)
                  else
                    query
                  end
      end
      response = @connection.run_request(method, token_url, payload, headers)

      case response.status.to_i
      when 200..299
        response
      when 404
        raise ResourceNotFoundError.new(response: response)
      else
        raise ClientError.new(response: response)
      end
    end

    def default_headers
      {
        'Accept' => 'application/json',
        'Content-Type' => 'application/json',
        'Authorization' => "Bearer #{@api_key}"
      }
    end
  end
end
