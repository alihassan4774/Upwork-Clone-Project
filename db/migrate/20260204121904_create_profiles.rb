class CreateProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :company_name
      t.text :bio
      t.string :size
      t.string :phone
      t.string :vat_id
      t.string :timezone
      t.string :address

      t.timestamps
    end
  end
end
