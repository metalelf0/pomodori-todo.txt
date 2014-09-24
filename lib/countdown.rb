class Countdown
  
  def run seconds, options={}
    seconds.downto(0) do |current_seconds|
      sleep 1
      write_tmux(current_seconds) if (options[:services] || []).include?(:tmux)
      STDOUT.write "[RUNNING] #{to_minutes(current_seconds)}\r"
    end
  end

  private

  def write_tmux current_seconds
    `echo #{to_minutes(current_seconds, :tmux)} > ~/.pomo.txt.tmux` 
  end

  def to_minutes seconds, format=:standard
  	minutes = seconds / 60
  	mins    = sprintf("%02d", minutes)
  	secs    = sprintf("%02d", seconds % 60)
    if format == :standard
      "#{mins}:#{secs} [#{dots_for(minutes)}]"
    else
      "#{mins}:#{secs}"
    end
  end

  def dots_for mins
  	"#{'.' * (25 - mins)}#{' ' * mins}"
  end

end
