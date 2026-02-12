class AddEducationFieldsToProfiles < ActiveRecord::Migration[8.0]
  def change
    add_column :profiles, :degree, :string
    add_column :profiles, :complete_year, :string
    add_column :profiles, :university, :string
  end
end
