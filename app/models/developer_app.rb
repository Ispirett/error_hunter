class DeveloperApp < ApplicationRecord
  belongs_to :app
  belongs_to :developer, class_name: 'User'


end
