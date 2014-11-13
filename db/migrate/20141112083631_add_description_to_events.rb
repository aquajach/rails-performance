class AddDescriptionToEvents < ActiveRecord::Migration
  def change
    add_column :calendar_dates, :description, :text
  end
end
