class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.date :date
      t.references :project, index: true
      t.integer :position
      t.boolean :status, default: false

      t.timestamps null: false
    end
    add_foreign_key :tasks, :projects
  end
end
