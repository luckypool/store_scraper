module StoreScraper
  module Itunes
    class Ranking
      class Entry
        attr_reader :id, :title, :bundle_id, :category, :image, :publisher, :link, :summary
        attr_reader :rank
        def initialize(raw_entry, rank)
          @id        = raw_entry.id.attributes['im:id'].to_i
          @title     = raw_entry['im:name'].label
          @bundle_id = raw_entry.id.attributes['im:bundleId']
          @category  = raw_entry.category.attributes.label
          @image     = raw_entry['im:image'].first.label
          @publisher = raw_entry['im:artist'].label
          @link      = raw_entry.link.attributes.href
          @summary   = raw_entry.summary.label
          @rank      = rank
        end
      end
    end
  end
end
