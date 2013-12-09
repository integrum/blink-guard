#!/usr/bin/env ruby
require "serialport"

class BlinkyTape
  COLORS = {
    'success' => 'g',
    'failed'  => 'r',
    'pending' => 'y',
  }

  def initialize(options={})
    @filename = options[:filename]
  end

  def blue!
    serial_port.puts 'sb'
  end

  def flash!
    solid!
    serial_port.puts flash_command
  end

  def pulse!
    solid!
    serial_port.puts pulse_command
  end

  def rainbow!
    serial_port.puts 'xx'
  end

  def solid!
    serial_port.puts solid_command
  end

  def shutdown!
    serial_port.puts 'sb'
    serial_port.flush
    serial_port.close
  end

  protected
  def color
    COLORS[line] || 'w'
  end

  def flash_command
    "f#{color}"
  end

  def line
    File.open(@filename, &:readline).strip
  end

  def pulse_command
    "p#{color}"
  end

  def serial_port
    @serial_port ||= SerialPort.new '/dev/ttyACM0', 9600, 8, 1, SerialPort::NONE
  end

  def solid_command
    "s#{color}"
  end
end

if $0 == __FILE__
  @blinky_tape = BlinkyTape.new
  @blinky_tape.blue!
end
