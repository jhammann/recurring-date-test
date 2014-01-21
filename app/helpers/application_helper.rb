module ApplicationHelper

  def first_event(dateslot, schedule)
    if RecurringSelect.is_valid_rule?(schedule)
      l(dateslot.converted_schedule.first, format: :full)
    else
      l(dateslot.date, format: :full)
    end
  end

  def valid_schedule?(schedule)
    return true if RecurringSelect.is_valid_rule?(schedule)
  end

end