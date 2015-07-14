require "rails_helper"

RSpec.describe Installation, :type => :model do
  it { should validate_presence_of(:application) }

  let(:installation) { Installation.new(application: 'Verboice') }

  it "generates an uuid" do
    expect(SecureRandom).to receive(:uuid).and_return('a large uuid')

    installation.save!

    expect(installation.uuid).to eq('a large uuid')
  end
end
