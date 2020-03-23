class AppPolicy < ApplicationPolicy
  def show?
    @record.ceo.id == @user.id
  end
end