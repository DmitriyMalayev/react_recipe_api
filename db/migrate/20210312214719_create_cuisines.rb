class CreateCuisines < ActiveRecord::Migration[6.1]
  def change
    create_table :cuisines do |t|
      t.string :name
      t.timestamps
    end
  end
end
