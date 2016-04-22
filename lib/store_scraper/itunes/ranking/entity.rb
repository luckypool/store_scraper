module StoreScraper
  module Itunes
    class Ranking
      class Entity
        attr_reader :rank
        attr_reader :raw_entry

        def initialize(raw_entry, rank)
          @raw_entry = raw_entry
          @rank      = rank
        end

        def id
          raw_entry.id.attributes['im:id'].to_i
        end

        def title
          raw_entry['im:name'].label
        end

        def bundle_id
          raw_entry.id.attributes['im:bundleId']
        end

        def category
          raw_entry.category.attributes.label
        end

        def image
          raw_entry['im:image'].first.label
        end

        def publisher
          raw_entry['im:artist'].label
        end

        def link
          raw_entry.link.attributes.href
        end

        def summary
          raw_entry.summary.label
        end

        def to_hash
          attributes = %i(id title bundle_id category image publisher link summary)
          Hash[attributes.map { |key| [key.to_s, send(key)] }]
        end
      end
    end
  end
end
