class FileEncodingDetector

  def self.encodings
    Encoding.list.collect do |encoding|
      encoding.name
    end
  end

  def initialize(filename)
    @filename = filename
  end

  def detect
    encodings = FileEncodingDetector.encodings.collect do |encoding|
      begin
        File.open(@filename, :external_encoding =>  encoding, :internal_encoding =>  'UTF-8', ) do |file|
          file.readlines
        end
        encoding
      rescue Encoding::InvalidByteSequenceError
      rescue Encoding::ConverterNotFoundError
      rescue Encoding::UndefinedConversionError
      end
    end

    encodings.compact
  end

end

