
describe Message, type: :model do

  before do
    @msg = create(:message)
  end

  it { should respond_to(:text) }
  it { should belong_to(:task) }

  describe "when text is not present" do
    before { @msg.text = nil }
    it { should_not be_valid }
  end

  describe "when task is not present" do
    before { @msg.task = nil }
    it { should_not be_valid }
  end

  describe "#update_project_done" do
    it "tasks msg_count increment when create message" do
      @msg.task.reload
      @msg.task.msg_count.should == 1
    end

    it "tasks msg_count decrement when destroy message" do
      @msg.destroy!
      @msg.task.reload
      @msg.task.msg_count.should == 0
    end
  end

end
