class ClientDecorator < Draper::Decorator
  delegate_all

  def full_name
    if first_name && last_name
      "#{first_name} #{last_name}"
    else
      email
    end
  end
end
