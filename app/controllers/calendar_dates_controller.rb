class CalendarDatesController < ApplicationController
  def index
    @calendar_dates = User.first.calendar_dates.includes(:events).select(:date, :id)
  end
end