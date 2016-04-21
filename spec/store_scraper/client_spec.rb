require 'spec_helper'

describe StoreScraper::Client do
  let!(:instance) do
    url = StoreScraper::Itunes::Constants::URL_PREFIX
    StoreScraper::Client.new(url)
  end
  describe '#new' do
    it { expect(instance).to be_an_instance_of StoreScraper::Client }
    it 'has Farada::Connection' do
      expect(instance.client).to be_an_instance_of Faraday::Connection
    end
  end
end
