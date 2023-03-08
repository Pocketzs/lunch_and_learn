class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :api_key, presence: true, uniqueness: true
  has_many :favorites
  before_validation :generate_api_key, on: :create

  def generate_api_key
      self.api_key = SecureRandom.uuid
  end
end
