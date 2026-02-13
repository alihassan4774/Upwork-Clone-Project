class CreateProposals < ActiveRecord::Migration[8.0]
  def change
    create_table :proposals do |t|
      t.references :job, null: false, foreign_key: true
      t.references :freelancer, null: false, foreign_key: { to_table: :users }
      t.text :cover_letter
      t.integer :bid_amount
      t.string :estimated_time
      t.string :status

      t.timestamps
    end
  end
end
