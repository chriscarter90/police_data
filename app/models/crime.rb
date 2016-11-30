class Crime < ActiveRecord::Base
  validates :date, :reported_by, :falls_within, presence: true
end
