class PomoLogger
  attr_accessor :options

  def initialize opts
    @options = opts
    @notifier = NotifierFactory.notifier_for_current_architecture
  end

  def log_pomodoro_started task
    @notifier.notify_start(task)
    FileLogger.new(options[:pomodoro_log_file]).notify_start(task)
  end

  def log_pomodoro_completed task
    @notifier.notify_completed(task)
    FileLogger.new(options[:pomodoro_log_file]).notify_completed(task)
  end

end
