class App < ApplicationRecord
  belongs_to :ceo, class_name: 'User'
  has_many :developer_apps

  def to_param
    name
  end

  def developers
    User.where(id:developer_apps)
  end

end
