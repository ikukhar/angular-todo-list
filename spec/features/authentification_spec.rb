feature 'Authentication', js: true do
  let(:email) { Faker::Internet.email }
  let(:password) { Faker::Internet.password(8) }


  def registration
    @registration_page = RegistrationPage.new
    @registration_page.visit
    @registration_page.complete_form(email: email, password: password(8))
  end

  def sign_out
    find("#dropdown-menu").click
    find('#sign-out').click
  end

  before do
    registration
    sign_out
    # @user = create(:user)
    @login_page = LoginPage.new
    @login_page.visit
  end

  feature 'login' do
    scenario 'with valid inputs' do
      @login_page.sign_in(email, password)
      expect(page).to have_button('Add project')
    end

    # scenario 'with invalid credentials' do
    #   @login_page.sign_in('invalid@lol.com', 'not the actual password')
    #   expect(page).to have_content('Invalid login credentials. Please try again.')
    # end

    scenario 'redirect after login' do
      @login_page.sign_in(email, password)
      expect(page).to have_button('Add project')
    end
  end
end
