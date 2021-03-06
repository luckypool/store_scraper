require 'spec_helper'

describe StoreScraper::Itunes::Validator do
  class ItunesValidatorTest
    include StoreScraper::Itunes::Constants
    include StoreScraper::Itunes::Validator
  end

  let!(:instance) do
    ItunesValidatorTest.new
  end

  describe '#validate_country' do
    it { expect { instance.validate_country('hoge') }.to raise_error(StoreScraper::Itunes::Validator::InvalidCountryError) }
  end

  describe '#validate_feed_type' do
    it { expect { instance.validate_feed_type('hoge') }.to raise_error(StoreScraper::Itunes::Validator::InvalidFeedTypeError) }
  end

  describe '#validate_limit' do
    it { expect { instance.validate_limit(0) }.to raise_error(StoreScraper::Itunes::Validator::InvalidLimitError) }
    it { expect { instance.validate_limit(201) }.to raise_error(StoreScraper::Itunes::Validator::InvalidLimitError) }
  end

  describe '#validate_genre' do
    it { expect(instance.validate_genre('hoge')).to be nil }
    it { expect(instance.validate_genre('games')).to be 6014 }
  end
end
