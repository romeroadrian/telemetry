require "rails_helper"

RSpec.describe Installation, :type => :model do
  it { should validate_presence_of(:application) }

  let(:installation) { Installation.new(application: 'Verboice') }

  it "generates an uuid" do
    expect(SecureRandom).to receive(:uuid).and_return('a large uuid')

    installation.save!

    expect(installation.uuid).to eq('a large uuid')
  end

  it "should index installation after save" do
    indexer = double('indexer')
    expect(Indexer).to receive(:new).and_return(indexer)
    expect(indexer).to receive(:index_installation).with(installation)

    installation.save
  end

end
