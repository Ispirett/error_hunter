class DeveloperApp < ApplicationRecord
  belongs_to :app
  belongs_to :developer, class_name: 'User'
  validates :developer_id,uniqueness: {scope: :app_id}
end
