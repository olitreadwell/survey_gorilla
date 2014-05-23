class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.belongs_to :creator
      t.string :title

      t.timestamps
    end
  end
end
