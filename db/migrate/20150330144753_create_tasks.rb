class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task
      t.date :date
      t.references :project, index: true

      t.timestamps null: false
    end
    add_foreign_key :tasks, :projects
  end
end
