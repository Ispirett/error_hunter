module ApplicationHelper
  def get_user(user_id)
    User.find(user_id) unless user_id.nil?
  end
end
