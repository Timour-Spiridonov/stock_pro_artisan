class CreateArtisans < ActiveRecord::Migration[7.0]
  def change
    create_table :artisans do |t|
      t.string :first_name
      t.string :last_name
      t.float :tjm
      t.string :siret
      t.text :description

      t.timestamps
    end
  end
end
