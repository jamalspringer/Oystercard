require_relative '../lib/oystercard.rb'

describe Oystercard do
  it 'Check that a customer can put money on their card i.e. the topup method can be called' do
    expect(subject).to respond_to(:top_up)
  end

  it 'Checks that balance is increased by the topup amount' do
    subject.top_up(10)
    expect(subject.balance).to eq(10)
  end

  it 'Checks that max balance is enforced' do
    expect{subject.top_up(100)}.to raise_error
  end

  it 'Checks that a fare amount can be deducted from the balance on the card' do
    subject.top_up(10)
    subject.deduct(5)
    expect(subject.balance).to eq(5)
  end

  it 'Checks that the card can be used to Touch_in' do
    subject.top_up(10)
    subject.touch_in("Leyton")
    expect(subject.entry_station).to eq("Leyton")
  end

  it 'Checks that the card can be used to Touch_out' do
    subject.top_up(10)
    subject.touch_out("Leyton")
    expect(subject.entry_station).to eq(nil)
  end

  it 'Checks that the card cannot be used to touch in unless the minimum £1 balance has been met' do
    expect{subject.touch_in("Leyton")}.to raise_error
  end

  it 'Checks that the balance has the minimum fare deducted after a touch_out' do
    expect{subject.touch_out("Leyton")}.to change{subject.balance}.by(-1)
  end

  it 'Checks that the entry station is accepted and stored during Touch_in' do
    location = "Walthamstow Central"
    subject.top_up(10)
    subject.touch_in("Walthamstow Central")
    expect(subject.entry_station).to eq("Walthamstow Central")
  end

  it 'Checks that the entry point has been forgotten once the touch_out method has been called' do
    subject.top_up(10)
    subject.touch_in("Walthamstow Central")
    subject.touch_out("Leyton")
    expect(subject.entry_station).to eq(nil)
  end

  it 'Checks that the exit station is accepted and stored during touch_out' do
    subject.top_up(10)
    subject.touch_in("Walthamstow Central")
    subject.touch_out("Victoria")
    expect(subject.exit_station).to eq("Victoria")
  end

end