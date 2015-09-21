class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.boolean :done
      t.integer :position
      t.integer :project_id

      t.timestamps null: false
    end

    add_index :tasks, :project_id
  end
end
