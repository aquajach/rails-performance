class CreateCalendarDates < ActiveRecord::Migration
  def change
    create_table :calendar_dates do |t|
      t.date :date
      t.references :user
      t.timestamps
    end
  end
end
