class App < ApplicationRecord
  belongs_to :ceo, class_name: 'User'
  has_many :developer_apps, dependent: :destroy
  has_many :app_errors, dependent: :destroy
  before_save self.name.downcase!
  validates :name, presence: true, length: {minimum: 2, maximum: 40}

  def to_param
    name
  end

  def developers
    User.where(id:developer_apps.select(:developer_id))
  end
# get developers and ceo of app
# if the user with the token  matches the list above then the error would be saved.
  def is_post_authorized?(token)
    user = User.find_by(auth_token: token)
    self.developers.include?(user) || ceo == user
  end

end
