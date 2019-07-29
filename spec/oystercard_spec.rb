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
    subject.touch_in
    expect(subject.status).to eq("In Journey")
  end

end