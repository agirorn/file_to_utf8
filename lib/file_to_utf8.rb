require_relative 'command_line_options.rb'
require_relative 'file_encoder.rb'
require_relative 'file_encoding_detector'

class FileToUtf8
  attr_reader :options

  def initialize
    @options = CommandLineOptions.new(ARGV)
  end

  def run
    if options.encode?
      encoder = FileEncoder.new(options.filename, options.to_filename, options.from_encoding)
      encoder.encode
    end

    if options.detect?
      encodings = FileEncodingDetector.new(options.filename).detect
      puts encodings.join("\n")
    end
  end
end

