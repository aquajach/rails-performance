class User < ActiveRecord::Base
  has_many :calendar_dates
  has_many :events, through: :calendar_dates
end