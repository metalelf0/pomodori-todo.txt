class Countdown
  
  def run seconds, options={}  
    seconds.downto(0) do |current_seconds|
      sleep 1
      write_tmux(current_seconds, seconds) if (options[:services] || []).include?(:tmux)
      set_window_title(current_seconds, seconds) if (options[:services] || []).include?(:iterm2)
      STDOUT.write "[RUNNING] #{to_minutes(current_seconds, seconds)}\r"
      if ENV.has_key?('POMODORO_SIG_SIGNAL') && ENV.has_key?('POMODORO_SIG_PROCESS')
        system("pkill -RTMIN+" + ENV['POMODORO_SIG_SIGNAL'] + " " + ENV['POMODORO_SIG_PROCESS'])
      end
    end
  end

  private

  def write_tmux(current_seconds, seconds)
    `echo #{to_minutes(current_seconds, seconds, :tmux)} > ~/.pomo.txt.tmux` 
  end

  def set_window_title(current_seconds, seconds)
    title = to_minutes(current_seconds, seconds, :tmux)
    `echo -ne "\e]1;#{title}\a"`
  end

  def to_minutes current_seconds, seconds, format=:standard
    minutes = seconds / 60
    current_minutes = current_seconds / 60
    mins    = sprintf("%02d", current_minutes)
    secs    = sprintf("%02d", current_seconds % 60)
    if format == :standard
      "#{mins}:#{secs} [#{dots_for(current_minutes, minutes)}]"
    else
      "#{mins}:#{secs}"
    end
  end


  def dots_for mins, overall
    "#{'.' * (overall - mins)}#{' ' * mins}"
  end

end
