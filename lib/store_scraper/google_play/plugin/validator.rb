module StoreScraper
  module GooglePlay
    module Validator
      class InvalidCategoryTypeError < StandardError; end
      class InvalidRankingTypeError  < StandardError; end
      class InvalidLimitTypeError    < StandardError; end

      def validate_initialize_args(args)
        @category_type = validate_category_type(args[:category_type])
        @ranking_type  = validate_ranking_type(args[:ranking_type])
        @limit         = validate_limit(args[:limit])
      end

      def validate_category_type(category_type)
        return category_type if ::StoreScraper::GooglePlay::Constants::CATEGORY_TYPES.include?(category_type)
        raise InvalidCategoryTypeError, "'#{category_type}' is unknown."
      end

      def validate_ranking_type(ranking_type)
        return ranking_type if ::StoreScraper::GooglePlay::Constants::RANKING_TYPES.include?(ranking_type)
        nil
      end

      def validate_limit(limit)
        return limit if limit.to_i.between?(1, ::StoreScraper::GooglePlay::Constants::MAX_LIMIT)
        raise InvalidLimitError, "#{limit} is out of range."
      end
    end
  end
end
