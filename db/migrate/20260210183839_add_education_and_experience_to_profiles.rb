class AddEducationAndExperienceToProfiles < ActiveRecord::Migration[8.0]
  def change
    add_column :profiles, :education, :text
    add_column :profiles, :experience, :text
  end
end
