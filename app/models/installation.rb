class Installation < ActiveRecord::Base
  before_validation :generate_uuid, on: :create

  validates :uuid, presence: true
  validates :application, presence: true

  private

  def generate_uuid
    self.uuid = SecureRandom.uuid
  end
end
