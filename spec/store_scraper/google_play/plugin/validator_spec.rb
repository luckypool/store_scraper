require 'spec_helper'

describe StoreScraper::GooglePlay::Validator do
  class GooglePlayValidatorTest
    include StoreScraper::GooglePlay::Constants
    include StoreScraper::GooglePlay::Validator
  end

  let!(:instance) do
    GooglePlayValidatorTest.new
  end

  describe '#validate_category_type' do
    it { expect { instance.validate_category_type('hoge') }.to raise_error(StoreScraper::GooglePlay::Validator::InvalidCategoryTypeError) }
  end

  describe '#validate_limit' do
    it { expect { instance.validate_limit(0) }.to raise_error(StoreScraper::GooglePlay::Validator::InvalidLimitError) }
    it { expect { instance.validate_limit(201) }.to raise_error(StoreScraper::GooglePlay::Validator::InvalidLimitError) }
  end
end
