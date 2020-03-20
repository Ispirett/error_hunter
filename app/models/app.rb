class App < ApplicationRecord
  belongs_to :ceo, class_name: 'User'
  has_many :developers, class_name: 'User'

  def to_param
    name
  end

end
