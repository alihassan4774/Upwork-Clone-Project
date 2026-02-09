class AddImageToProfiles < ActiveRecord::Migration[8.0]
  def change
    add_column :profiles, :image, :string
  end
end
