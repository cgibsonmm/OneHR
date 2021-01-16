class RequisitionPolicy < ApplicationPolicy
  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      return @user if @user.admin? || @user.hiring_manager?
    end

    private

    attr_reader :user, :scope
  end

  def new?
    create?
  end

  def create?
    user.hiring_manager? || user.admin?
  end

  def show?
    create?
  end
end
