describe User, type: :model do

  before :all do
    @user = create(:user)
    p @user
  end

  it { should have_many(:projects) }

  describe "when uid is not present" do
    before { @user.uid = 0 }
    it { should_not be_valid }
  end

end
