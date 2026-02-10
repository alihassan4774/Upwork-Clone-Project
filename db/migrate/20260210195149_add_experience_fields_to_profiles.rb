class AddExperienceFieldsToProfiles < ActiveRecord::Migration[8.0]
  def change
    add_column :profiles, :experience_title, :string
    add_column :profiles, :experience_company, :string
    add_column :profiles, :experience_duration, :string
    add_column :profiles, :experience_description, :text
  end
end
