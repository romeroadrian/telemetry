class Installation < ActiveRecord::Base
  before_validation :generate_uuid, on: :create
  after_save :index

  validates :uuid, presence: true
  validates :application, presence: true

  # TODO remove. dummy implementation
  def lat
    rand * 180 - 90
  end

  def lng
    rand * 360 - 180
  end

  def last_reported_at
    Time.new - rand * 30 * 86400
  end
  # END TODO remove

  private

  def generate_uuid
    self.uuid = SecureRandom.uuid
  end

  def index
    Indexer.new.index_installation self
  end

end
