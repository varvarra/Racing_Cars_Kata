# The Sensor class provided for the exercise fakes the behaviour of a real tire sensor, providing random but realistic values.

class Sensor
  OFFSET = 16

  def pop_next_pressure_psi_value
    OFFSET + sample_pressure
  end

  def sample_pressure
    # placeholder implementation that simulate a real sensor in a real tire
    6 * rand * rand
  end

end

# The Alarm class is designed to monitor tire pressure and set an alarm if the pressure falls outside of the expected range.
class Alarm

  attr_reader :is_alarm_on

  LOW_THRESHOLD = 17
  HIGH_THRESHOLD = 21

  def initialize(sensor = Sensor.new)
    @sensor = sensor
    @is_alarm_on = false
  end

  def check
    psi_pressure_value = @sensor.pop_next_pressure_psi_value
    if psi_pressure_value < LOW_THRESHOLD || psi_pressure_value > HIGH_THRESHOLD
      is_alarm_on = true
    end
     is_alarm_on
  end
end
