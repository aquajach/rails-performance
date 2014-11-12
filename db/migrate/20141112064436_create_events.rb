class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :calendar_date
      t.datetime :start_time
      t.datetime :end_time
      t.string :title
      t.timestamps
    end
  end
end
