class UserPolicy < ApplicationPolicy
  attr_reader :user, :client

  def initialize(user, client)
    @user = user
    @client = client
  end

  def index?
  	@client.each { |cli| return false unless UserPolicy.new(@user, cli).show? }
  end

  def show?
  	@user.admin? or @user == @client
  end

  def create?
   @user.admin?
  end

  def update?
    show?
  end
  
  def update?
    show?
  end
end
