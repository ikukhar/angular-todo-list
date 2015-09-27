
describe Ability do

  before do
    @user = create(:user)
    @user2 = create(:user)
    @ability = Ability.new(@user)
  end

  it "user can manage own projects" do
    @ability.should be_able_to(:manage, Project.new(user: @user))
    @ability.should_not be_able_to(:manage, Project.new(user: @user2))
  end

end
