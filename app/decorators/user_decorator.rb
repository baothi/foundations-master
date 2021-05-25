class UserDecorator < Draper::Decorator
  delegate_all

  def role_name
    self.current_role.try(:capitalize)
  end

  def full_name
    if first_name && last_name
      "#{first_name} #{last_name}".try(:titleize)
    elsif first_name
      first_name.try(:titleize)
    else
      last_name.try(:titleize)
    end
  end

  def name
    if first_name && last_name
      "#{first_name} #{last_name.last[0,1]}.".try(:titleize)
    elsif first_name
      first_name.try(:titleize)
    else
      last_name.try(:titleize)
    end
  end

end
