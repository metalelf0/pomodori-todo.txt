require 'fileutils'

class FileLogger

  attr_accessor :pomodoro_log_file

  def initialize log_file_path
    @pomodoro_log_file = log_file_path 
    FileUtils.touch pomodoro_log_file
  end

  def notify_start task
    add_separator_if_new_day
    File.open(pomodoro_log_file, "a") { |file| file.puts "#{Time.now.strftime('%Y/%m/%d %H:%M')} Pomodoro nr. #{sprintf("% 2d", task.pomodori + 1)} started:   #{task.text}" }
  end

  def notify_completed task
    File.open(pomodoro_log_file, "a") { |file| file.puts "#{Time.now.strftime('%Y/%m/%d %H:%M')} Pomodoro nr. #{sprintf("% 2d", task.pomodori + 1)} completed: #{task.text}" }
  end

  private

  def add_separator_if_new_day
    return if File.zero?(pomodoro_log_file)
    last_day = File.open(pomodoro_log_file, "r")  { |file| file.readlines.last.split(" ")[0]}
    today    = Time.now.strftime('%Y/%m/%d')
    File.open(pomodoro_log_file, "a") { |file| file.puts "\n-----------\n\n" } if last_day != today
  end
end
