class PomoLogger

  attr_accessor :options

  def initialize opts
    @options = opts
  end

  def log_pomodoro_started task
    TerminalNotifierLogger.new.notify_start(task)
    FileLogger.new(options[:pomodoro_log_file]).notify_start(task)
  end

  def log_pomodoro_completed task
    TerminalNotifierLogger.new.notify_completed(task)
    FileLogger.new(options[:pomodoro_log_file]).notify_completed(task)
  end

end
