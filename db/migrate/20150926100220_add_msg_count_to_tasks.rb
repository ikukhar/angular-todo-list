class AddMsgCountToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :msg_count, :integer
  end
end
