require 'optparse'

class CommandLineOptions

  attr_reader :filename, :to_filename, :from_encoding, :detect
  alias :detect? :detect

  def initialize(argv)
    @argv = argv
    parse!
  end

  def encode?
    filename and to_filename and from_encoding
  end

private

  def parse!
    set_help_on_empty_params
    add_banner
    add_detect
    option_parser.parse!(@argv)
    grap_mandatory_params
  end

  def set_help_on_empty_params
    @argv << '--help' if @argv.length == 0
  end

  def grap_mandatory_params
    @filename = @argv.shift
    @to_filename = @argv.shift
    @from_encoding = @argv.shift
  end

  def options
    @options ||= {}
  end

  def add_banner
    option_parser.banner = "Usage: file_to_utf8.rb [options] file new_file encoding"
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
