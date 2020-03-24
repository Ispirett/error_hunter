class AppPolicy < ApplicationPolicy
  def show?
    @record.ceo.id == @user.id or @record.developers.include?(@user)
  end
end