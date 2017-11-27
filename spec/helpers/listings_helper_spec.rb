require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ListingsHelper. For example:
#
# describe ListingsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ListingsHelper, :type => :helper do
  before(:each) { @listing = FactoryBot.create(:listing) }

  module StubControllerMethod
    def redirect_params(_params)
      {}
    end
  end

  describe 'email_body' do
    it 'returns string with listing title' do
      resp = helper.email_body(@listing) # helper.email_body(listing)
      ans = "Hi,\n\nI am interested in your listing titled #{@listing.title} on UNO Classifieds.\n\n"
      expect(resp).to eq(ans)
    end
  end

  describe 'index_welcome' do
    before {
      controller.extend(StubControllerMethod)
      @listings = []
    }
    it 'returns No Listings found if empty' do
      expect(helper.index_welcome(:user_id => 20)).to eq('No Listings found')
    end

    it 'returns a link to listings if no params' do
      @listings.append(5)
      ans = %( #{link_to('Listings', listings_path)} ).html_safe
      expect(helper.index_welcome({})).to eq(ans)
    end
  end
end

