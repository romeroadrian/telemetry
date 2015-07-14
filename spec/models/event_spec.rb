require 'rails_helper'

RSpec.describe Event, type: :model do
  it { should belong_to(:installation) }
  it { should validate_presence_of(:installation) }
  it { should validate_presence_of(:kind) }

  let!(:event) { build(:event) }

  it "should index installation after save" do
    indexer = double('indexer')
    expect(Indexer).to receive(:new).and_return(indexer)
    expect(indexer).to receive(:index_event).with(event)

    event.save
  end

  context 'payload' do
      it 'should tell payload as json' do
        event.payload = '[1,2,3]'
        expect(event.payload_json).to eq([1,2,3])
      end

      it 'should return nil when bad json' do
        event.payload = '{[1,2,3]}'
        expect(event.payload_json).to be_nil
      end
  end
end
