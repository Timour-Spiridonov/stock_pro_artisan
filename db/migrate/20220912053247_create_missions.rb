class CreateMissions < ActiveRecord::Migration[7.0]
  def change
    create_table :missions do |t|
      t.date :start_at
      t.date :end_at
      t.float :price
      t.text :description

      t.timestamps
    end
  end
end
