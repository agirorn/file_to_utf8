require 'spec_helper'

require_relative '../lib/file_encoding_detector.rb'
require 'ostruct'

describe FileEncodingDetector do
  let(:encodings) { ['ISO-8859-15'] }
  let(:bad_encodings) { [ 'MacJapanese', 'ASCII-8BIT', 'US-ASCII' ] }
  let(:filename) { 'spec/fixtures/itemlist.txt' }
  let(:detector) { FileEncodingDetector.new filename }

  it 'has a list of encodings' do
    list = [ OpenStruct.new(:name => 'ISO-8859-15') ]
    Encoding.stub(:list => list)

    expect(FileEncodingDetector.encodings).to eq(encodings)
  end

  it 'reports readable encoding' do
    FileEncodingDetector.stub(:encodings => encodings)
    expect(detector.detect).to eq(encodings)
  end

  it 'reports readable encodings eavan on exception' do
    FileEncodingDetector.stub(:encodings => bad_encodings)
    expect(detector.detect).to eq([])
  end
end

