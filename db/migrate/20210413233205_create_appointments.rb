class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.datetime :date
      t.string :name
      t.string :coffee

      t.timestamps
    end
  end
end
