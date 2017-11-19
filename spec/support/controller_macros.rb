module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      @request.env['warden'] = @warden
      sign_in FactoryBot.create(:admin)
    end
  end

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @request.env['warden'] = @warden
      user = FactoryBot.create(:user)
      user.confirm!
      sign_in user
    end
  end
end
