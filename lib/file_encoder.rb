
class FileEncoder

  def initialize(filename_from, filename_to, encoding)
    @filename_from = filename_from
    @filename_to = filename_to
    @encoding = encoding
  end

  def encode
    File.open(@filename_from, :external_encoding => @encoding, :internal_encoding => 'UTF-8', ) do |file_from|
      File.open(@filename_to, 'w', :external_encoding => 'UTF-8', :internal_encoding => 'UTF-8', ) do |file_to|
        file_to.write file_from.read
      end
    end
  end

end

