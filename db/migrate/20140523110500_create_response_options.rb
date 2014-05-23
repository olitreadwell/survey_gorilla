class CreateResponseOptions < ActiveRecord::Migration
  def change
    create_table :response_options do |t|
      t.belongs_to :question
      t.string :choice_text

      t.timestamps
    end
  end
end
