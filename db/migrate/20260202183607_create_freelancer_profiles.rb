class CreateFreelancerProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :freelancer_profiles do |t|
      t.references :user, foreign_key: true
      t.text :skills
      t.decimal :fixed_price
      t.string :portfolio_url

      t.timestamps
    end
  end
end
