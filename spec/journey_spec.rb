require_relative '../lib/journey.rb'

describe Journey do

  let(:entry_station) {double("leyton")}
  let(:exit_station) {double"Stratford"}

  it 'Checks that a journey can be completed and returns the entrypoint and exitpoint' do
    expect(subject.finish(exit_station)).to eq(subject)
  end
end