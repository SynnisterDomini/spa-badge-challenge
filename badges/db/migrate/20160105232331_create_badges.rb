class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.integer :points
      t.integer :owner_id
      t.string :title

      t.timestamps null: false
    end
  end
end
