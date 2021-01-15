class RequisitionPolicy < ApplicationPolicy
  def index?
    true
  end

  def new?
    create?
  end

  def create?
    puts user.hiring_manager?
    puts user.admin?
    user.present? && (user.hiring_manager? || user.admin?)
  end

  def show
    true
  end

  private

  def requisition
    record
  end
end
