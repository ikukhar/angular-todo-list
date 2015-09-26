class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :text
      t.integer :task_id

      t.timestamps null: false
    end

    add_index :messages, :task_id
  end
end
