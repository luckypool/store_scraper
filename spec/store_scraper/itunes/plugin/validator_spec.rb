require 'spec_helper'

describe StoreScraper::Itunes::Validator do
  class ValidatorTest
    include StoreScraper::Itunes::Constants
    include StoreScraper::Itunes::Validator
  end

  let!(:instance) do
    ValidatorTest.new
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
end
