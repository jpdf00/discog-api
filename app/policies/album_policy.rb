class AlbumPolicy < ApplicationPolicy
  attr_reader :user, :album

  def initialize(user, album)
    @user = user
    @album = album
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
