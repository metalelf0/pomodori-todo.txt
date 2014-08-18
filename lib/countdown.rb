class Countdown
  
  def run seconds
    seconds.downto(0) do |current_seconds|
      sleep 1
      STDOUT.write "[RUNNING] #{to_minutes(current_seconds)}\r"
    end
  end

  private

  def to_minutes seconds
  	minutes = seconds / 60
    mins = sprintf("%02d", minutes)
    secs = sprintf("%02d", seconds % 60)
    "#{mins}:#{secs} [#{dots_for(minutes)}]"
  end

  def dots_for mins
  	"#{'.' * (25 - mins)}#{' ' * mins}"
  end

end