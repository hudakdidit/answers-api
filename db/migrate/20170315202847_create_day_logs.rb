class CreateDayLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :day_logs do |t|
      t.timestamps
    end
  end
end
