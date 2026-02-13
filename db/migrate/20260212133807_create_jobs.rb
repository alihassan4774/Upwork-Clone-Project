class CreateJobs < ActiveRecord::Migration[8.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.integer :budget
      t.string :project_type
      t.string :experience_level
      t.date :deadline
      t.references :user, null: false, foreign_key: true

      t.string :skills, array: true, default: []

      t.timestamps
    end
  end
end
