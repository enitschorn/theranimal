class CreateTherapies < ActiveRecord::Migration[5.2]
  def change
    create_table :therapies do |t|
      t.references :user, foreign_key: true
      t.references :animal, foreign_key: true
      t.integer :price
      t.date :start_on
      t.date :end_on

      t.timestamps
    end
  end
end
