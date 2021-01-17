class RequisitionPolicy < ApplicationPolicy
  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      return @scope.all if @user.admin?
      return @scope.where(user: @user) if @user.hiring_manager?
      return @scope.where(user: @user) if @user
    end

    private

    attr_reader :user, :scope
  end

  def index?
    return true if user
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
