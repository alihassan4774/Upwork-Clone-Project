class DropSkillsTable < ActiveRecord::Migration[8.0]
  def up
    # Pehle existing skills ko profiles mein migrate karein (optional)
    Profile.find_each do |profile|
      skill_names = Skill.where(profile_id: profile.id).pluck(:name)
      profile.update_column(:skills, skill_names) if skill_names.any?
    end

    # Foreign key remove karein
    remove_foreign_key :skills, :profiles if foreign_key_exists?(:skills, :profiles)

    # Table drop karein
    drop_table :skills
  end

  def down
    create_table :skills do |t|
      t.string :name
      t.bigint :profile_id, null: false
      t.timestamps
    end

    add_index :skills, :profile_id
    add_foreign_key :skills, :profiles
  end
end
