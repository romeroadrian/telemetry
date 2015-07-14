require "rails_helper"

RSpec.describe Api::EventsController, :type => :controller do
  before(:each) do
    @installation = create(:installation)
  end

  describe "POST #create" do
    it "responds successfully" do
      post :create, installation_id: @installation.uuid, event: {kind: 'channels', payload: '{"foo": "bar"}'}, format: :json

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "creates an event" do
      expect {
        post :create, installation_id: @installation.uuid, event: {kind: 'channels', payload: '{"foo": "bar"}'}, format: :json
      }.to change(Event, :count).by(1)

      event = Event.first

      expect(event.installation).to eq(@installation)
      expect(event.kind).to eq('channels')
      expect(event.payload).to eq('{"foo": "bar"}')
    end

    it "renders the new event as json" do
      post :create, installation_id: @installation.uuid, event: {kind: 'channels', payload: '{"foo": "bar"}'}, format: :json

      expect(response.body).to eq(Event.first.to_json)
    end
  end
end
