class CreateResponseOptions < ActiveRecord::Migration
  def change
    create_table :response_options do |t|
      t.belongs_to :question
      t.string :choice_text
      #TODO add type of question

      t.timestamps
    end
  end
end
