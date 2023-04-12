class PageLoad < ApplicationRecord
  scope :last_month, -> { where('created_at > ?', 1.month.ago) }
  scope :last_week, -> { where('created_at > ?', 1.week.ago) }
  scope :last_hour, -> { where('created_at > ?', 1.hour.ago) }
  scope :yesterday, -> { where('DATE(created_at) = ?', 1.day.ago.to_date) }
  scope :today, -> { where('DATE(created_at) = ?', Date.today) }

  scope :counts_per, -> (time_dimension) {
    select("time_bucket('#{time_dimension}', created_at) as time, count(1) as total")
    .group(:time).order(:time)
      .map {|result| [result.time, result.total]}
  }
end
