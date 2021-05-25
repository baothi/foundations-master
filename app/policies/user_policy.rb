class UserPolicy < ApplicationPolicy
  class Scope < ApplicationScope
    def resolve
      if is_admin?
        scope.all
      elsif is_manager?
        scope.with_any_role(:manager, :staff)
      else
        scope.with_role(:staff)
      end
    end
  end

  def manage?
    is_admin? || is_manager?
  end

  def index?
    is_admin? || is_manager?
  end

  def new?
    is_admin? || is_manager?
  end

  def create?
    is_admin? || is_manager?
  end

  def update?
    is_admin? || is_manager?
  end

  def destroy?
    is_admin? || is_manager?
  end
end
