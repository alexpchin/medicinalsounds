class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.text :image
      t.string :username
      t.string :role

      t.timestamps
    end
  end
end
