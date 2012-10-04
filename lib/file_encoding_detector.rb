
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
    encodings = []
    FileEncodingDetector.encodings.each do |encoding|
      begin
        File.open(@filename, :external_encoding =>  encoding, :internal_encoding =>  'UTF-8', ) do |file|
          file.readlines
        end
        encodings << encoding
      rescue Encoding::InvalidByteSequenceError
      rescue Encoding::ConverterNotFoundError
      rescue Encoding::UndefinedConversionError
      end
    end
    encodings
  end
end

