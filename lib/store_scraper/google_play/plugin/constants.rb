module StoreScraper
  module GooglePlay
    module Constants
      URL_PREFIX = 'https://play.google.com'.freeze

      CATEGORY_TYPES = %(GAME).freeze
      RANKING_TYPES  = %w(topselling_free
                          topselling_paid
                          topgrossing).freeze

      DEFAULT_CATEGORY_TYPE = 'GAME'.freeze
      DEFAULT_RANKING_TYPE  = 'topgrossing'.freeze

      MAX_LIMIT = 200
    end
  end
end
