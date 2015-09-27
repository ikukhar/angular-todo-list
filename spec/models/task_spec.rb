
describe Task, type: :model do

  before do
    @task = create(:task)
  end

  it { should respond_to(:name) }
  it { should belong_to(:project) }
  it { should have_many(:messages) }

  describe "when name is not present" do
    before { @task.name = nil }
    it { should_not be_valid }
  end

  describe "when project is not present" do
    before { @task.project = nil }
    it { should_not be_valid }
  end

  describe "#update_project_done" do
    it "project done when all task is done" do
      task1 = create(:task)
      task2 = create(:task, project: task1.project)
      task1.done = true; task1.save!
      task2.done = true; task2.save!
      task1.project.reload

      task1.project.done.should == true
    end

    it "project is not done when any task is not done" do
      task1 = create(:task)
      task2 = create(:task, project: task1.project)
      task1.done = true; task1.save!
      task1.project.reload

      task1.project.done.should == false
    end
  end

end
