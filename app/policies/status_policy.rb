class StatusPolicy < ApplicationPolicy
  attr_reader :user, :status

  def initialize(user, status)
    @user = user
    @status = status
  end

  def index?
  	true
  end

  def show?
  	@user.present?
  end

  def create?
   show?
  end

  def update?
    show?
  end

  def destroy?
    show?
  end
end
