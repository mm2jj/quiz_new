class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.text :text
      t.boolean :correct
      t.integer :question_id

      t.timestamps
    end
  end
end
