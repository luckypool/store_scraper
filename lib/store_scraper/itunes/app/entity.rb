module StoreScraper
  module Itunes
    class App
      class Entity
        attr_reader :raw

        def initialize(raw)
          @raw = raw
        end
      end
    end
  end
end
