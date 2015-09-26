require 'rails_helper'

RSpec.describe "messages/new", type: :view do
  before(:each) do
    assign(:message, Message.new(
      :text => "MyText",
      :task_id => 1
    ))
  end

  it "renders new message form" do
    render

    assert_select "form[action=?][method=?]", messages_path, "post" do

      assert_select "textarea#message_text[name=?]", "message[text]"

      assert_select "input#message_task_id[name=?]", "message[task_id]"
    end
  end
end
