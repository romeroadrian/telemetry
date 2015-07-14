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

  def index_event(event)
    payload = event.payload_json

    case payload
    when Hash
      # TODO use bulk
      payload.each do |key, value|
        @client.index  index: index, type: "event_#{event.kind}", id: "#{event.id}_#{key}", body: {
          installation_uuid: event.installation.uuid,
          reported_at: event.created_at.iso8601,
          key: key,
          value: value
        }
      end
    else
      raise 'unsupported payload'
    end
  end

  private

  def index
    "telemetry-test"
  end

end
