module StoreScraper::Itunes
  class App
    include Constants
    include Validator

    attr_reader :country, :client

    # https://affiliate.itunes.apple.com/resources/documentation/itunes-store-web-service-search-api/
    # ex.) https://itunes.apple.com/lookup?id=284910350
    def initialize(country = 'jp')
      @country = validate_country(country)
      @client  = ::StoreScraper::Client.new(URL_PREFIX)
    end

    def find(id = 658511662) # モンスト
      path = build_path(id)
      response = client.get(path)
      response.body
    end

    def build_path(id)
      "/#{country}/lookup?id=#{id}"
    end
  end
end
