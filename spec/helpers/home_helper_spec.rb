require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the HomeHelper. For example:
#
# describe HomeHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe HomeHelper, :type => :helper do
  describe 'recent_listings' do
    it 'returns No pictures when no listing has pictures' do
      expect(recent_listings(6)).to eq('No pictures')
    end

    context '6 listings with images' do
      before(:each) do
        FactoryBot.create_list(:listing, 7).each do |listing|
          FactoryBot.create(:picture, :listing => listing)
        end
        @listings = recent_listings(6)
      end

      it 'returns 6 when asked for 6' do
        expect(@listings.count).to eq(6)
      end

      it 'returns 6 when asked for 7' do
        expect(@listings.count).to eq(6)
      end

      it 'does not return the last listing with picture' do
        expect(@listings).to_not include(Listing.last)
      end

      it 'returns the most recent elements' do
        expect(@listings).to eq(Listing.last(7)[0..-2])
      end
    end
  end

  context '1 listing with images' do
    it 'returns empty if only one listing has pictures' do
      listing = FactoryBot.create(:listing)
      FactoryBot.create(:picture, :listing => listing)
      expect(recent_listings(6).count).to eq(0)
    end
  end

  describe 'last_picture' do

    it 'returns No pictures when no listings' do
      expect(last_picture).to eq('No pictures')
    end

    it 'returns No pictures when listings have no picture' do
      FactoryBot.create(:listing)
      expect(last_picture).to eq('No pictures')
    end


    it 'should return the last listing with picture' do
      FactoryBot.create(:listing)
      target = FactoryBot.create(:listing, :pictures => [FactoryBot.create(:picture)])
      FactoryBot.create(:listing)
      expect(last_picture).to include("listings/#{target.id}")
    end

    it 'should return an img anchor' do
      listing = FactoryBot.create(:listing)
      pic = FactoryBot.create(:picture, :listing => listing)
      expect(last_picture).to include("src=\"/images/1/#{pic.image_file_name}?")
    end
  end
end

