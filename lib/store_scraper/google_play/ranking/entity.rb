module StoreScraper
  module GooglePlay
    class Ranking
      class Entity
        attr_reader :rank
        attr_reader :raw_element

        def initialize(raw_element)
          @raw_element = raw_element
        end

        def id
          raw_element.attr('data-docid').value
        end

        def title
          raw_element.at_css('.title').attr('title').value
        end

        def publisher
          raw_element.at_css('.subtitle').attr('title').value
        end

        def link
          ::StoreScraper::GooglePlay::Constants::URL_PREFIX + raw_element.at_css('.card-click-target').attr('href').value
        end

        def summary
          raw_element.at_css('.description').inner_text.gsub(/^ +/, '').gsub(/ +$/, '')
        end

        def rank
          raw_element.at_css('.title').inner_text.delete(' ').match(/^(\d+)/)[0].to_i
        end
      end
    end
  end
end
