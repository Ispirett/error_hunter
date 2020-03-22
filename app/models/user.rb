class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_secure_token :auth_token
  has_many :apps, foreign_key: :ceo_id , class_name: 'App'
  has_many :apps_i_am_working_on, foreign_key: :developer_id, class_name: 'DeveloperApp'

  def developer_apps
    App.where(id: apps_i_am_working_on)
  end

  def username
    self.email.split('@').first
  end
  def self.available_developers(app)
    User.where.not(id: (app.developers + [app.ceo])).map {|d| [d.username, d.id]}
  end
end
