class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :fetures
      t.string :foto

      t.timestamps
    end
  end
end
