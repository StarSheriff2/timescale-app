class PageLoad < ApplicationRecord
  scope :per_minute, -> { time_bucket('1 minute') }
  scope :per_hour, -> { time_bucket('1 hour') }
  scope :per_day, -> { time_bucket('1 day') }
  scope :per_week, -> { time_bucket('1 week') }
  scope :per_month, -> { time_bucket('1 month') }
  scope :average_response_time_per_minute, -> { time_bucket('1 minute', value: 'avg(performance)') }
  scope :average_response_time_per_hour, -> { time_bucket('1 hour', value: 'avg(performance)') }
  scope :worst_response_time_last_minute, -> { time_bucket('1 minute', value: 'max(performance)') }
  scope :worst_response_time_last_hour, -> { time_bucket('1 hour', value: 'max(performance)') }
  scope :best_response_time_last_hour, -> { time_bucket('1 hour', value: 'min(performance)') }
  scope :paths, -> { distinct.pluck(:path) }
  scope :time_bucket, -> (time_dimension, value: 'count(1)') {
    select(<<~SQL)
      time_bucket('#{time_dimension}', created_at) as time, path,
      #{value} as value
    SQL
     .group('time, path').order('path, time')
    }

  def self.resume_for(path)
   filter = where(path: path)
   get = -> (scope_name) { filter.send(scope_name).first&.value}
   metrics.each_with_object({}) do |metric, resume|
       resume[metric] = get[metric]
   end
  end

  def self.metrics
    methods.grep /response_time/
  end

  def self.statistics
    paths.each_with_object({}) do |path, resume|
      resume[path] = resume_for(path)
    end
  end
end
