require "rails_helper"

RSpec.describe Api::InstallationsController, :type => :controller do
  describe "POST #create" do
    it "responds successfully" do
      post :create, installation: {application: 'Verboice'}, format: :json

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "creates an installation" do
      expect {
        post :create, installation: {application: 'Verboice'}, format: :json
      }.to change(Installation, :count).by(1)

      expect(Installation.first.application).to eq('Verboice')
    end

    it "renders the new installation as json" do
      post :create, installation: {application: 'Verboice'}, format: :json

      expect(response.body).to eq(Installation.first.to_json)
    end

    it "assigns the request ip to the installation ip" do
      allow_any_instance_of(ActionDispatch::Request).to receive(:remote_ip).and_return('201.123.57.7')

      post :create, installation: {application: 'Verboice'}, format: :json

      expect(Installation.first.ip).to eq('201.123.57.7')
    end
  end
end
