class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.belongs_to :user
      t.belongs_to :survey

      t.timestamps
    end
  end
end
