class TerminalNotifierLogger
  def notify_start task
    TerminalNotifier.notify('Pomodoro started', title: 'Pomotxt', sound: 'Glass')
  end

  def notify_completed task
    TerminalNotifier.notify('Pomodoro completed!', title: 'Pomotxt', sound: 'Glass')
  end
end
