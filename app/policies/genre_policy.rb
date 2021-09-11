class GenrePolicy < ApplicationPolicy
  attr_reader :user, :genre

  def initialize(user, genre)
    @user = user
    @genre = genre
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
