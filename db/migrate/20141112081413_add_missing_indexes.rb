class AddMissingIndexes < ActiveRecord::Migration
  def change
    add_index :events, :calendar_date_id
    add_index :calendar_dates, :user_id
  end
end