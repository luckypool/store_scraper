module StoreScraper::Itunes
  class Ranking

    class InvalidCountryError < StandardError; end
    class InvalidFeedTypeError < StandardError; end
    class InvalidLimitError < StandardError; end

    module Validator
      def validate_initialize_args(args)
        @country   = validate_country(args[:country])
        @feed_type = validate_feed_type(args[:feed_type])
        @limit     = validate_limit(args[:limit])
        @genre     = validate_genre(args[:genre])
      end

      def validate_country(country)
        return country if ::StoreScraper::Itunes::Ranking::COUNTRIES.include?(country)
        fail InvalidCountryError.new("'#{country}' is unknown.")
      end

      def validate_feed_type(feed_type)
        return feed_type if ::StoreScraper::Itunes::Ranking::FEED_TYPES.include?(feed_type)
        fail InvalidFeedTypeError.new("#{feed_type} is unknown.")
      end

      def validate_limit(limit)
        return limit if limit.to_i.between?(1, ::StoreScraper::Itunes::Ranking::MAX_LIMIT)
        fail InvalidLimitError.new("#{limit} is out of range.")
      end

      def validate_genre(genre)
        # allow nil
        ::StoreScraper::Itunes::Ranking::GENRE_ID_TABLE[genre]
      end
    end
  end
end
