class ChangeWeekDateColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :weeks, :weekDate, :week_date
  end
end
