class AppError < ApplicationRecord
  belongs_to :app
  validates :status, presence: true, inclusion: {in: %w(solved not_solved in_progress)}
  validates :log, length: {maximum: 1000}
  validates :description, length: { maximum: 1000}
  def self.status_options
    %w(solved not_solved in_progress)
  end
end
