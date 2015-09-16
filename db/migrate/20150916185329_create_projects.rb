class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.boolean :done

      t.timestamps null: false
    end
  end
end
