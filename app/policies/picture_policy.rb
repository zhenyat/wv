class PicturePolicy < ApplicationPolicy

  # For index
  class Scope < Scope
    def resolve
      if (user.sysadmin? || user.admin? || user.manager?)
        scope.all
        else
        nil
      end
    end
  end

  def show?
    user.sysadmin? || user.admin? || user.manager?
  end

  def create?
    user.sysadmin? || user.admin?
  end

  def new?
    create?
  end

  def edit?
    user.sysadmin? || user.admin?
  end

  def update?
    user.sysadmin? || user.admin?
  end

  def destroy?
    user.sysadmin? || user.admin?
  end
end
