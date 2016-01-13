class NotifierFactory

  def self.notifier_for_current_architecture
    if OS.mac?
      return TerminalNotifierLogger.new
    elsif OS.linux?
      return LinuxNotifierLogger.new
    end
  end
end
