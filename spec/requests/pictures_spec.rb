require 'rails_helper'

RSpec.describe 'Pictures', :type => :request do
  describe 'GET /pictures' do
    it 'works! (now write some real specs)' do
      sign_in FactoryBot.create(:admin)
      get pictures_path
      expect(response).to have_http_status(200)
    end
  end
end

