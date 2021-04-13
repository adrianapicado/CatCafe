class CreateCats < ActiveRecord::Migration[6.1]
  def change
    create_table :cats do |t|
      t.string :name
      t.boolean :mittens

      t.timestamps
    end
  end
end
