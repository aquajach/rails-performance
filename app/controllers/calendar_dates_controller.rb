class CalendarDatesController < ApplicationController
  def index
    current_user = User.first
    @calendar_dates = current_user.calendar_dates.includes(:events).select(:date, :id)
    # count = current_user.calendar_dates.count
    # max_updated_at = [current_user.events.maximum(:updated_at), current_user.calendar_dates.maximum(:updated_at)].max
    # fresh_when etag: "#{count}-#{max_updated_at}"
    expires_in 3600
    # respond_with @calendar_dates if stale?(current_user)
  end
end