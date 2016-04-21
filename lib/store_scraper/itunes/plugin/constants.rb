module StoreScraper
  module Itunes
    module Constants
      require 'yaml'

      URL_PREFIX = 'https://itunes.apple.com'.freeze

      MAX_LIMIT = 200

      DEFAULT_COUNTRY   = 'jp'.freeze
      DEFAULT_FEED_TYPE = 'topgrossingapplications'.freeze

      COUNTRY_TABLE  = YAML.load_file('config/country_table.yaml').freeze
      COUNTRIES      = COUNTRY_TABLE.keys
      FEED_TYPES     = YAML.load_file('config/feed_types.yaml').freeze
      GENRE_ID_TABLE = YAML.load_file('config/genre_id_table.yaml').freeze
    end
  end
end
