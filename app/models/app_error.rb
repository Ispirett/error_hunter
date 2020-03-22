class AppError < ApplicationRecord
  belongs_to :app
  validates :status, presence: true, inclusion: {in: %w(solved not_solved in_progress)}

  def self.status_options
    %w(solved not_solved in_progress)
  end
end
