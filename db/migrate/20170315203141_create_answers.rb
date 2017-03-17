class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.text :answer
      t.belongs_to :day_log, index: true
      t.belongs_to :question, index: true

      t.timestamps
    end
  end
end
