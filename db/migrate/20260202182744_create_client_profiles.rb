class CreateClientProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :client_profiles do |t|
      t.references :user, foreign_key: true
      t.string :company_name
      t.text :bio

      t.timestamps
    end
  end
end
