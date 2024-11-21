class CreateStats < ActiveRecord::Migration[7.1]
  def change
    create_table :stats do |t|
      t.string :title
      t.integer :solution
      t.text :description
      t.references :admin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
