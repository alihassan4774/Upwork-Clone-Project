class AddFreelancerFieldsToProfiles < ActiveRecord::Migration[8.0]
  def change
    add_column :profiles, :skills, :text
    add_column :profiles, :fixed_price, :integer
    add_column :profiles, :portfolio_url, :string
  end
end
