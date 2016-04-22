require 'spec_helper'

describe StoreScraper::Itunes::Ranking do
  let!(:instance) do
    StoreScraper::Itunes::Ranking.new(limit: 1)
  end

  let(:mocked_body) do
    File.read('spec/mock_responses/ranking_response.json')
  end

  describe '#new' do
    it { expect(instance).to be_an_instance_of StoreScraper::Itunes::Ranking }
    it 'has StoreScraper::Client' do
      expect(instance.client).to be_an_instance_of StoreScraper::Client
    end
  end

  describe '#all' do
    before do
      WebMock.stub_request(:get, "https://itunes.apple.com/jp/rss/topgrossingapplications/limit=1/json")
             .with(headers: { 'Accept' => '*/*', 'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent' => 'Faraday v0.9.2' })
             .to_return(status: 200, body: mocked_body, headers: { 'Content-Type' => 'text/javascript' })
    end

    it { expect(instance.all).to be_an_instance_of Array }
    it { expect(instance.all.first).to be_an_instance_of StoreScraper::Itunes::Ranking::Entity }
  end
end
