
require_relative '../lib/journey.rb'

describe Journey do

  let(:entry_station) {double("leyton")}
  let(:exit_station) {double"Stratford"}


  it 'Checks that a journey can be started using the start_journey method' do
    expect(subject).to respond_to(:start_journey).with(1).argument
  end

  it 'Checks that a journey can be stopped using the finish_journey method' do
    expect(subject).to respond_to(:finish_journey).with(1).argument
  end


end