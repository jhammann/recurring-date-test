class Dateslot < ActiveRecord::Base
  include IceCube
  attr_accessible :title, :start_time, :end_time, :schedule, :date

  serialize :schedule, Hash

  def schedule=(new_schedule)
    write_attribute(:schedule, RecurringSelect.dirty_hash_to_rule(new_schedule).to_hash)
  end

  def converted_schedule
    the_schedule = Schedule.new(self.date)
    the_schedule.add_recurrence_rule(RecurringSelect.dirty_hash_to_rule(self.schedule))
    the_schedule
  end
end