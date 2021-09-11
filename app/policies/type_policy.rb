class TypePolicy < ApplicationPolicy
  attr_reader :user, :type

  def initialize(user, type)
    @user = user
    @type = type
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
