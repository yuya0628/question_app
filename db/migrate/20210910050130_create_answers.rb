class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.text :content,        null: false
      t.integer :user_id,     null: false
      t.integer :question_id, null: false

      t.timestamps
    end
  end
end
