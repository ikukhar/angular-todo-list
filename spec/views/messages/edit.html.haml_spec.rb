require 'rails_helper'

RSpec.describe "messages/edit", type: :view do
  before(:each) do
    @message = assign(:message, Message.create!(
      :text => "MyText",
      :task_id => 1
    ))
  end

  it "renders the edit message form" do
    render

    assert_select "form[action=?][method=?]", message_path(@message), "post" do

      assert_select "textarea#message_text[name=?]", "message[text]"

      assert_select "input#message_task_id[name=?]", "message[task_id]"
    end
  end
end
