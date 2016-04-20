require "store_scraper/itunes/plugin/constants"
require "store_scraper/itunes/plugin/validator"
require "store_scraper/itunes/ranking/entry"

module StoreScraper::Itunes
  class Ranking
    include Constants
    include Validator

    attr_reader :path, :client
    attr_reader :country, :feed_type, :limit, :genre

    FETCH_TYPE = 'json'

    # See: RSS Generator, https://rss.itunes.apple.com/jp/
    # ex.) https://itunes.apple.com/jp/rss/topgrossingapplications/limit=10/xml
    def initialize(country: DEFAULT_COUNTRY, feed_type: DEFAULT_FEED_TYPE, limit: MAX_LIMIT, genre: :all)
      validate_initialize_args({country: country, feed_type: feed_type, limit: limit, genre: genre})
      @path   = build_path
      @client = ::StoreScraper::Client.new(URL_PREFIX)
    end

    def title
      fetch_feed.title.label
    end

    def raw_entries
      fetch_feed.entry
    end

    def all
      @entries ||= fetch_feed.entry.map.with_index(1) do |entry, rank|
        Entry.new(entry, rank)
      end
    end

    def find_by_rank(rank)
      all[rank - 1]
    end

    def find_by_id(id)
      found = id_index[id]
      return unless found
      found.first
    end

    private

    def id_index
      @id_index ||= all.group_by { |e| e.id }
    end

    def fetch_feed
      @response ||= @client.get(@path)
      @response.body.feed
    end

    def build_path
      prefix = "/#{country}/rss/#{feed_type}/limit=#{limit}"
      suffix = FETCH_TYPE
      option = genre.nil? ? nil : "genre=#{genre}"
      [prefix, option, suffix].compact.join("/")
    end
  end
end
