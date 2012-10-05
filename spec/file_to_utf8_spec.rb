require 'spec_helper'
require_relative '../lib/file_to_utf8.rb'

describe FileToUtf8 do

  let(:filename) { 'a_file_name' }
  let(:to_filename) { 'to_filename' }
  let(:encoding) { 'from_encoding' }
  let(:detector) { stub(:detector) }
  let(:encoder) { stub(:encode) }
  let(:subject) { FileToUtf8.new }

  let(:options) do
    stub(
      :encode? => false,
      :detect? => false,
      :filename => filename,
      :to_filename => to_filename,
      :from_encoding => encoding,
    )
  end

  before do
    CommandLineOptions.should_receive(:new).and_return(options)
  end

  it 'runs the encoding' do
    options.stub :encode? => true
    FileEncoder.should_receive(:new).with(filename, to_filename, encoding).and_return(encoder)
    encoder.should_receive(:encode)

    subject.run
  end

  it 'detects encoding' do
    options.stub( :detect? => true )
    FileEncodingDetector.should_receive(:new).with(filename).and_return(detector)
    detector.should_receive(:detect).and_return(['ASCI', 'UTF8'])

    subject.should_receive(:puts).with("ASCI\nUTF8")
    subject.run
  end

end
