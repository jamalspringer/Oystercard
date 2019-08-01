require_relative '../lib/oystercard.rb'
require_relative 'env_setup.rb'

describe Oystercard do

  let(:entry_station) {double("leyton")}
  let(:exit_station) {double"Stratford"}

  it 'Check that a customer can put money on their card i.e. the topup method can be called' do
    expect(subject).to respond_to(:top_up)
  end


  context "Card in use" do

  before(:each) do
    subject.top_up(10)
    subject.touch_in(entry_station)
  end

  it 'Checks that the card can be used to Touch_in' do
    expect(subject.entry_station).to eq(entry_station)
  end

  it 'Checks that the entry station is accepted and stored during Touch_in' do
    expect(subject.entry_station).to eq(entry_station)
  end

  it 'Checks that the entry point has been forgotten once the touch_out method has been called' do
    subject.touch_out(exit_station)
    expect(subject.entry_station).to eq(nil)
  end

  it 'Checks that the exit station is accepted and stored during touch_out' do
    subject.touch_out(exit_station)
    expect(subject.exit_station).to eq(exit_station)
  end

  it 'Checks that the journey is recorded after an oystercard is used to touch_in and touch_out' do
    subject.touch_out(exit_station)
    expect(subject.journeys[0]).to eq({entry_station => exit_station})
  end

end

  it 'Checks that balance is increased by the topup amount' do
    subject.top_up(10)
    expect(subject.balance).to eq(10)
  end

  it 'Checks that max balance is enforced' do
    expect{subject.top_up(100)}.to raise_error
  end

  it 'Checks that a fare amount can be deducted from the balance on the card' do
    subject.top_up(Oystercard::FARE)
    expect{subject.deduct}.to change{subject.balance}.by(-Oystercard::FARE)
  end

  it 'Checks that the card can be used to Touch_out' do
    subject.top_up(10)
    subject.touch_out(entry_station)
    expect(subject.entry_station).to eq(nil)
  end

  it 'Checks that the card cannot be used to touch in unless the minimum £1 balance has been met' do
    expect{subject.touch_in(entry_station)}.to raise_error
  end

  !it 'Checks that the balance has the minimum fare deducted after a touch_out' do
    expect{subject.touch_out(entry_station)}.to change{subject.balance}.by(-1)
  end

end
