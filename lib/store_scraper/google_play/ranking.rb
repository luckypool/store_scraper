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

      def all
        @all || _all
      end

      def _all
        return @card_list unless @card_list.nil?
        @card_list = []
        @card_list.concat(card_list) until @card_list.size >= limit
        @card_list
      end

      def card_list
        response = @client.get(build_path)
        @start += @num
        document = Oga.parse_html(response.body.force_encoding("utf-8"))
        document.at_css('.card-list')
                .children
                .select { |element| element.class == Oga::XML::Element }
                .map { |element| Entity.new(element) }
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
        @id_index ||= all.group_by(&:id)
      end
    end
  end
end
