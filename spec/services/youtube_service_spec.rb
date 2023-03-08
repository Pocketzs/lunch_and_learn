require 'rails_helper'

RSpec.describe YoutubeService do
  describe 'class methods' do
    describe '.video_search', :vcr do
      it 'returns a single youtube snippet search given query' do
        data = YoutubeService.video_search('thailand')
        expect(data).to have_key(:items)
        expect(data[:items]).to be_an(Array)
        expect(data[:items].count).to eq(1)
        result = data[:items][0]
        expect(result).to have_key(:snippet)
        expect(result).to have_key(:id)
        expect(result[:snippet]).to have_key(:title)
        expect(result[:snippet][:title]).to be_a(String)
        expect(result[:id]).to have_key(:videoId)
        expect(result[:id][:videoId]).to be_a(String)
      end
    end
  end
end