class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :id
      t.string :first_name
      t.string :last_name
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
