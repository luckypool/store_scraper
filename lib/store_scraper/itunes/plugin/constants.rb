module StoreScraper
  module Itunes
    module Constants
      require 'yaml'

      PROFECT_ROOT = File.expand_path('../../../../../', __FILE__)

      URL_PREFIX = 'https://itunes.apple.com'.freeze

      MAX_LIMIT = 200

      DEFAULT_COUNTRY   = 'jp'.freeze
      DEFAULT_FEED_TYPE = 'topgrossingapplications'.freeze

      COUNTRY_TABLE  = YAML.load_file("#{PROFECT_ROOT}/config/country_table.yaml").freeze
      COUNTRIES      = COUNTRY_TABLE.keys
      FEED_TYPES     = YAML.load_file("#{PROFECT_ROOT}/config/feed_types.yaml").freeze
      GENRE_ID_TABLE = YAML.load_file("#{PROFECT_ROOT}/config/genre_id_table.yaml").freeze
    end
  end
end
