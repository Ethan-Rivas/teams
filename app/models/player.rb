class Player < ActiveRecord::Base
  def full_name
    "#{first_name} " + "#{last_name}"
  end

  def current_age
    return 0 unless birthdate

    age = Date.today.year - birthdate.year
    age -= 1 unless has_birthday_this_year?
    age
  end

  private
  def has_birthday_this_year?
    today = Date.today

    today.month > birthdate.month ||
      (today.month == birthdate.month && today.day >= birthdate.day)
  end
end
