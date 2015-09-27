module UserHelper
  def sign_in_user
    user = create(:user)
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @request.headers.merge! user.create_new_auth_token
    sign_in user
  end
end
