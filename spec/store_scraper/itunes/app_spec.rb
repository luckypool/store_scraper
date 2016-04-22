require 'spec_helper'

describe StoreScraper::Itunes::App do
  let!(:instance) do
    StoreScraper::Itunes::App.new
  end
  describe '#new' do
    it { expect(instance).to be_an_instance_of StoreScraper::Itunes::App }
    it 'has StoreScraper::Client' do
      expect(instance.client).to be_an_instance_of StoreScraper::Client
    end
  end

  describe '#find' do
    let(:mocked_body) do
      File.read('spec/mock_responses/app_response.json')
    end

    before do
      WebMock.stub_request(:get, "https://itunes.apple.com/jp/lookup?id=658511662")
             .with(headers: { 'Accept' => '*/*', 'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent' => 'Faraday v0.9.2' })
             .to_return(status: 200, body: mocked_body, headers: { 'Content-Type' => 'text/javascript' })
    end

    it { expect(instance.find).to be_an_instance_of StoreScraper::Itunes::App::Entity }
  end
end
