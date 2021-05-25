class ApplicationScope < Struct.new(:user, :scope)

  def resolve
    if is_admin?
      scope.all
    else
      scope.none
    end
  end

  private

  def is_admin?
    user.admin?
  end

  def is_manager?
    user.manager?
  end

  def is_staff?
    user.staff?
  end
end
