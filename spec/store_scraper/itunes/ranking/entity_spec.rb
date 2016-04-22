require 'spec_helper'

describe StoreScraper::Itunes::Ranking do
  let(:mocked_body) do
    File.read('spec/mock_responses/ranking_response.json')
  end

  let!(:instance) do
    WebMock.stub_request(:get, "https://itunes.apple.com/jp/rss/topgrossingapplications/limit=1/json")
           .with(headers: { 'Accept' => '*/*', 'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent' => 'Faraday v0.9.2' })
           .to_return(status: 200, body: mocked_body, headers: { 'Content-Type' => 'text/javascript' })
    ranking = StoreScraper::Itunes::Ranking.new(limit: 1)
    ranking.all.first
  end

  context 'given no.1 ranker' do
    subject { instance }
    it { is_expected.to be_an_instance_of StoreScraper::Itunes::Ranking::Entity }
    its(:rank) { is_expected.to eq 1 }
    its(:id) { is_expected.to eq 658511662 }
    its(:title) { is_expected.to eq "モンスターストライク" }
    its(:bundle_id) { is_expected.to eq "jp.co.mixi.monsterstrike" }
    its(:category) { is_expected.to eq "ゲーム" }
    its(:image) { is_expected.to be_an_instance_of String }
    its(:publisher) { is_expected.to eq "mixi, Inc" }
    its(:link) { is_expected.to be_an_instance_of String }
    its(:summary) { is_expected.to be_an_instance_of String }
  end
end
