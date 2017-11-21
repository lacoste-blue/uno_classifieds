module ControllerMacros
  def login_admin
    before(:each) do |test|
      unless test.metadata[:logged_out]
        @request.env['devise.mapping'] = Devise.mappings[:admin]
        @request.env['warden'] = @warden
        sign_in FactoryBot.create(:admin)
      end
    end
  end

  def login_user
    before(:each) do |_|
      @request.env['devise.mapping'] = Devise.mappings[:user]
      @request.env['warden'] = @warden
      user = FactoryBot.create(:user)
      user.confirm!
      sign_in user
    end
  end
end
