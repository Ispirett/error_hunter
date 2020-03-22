class App < ApplicationRecord
  belongs_to :ceo, class_name: 'User'
  has_many :developer_apps, dependent: :destroy
  has_many :app_errors, dependent: :destroy
  def to_param
    name
  end

  def developers
    User.where(id:developer_apps.select(:developer_id))
  end

end
