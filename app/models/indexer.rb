class Indexer
  def initialize
    @client = Elasticsearch::Client.new log: true
  end

  def index_installation(installation)
    @client.index  index: index, type: 'installation', id: installation.id, body: {
      uuid: installation.uuid,
      location: {
        lat: installation.lat,
        lon: installation.lng,
      },
      last_reported_at: installation.last_reported_at.try(:iso8601)
    }
  end

  private

  def index
    "telemetry-test"
  end

end
