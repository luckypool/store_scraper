require 'spec_helper'

describe StoreScraper::GooglePlay::Ranking do
  let!(:instance) do
    StoreScraper::GooglePlay::Ranking.new(limit: 1)
  end

  let(:mocked_body) do
    File.read('spec/mock_responses/google_play_response.html')
  end

  before do
    WebMock.stub_request(:get, "https://play.google.com/store/apps/category/GAME/collection/topgrossing?num=60&start=0")
           .with(headers: { 'Accept' => '*/*', 'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent' => 'Faraday v0.9.2' })
           .to_return(status: 200, body: mocked_body, headers: { 'Content-Type' => 'text/html' })
  end

  describe '#new' do
    it { expect(instance).to be_an_instance_of StoreScraper::GooglePlay::Ranking }
    it 'has StoreScraper::Client' do
      expect(instance.client).to be_an_instance_of StoreScraper::Client
    end
  end

  describe '#all' do
    it { expect(instance.all).to be_an_instance_of Array }
    it { expect(instance.all.first).to be_an_instance_of StoreScraper::GooglePlay::Ranking::Entity }
  end

  describe '#find_by_id' do
    it { expect(instance.find_by_id("jp.co.mixi.monsterstrike").id).to eq instance.all.first.id }
  end

  describe '#find_by_rank' do
    it { expect(instance.find_by_rank(1).id).to eq instance.all.first.id }
  end
end
