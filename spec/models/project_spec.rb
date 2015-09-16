require 'rails_helper'

RSpec.describe Project, type: :model do
  before do
    @project = Project.new(name: "Test project")
  end

  subject { @project }

  it { should respond_to(:name) }
  it { should be_valid }

  describe "when name is not present" do
    before { @project.name = " " }
    it { should_not be_valid }
  end
 
end
