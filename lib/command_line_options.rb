
require 'optparse'

class CommandLineOptions

  attr_reader :filename, :to_filename, :from_encoding, :detect
  alias :detect? :detect

  def initialize(argv)
    @argv = argv
  end

  def parse!
    add_banner
    add_detect
    option_parser.parse!(@argv)
    grap_mandatory_params
  end

private
  def grap_mandatory_params
    @filename = @argv.shift
    @to_filename = @argv.shift
    @from_encoding = @argv.shift
  end

  def options
    @options ||= {}
  end

  def add_banner
    option_parser.banner = "Usage: example.rb [options] file [new_file]"
  end

  def add_detect
    option_parser.on("-d", "--detect",
                                    "Detect posible file encodings") do |filename|
      @detect = true
    end
  end

  def option_parser
    @option_parser ||= OptionParser.new
  end

end
