class AddDescriptionToEvents < ActiveRecord::Migration
  def change
    add_column :calendar_dates, :description, :text
    CalendarDate.all.each do |e|
      e.update(description: ::Faker::Lorem.paragraph(rand(1..4)))
    end
  end
end
