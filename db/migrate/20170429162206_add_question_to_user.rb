class AddQuestionToUser < ActiveRecord::Migration[5.0]
  def change
    change_table :questions do |t|
      t.belongs_to :user, index: true
    end
  end
end
