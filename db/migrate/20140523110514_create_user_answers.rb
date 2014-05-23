class CreateUserAnswers < ActiveRecord::Migration
  def change
    create_table :user_answers do |t|
      t.belongs_to :response_option
      t.belongs_to :user
      t.string :answer_content

      t.timestamps
    end
  end
end
