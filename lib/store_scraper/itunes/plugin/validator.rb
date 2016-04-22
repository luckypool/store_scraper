require 'store_scraper/itunes/plugin/constants'

module StoreScraper
  module Itunes
    module Validator
      class InvalidCountryError < StandardError; end
      class InvalidFeedTypeError < StandardError; end
      class InvalidLimitError < StandardError; end

      def validate_initialize_args(args)
        @country   = validate_country(args[:country])
        @feed_type = validate_feed_type(args[:feed_type])
        @limit     = validate_limit(args[:limit])
        @genre     = validate_genre(args[:genre])
      end

      def validate_country(country)
        return country if ::StoreScraper::Itunes::Constants::COUNTRIES.include?(country)
        raise InvalidCountryError, "'#{country}' is unknown."
      end

      def validate_feed_type(feed_type)
        return feed_type if ::StoreScraper::Itunes::Constants::FEED_TYPES.include?(feed_type)
        raise InvalidFeedTypeError, "#{feed_type} is unknown."
      end

      def validate_limit(limit)
        return limit if limit.to_i.between?(1, ::StoreScraper::Itunes::Constants::MAX_LIMIT)
        raise InvalidLimitError, "#{limit} is out of range."
      end

      def validate_genre(genre)
        # allow nil
        ::StoreScraper::Itunes::Constants::GENRE_ID_TABLE[genre]
      end
    end
  end
end
