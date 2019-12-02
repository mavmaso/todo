class Task < ApplicationRecord
  belongs_to :user
  before_save :default_values

  validates :description, presence: true

  def default_values
    self.check = check.presence || false
  end
end
