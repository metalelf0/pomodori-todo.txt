class Countdown
  
  def run seconds, options={}
    tmux_on = (options[:services] || []).include?(:tmux)
    trap "SIGINT" do
      clear_tmux() if tmux_on
      exit 130
    end
    
    seconds.downto(0) do |current_seconds|
      sleep 1
      write_tmux(current_seconds) if tmux_on 
      set_window_title(current_seconds) if (options[:services] || []).include?(:iterm2)
      STDOUT.write "[RUNNING] #{to_minutes(current_seconds)}\r"
    end
    clear_tmux() if tmux_on
  end

  private

  def write_tmux(current_seconds)
    `echo #{to_minutes(current_seconds, :tmux)} > ~/.pomo.txt.tmux` 
  end

  def clear_tmux()
    `echo "break" > ~/.pomo.txt.tmux`
  end

  def set_window_title(current_seconds)
    title = to_minutes(current_seconds, :tmux)
    `echo -ne "\e]1;#{title}\a"`
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
