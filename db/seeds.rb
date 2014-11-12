# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
CalendarDate.destroy_all
Event.destroy_all

require 'benchmark'


ActiveRecord::Base.transaction do
  100.times do
    user = User.create(name: Faker::Name.name)
    500.times do |i|
      calendar_date = user.calendar_dates.create(
          date: Date.new(2014, 11, 10) + i.send('days'),
          description: Faker::Lorem.paragraph(rand(1..4))
      )
      rand((0..3)).times do
        start_at = Faker::Time.between(calendar_date.date, calendar_date.date + 1.day)
        calendar_date.events.create(
            title: Faker::Lorem.sentence(rand((2..5))),
            start_time: start_at,
            end_time: start_at + rand((1..5)).send('hours')
        )
      end
    end
  end
end
