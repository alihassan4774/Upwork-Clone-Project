class AddSkillsToProfiles < ActiveRecord::Migration[8.0]
  def change
    add_column :profiles, :skills, :string, array: true, default: []
  end
end
