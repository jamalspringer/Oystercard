require_relative '../lib/oystercard'

def setup_env
  subject = Oystercard.new
  subject.top_up(80)
  subject.touch_in("Leyton")
  subject.touch_out("Stratford")
  subject.touch_in("Bow")
  subject.touch_out("Mile end")
end