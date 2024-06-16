class CreateAwards < ActiveRecord::Migration[7.1]
  def change
    create_table :awards do |t|
      t.integer :name
      t.references :habit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
