class User < ActiveRecord::Base
  has_many :calendar_dates
end