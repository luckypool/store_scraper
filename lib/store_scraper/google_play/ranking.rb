require 'store_scraper/google_play/ranking/entity'

require 'oga'

module StoreScraper
  module GooglePlay
    class Ranking
      include Constants
      include Validator
      attr_reader :client, :start, :num
      attr_reader :category_type, :ranking_type, :limit

      def initialize(category_type: DEFAULT_CATEGORY_TYPE, ranking_type: DEFAULT_RANKING_TYPE, limit: MAX_LIMIT)
        validate_initialize_args(category_type: category_type, ranking_type: ranking_type, limit: limit)
        @client = ::StoreScraper::Client.new(URL_PREFIX)
        reset_start_num
      end

      def fetch_document
      end

      def card_list
        response = @client.get(build_path)
        @start += @num
        document = Oga.parse_html(response.body.force_encoding("utf-8"))
        card_list = document.at_css('.card-list').children.select { |element| element.class == Oga::XML::Element }
        card_list.map { |element| Entity.new(element) }
      end

      def build_path
        if category_type.nil?
          "/store/apps/collection/#{ranking_type}?start=#{start}&num=#{num}"
        else
          "/store/apps/category/#{category_type}/collection/#{ranking_type}?start=#{start}&num=#{num}"
        end
      end

      def reset_start_num
        @start = 0
        @num   = 60
      end

      private

      def parse_document
        @card_list = @document.at_css('.card-list > .card')
      end
    end
  end
end
