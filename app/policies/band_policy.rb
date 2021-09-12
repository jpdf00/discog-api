class BandPolicy < ApplicationPolicy
  attr_reader :user, :band

  def initialize(user, band)
    @user = user
    @band = band
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
