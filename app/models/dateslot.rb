class Dateslot < ActiveRecord::Base
  include IceCube
  require 'date'
  attr_accessible :title, :start_time, :end_time, :schedule, :date

  serialize :schedule, Hash

  def schedule=(new_schedule)
    if RecurringSelect.is_valid_rule?(new_schedule)
      write_attribute(:schedule, RecurringSelect.dirty_hash_to_rule(new_schedule).to_hash)
    else
      write_attribute(:schedule, nil)
    end
  end

  def converted_schedule
    if RecurringSelect.is_valid_rule?(self.schedule)
      if date > Date.today
        the_schedule = Schedule.new(date)
      else
        the_schedule = Schedule.new(Date.today)
      end
      the_schedule.add_recurrence_rule(RecurringSelect.dirty_hash_to_rule(self.schedule))
      the_schedule
    else
      the_schedule = IceCube::Schedule.new(date, :end_time => date)
      the_schedule
    end
  end

  def rule
    if RecurringSelect.is_valid_rule?(self.schedule)
      rule = RecurringSelect.dirty_hash_to_rule(schedule)
      rule.to_s
    else
      return "Eenmalig"
    end
  end

end