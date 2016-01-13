class LinuxNotifierLogger
  def notify_start task
    `notify-send "Pomotxt" "Pomodoro started"`
  end

  def notify_completed task
    `notify-send "Pomotxt" "Pomodoro completed!"`
  end
end
