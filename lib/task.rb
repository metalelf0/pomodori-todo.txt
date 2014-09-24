require 'rainbow'

class Task

  attr_accessor :text
  attr_accessor :index
  attr_accessor :pomodori
  attr_accessor :planned

  POMO_REGEXP = / \(#pomo: (\d+)\/(\d+)\)$/
  PRIORITY_REGEXP = /^\([A-Z]+\) /
  STATUS_COLORS = {
    new: :white,
    planned: :green,
    in_progress: :yellow,
    completed: :blue,
    underestimated: :red
  }

  def initialize index, text
    @index = index.to_i
    if text =~ POMO_REGEXP
      @pomodori, @planned = text.match(POMO_REGEXP)[1].to_i, text.match(POMO_REGEXP)[2].to_i
    else
      @pomodori, @planned = 0, 0
    end
    @text = text.gsub(POMO_REGEXP, '').gsub(PRIORITY_REGEXP, '')
  end

  def to_s
    "#{text} (#pomo: #{pomodori}/#{planned})"
  end

  def add_pomo
    @pomodori += 1
  end

  def plan planned
    @planned = planned.to_i
  end

  def puts_highlighted
    return if blank?(text)
    print "#{index} #{text} "
    color = STATUS_COLORS[self.status]
    puts Rainbow("(#pomo: #{pomodori}/#{planned})").send(color)
  end

  def status
    return :new if pomodori == 0 && planned == 0
    return :planned if pomodori == 0 && planned != 0
    return :completed if pomodori == planned
    return :in_progress if pomodori != 0 && planned != 0 && pomodori < planned
    return :underestimated if pomodori != 0 && pomodori > planned
  end

  private

  def blank?(string)
    string == nil || string == ""
  end

end
