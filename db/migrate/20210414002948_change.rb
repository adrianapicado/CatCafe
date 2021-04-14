class Change < ActiveRecord::Migration[6.1]

  def change
    rename_table :a_customers, :customers
  end

end
