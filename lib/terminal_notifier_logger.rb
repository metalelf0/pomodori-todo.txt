class TerminalNotifierLogger
  def notify_start task
    TerminalNotifier.notify("#{task.index} #{task.text}", title: 'Pomodoro Started', sound: 'Glass')
  end

  def notify_completed task
    TerminalNotifier.notify("#{task.index} #{task.text}", title: 'Pomodoro Completed!', sound: 'Glass')
  end
end
