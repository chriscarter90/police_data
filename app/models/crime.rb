class Crime < ActiveRecord::Base
  validates :date, :reported_by, :falls_within, presence: true

  scope :for_crime_type, ->(type) { where(crime_type: type) }
  scope :with_outcome, ->(outcome) { where(outcome: outcome) }

  def self.group_by_month(scope = Crime.all)
    query = <<-SQL
      SELECT date, COALESCE(count, 0) AS total
      FROM (
        SELECT generate_series(d.min, d.max, '1 month'::interval) AS date FROM (
          SELECT MAX(date) as max, MIN(date) as min FROM crimes
        ) AS d
      ) m
      LEFT JOIN (
        SELECT scope.date, COUNT(scope.*)
        FROM (#{scope.to_sql}) as scope
        GROUP BY scope.date
      ) t USING(date);
    SQL

    self.find_by_sql(query)
  end
end
