feature 'Registration', js: true do
  let(:email) { Faker::Internet.email }
  let(:password) { Faker::Internet.password(8) }

  before do
    @registration_page = RegistrationPage.new
    @registration_page.visit
  end

  feature 'with valid inputs' do  
    before { @registration_page.complete_form(email: email, password: password) }

    scenario 'account creation' do
      find("#dropdown-menu").click
      find('#sign-out').click
      login_page = LoginPage.new
      login_page.visit
      login_page.sign_in(email, password)
      expect(page).to have_button('Add project')
    end

    scenario 'sign-in upon account creation' do
      expect(page).to have_button('Add project')
    end
  end

  # scenario 'with a too-short password' do
  #   @registration_page.complete_form(email: email, password: 'a')
  #   expect(page).to have_content("Password must not less #{Devise.password_length.first} characters")
  # end
end
