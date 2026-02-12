class RemoveSkillsFromProfiles < ActiveRecord::Migration[8.0]
  def change
    remove_column :profiles, :skills, :text
  end
end
