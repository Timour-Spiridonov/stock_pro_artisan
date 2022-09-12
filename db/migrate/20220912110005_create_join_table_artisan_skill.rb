class CreateJoinTableArtisanSkill < ActiveRecord::Migration[7.0]
  def change
    create_join_table :artisans, :skills do |t|
      # t.index [:artisan_id, :skill_id]
      # t.index [:skill_id, :artisan_id]
    end
  end
end
