require 'json'

module RB
  class Runner

  def initialize(options)
    @options = options
  end

  def run(command)
    @command = command

    case true
    when options[:filter]
      filter
    when options[:apply]
      STDIN.tty? ? apply_to_tty : apply_to_stdin
    else
      puts eval(command)
    end
  end

  private

    attr_reader :options, :command

    def filter
      STDIN.select do |line|
        line = process_input(line)
        eval(command)
      end.each do |line|
        puts process_output(line)
      end
    end

    def apply_to_tty
      while line = STDIN.gets do
        line = process_input(line)
        puts "=> #{eval(command)}"
      end
    end

    def apply_to_stdin
      STDIN.each_line do |line|
        line = process_input(line)
        puts process_output(eval(command))
      end
    end

    def process_input(line)
      line.strip!
      line = JSON.load(line) if options[:json_input]
      line
    end

    def process_output(line)
      line = JSON.dump(line) if options[:json_output]
      line
    end

  end
end
