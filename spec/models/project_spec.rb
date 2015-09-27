
describe Project, type: :model do

  before do
    @project = create(:project)
  end

  it { should respond_to(:name) }
  it { should belong_to(:user) }
  it { should have_many(:tasks) }

  describe "when name is not present" do
    before { @project.name = nil }
    it { should_not be_valid }
  end


  describe "when user is not present" do
    before { @project.user = nil }
    it { should_not be_valid }
  end

end
