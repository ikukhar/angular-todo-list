# feature 'CreateProject', js: true do
#   let(:email) { Faker::Internet.email }
#   let(:password) { Faker::Internet.password(8) }
#
#
#   def registration
#     @registration_page = RegistrationPage.new
#     @registration_page.visit
#     @registration_page.complete_form(email: email, password: password(8))
#   end
#
#   def sign_out
#     find("#dropdown-menu").click
#     find('#sign-out').click
#   end
#
#   before do
#     registration
#     sign_out
#     # @user = create(:user)
#     @login_page = LoginPage.new
#     @login_page.visit
#     @login_page.sign_in(email, password)
#   end
#
#   feature 'create project' do
#     scenario 'valid name' do
#       click_button 'Add project'
#       within("#add-project-form") do
#         fill_in 'name', :with => 'Test project'
#       end
#       click_button '#add-project-save-button'
#       expect(page).to have_content('Test project')
#     end
#   end
#
# end
