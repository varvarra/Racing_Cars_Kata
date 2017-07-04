
require 'tire_pressure'

describe Alarm do

  subject(:alarm) {described_class.new}

  let(:sensor) { double :sensor}


  it 'should respond to the method #check' do
    expect(alarm).to respond_to(:check)
  end

  it 'should be initialized with the #is_alarm_on to be false' do
    expect(alarm.is_alarm_on).to be(false)
  end

  it 'should turn alarm on when the pressure is over the upper limit' do
    pressure = 22
    allow(sensor).to receive(:pop_next_pressure_psi_value).and_return(pressure)
    expect(alarm.check).to be(true)
  end

  it 'should turn alarm on when the pressure is lower than lower threshold' do
    pressure = 15
    allow(sensor).to receive(:pop_next_pressure_psi_value).and_return(pressure)
    expect(alarm.check).to be(true)
  end

end
