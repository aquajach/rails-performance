class CalendarDatesController < ApplicationController
  helper_method :current_user, :cache_key
  # etag {flash}
  def index
    # flash[:notice] = 'Welcome to my section!'
    @calendar_dates = current_user.calendar_dates.includes(:events).select(:date, :id, :updated_at)

    # count = current_user.calendar_dates.count
    max_updated_at = [current_user.events.maximum(:updated_at), current_user.calendar_dates.maximum(:updated_at)].max
    fresh_when etag: current_user.calendar_dates, last_modified: max_updated_at
    # fresh_when [{etag: current_user.calendar_dates, last_modified: max_updated_at}, form_authenticity_token]
    # expires_in 3600
    # respond_with @calendar_dates if stale?(current_user)
  end

  private

  def current_user
    User.first
  end

  def cache_key
    count = "#{current_user.events.count}-#{current_user.calendar_dates.count}"
    max_updated_at = [current_user.events.maximum(:updated_at), current_user.calendar_dates.maximum(:updated_at)].max
    "#{count}-#{max_updated_at}!!"
  end
end