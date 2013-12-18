#!/usr/bin/env ruby
require_relative "blinky-tape"

class BlinkyTapeGuard < BlinkyTape
  COLORS = {
    'success' => 'g',
    'failed'  => 'r',
    'pending' => 'y',
  }

  def initialize(options={})
    @filename = options[:filename]
  end

  def set_status!
    solid!
    color! test_status_color
  end

  protected
  def test_status_color
    COLORS[line] || 'w'
  end

  def line
    File.open(@filename, &:readline).strip
  end
end
