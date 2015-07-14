class Event < ActiveRecord::Base
  belongs_to :installation

  after_save :index

  validates :installation, presence: true
  validates :kind, presence: true

  def payload_json
    @payload_json ||= Oj.load(self.payload) rescue nil
  end

  private

  def index
    Indexer.new.index_event self
  end
end
