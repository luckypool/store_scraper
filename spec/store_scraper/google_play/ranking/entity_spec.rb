require 'spec_helper'

describe StoreScraper::GooglePlay::Ranking do
  let(:mocked_body) do
    File.read('spec/mock_responses/google_play_response.html')
  end

  let!(:instance) do
    WebMock.stub_request(:get, "https://play.google.com/store/apps/category/GAME/collection/topgrossing?num=60&start=0")
           .with(headers: { 'Accept' => '*/*', 'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent' => 'Faraday v0.9.2' })
           .to_return(status: 200, body: mocked_body, headers: { 'Content-Type' => 'text/html' })
    ranking = StoreScraper::GooglePlay::Ranking.new(limit: 1)
    ranking.all.first
  end

  context 'given no.1 ranker' do
    subject { instance }
    it { is_expected.to be_an_instance_of StoreScraper::GooglePlay::Ranking::Entity }
    its(:id) { is_expected.to eq "jp.co.mixi.monsterstrike" }
    its(:title) { is_expected.to eq "モンスターストライク" }
    its(:publisher) { is_expected.to eq "mixi, Inc." }
    its(:link) { is_expected.to be_an_instance_of String }
    its(:summary) { is_expected.to be_an_instance_of String }
    its(:rank) { is_expected.to eq 1 }
  end
end
