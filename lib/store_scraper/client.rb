require 'hashie'
require 'faraday'
require 'faraday_middleware'

module StoreScraper
  class Client
    attr_reader :client

    def initialize(url)
      @client = Faraday.new(url: url) do |faraday|
        faraday.request  :url_encoded
        # faraday.response :logger
        faraday.response :xml, content_type: /\bxml/
        faraday.response :mashify, content_type: /\b(json|javascript)/
        faraday.response :json, content_type: /\b(json|javascript)/
        faraday.adapter Faraday.default_adapter
      end
    end

    def get(path)
      client.get(path)
    end
  end
end
