class Installation < ActiveRecord::Base
  has_many :events

  before_validation :generate_uuid, on: :create
  after_save :index
  after_initialize :init

  validates :uuid, presence: true
  validates :application, presence: true

  private

  def generate_uuid
    self.uuid = SecureRandom.uuid
  end

  def index
    Indexer.new.index_installation self
  end

  def init
    self.lat ||= rand * 180 - 90
    self.lng ||= rand * 360 - 180
    self.last_reported_at ||= Time.new - rand * 30 * 86400
  end

end
