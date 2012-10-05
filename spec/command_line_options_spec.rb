require 'spec_helper'
require_relative '../lib/command_line_options'

describe CommandLineOptions do
  let(:help_banner) do
    [
      "Usage: example.rb [options] file [new_file]",
      "    -d, --detect                     Detect posible file encodings"
    ].join("\n").concat("\n")
  end

  before do
    OptionParser.stub(:puts)
    OptionParser.stub(:exit)
  end

  it 'displays help on --help' do
    OptionParser.should_receive(:puts).with(help_banner)
    CommandLineOptions.new(['--help']).parse!
  end

  it 'has no detect by default' do
    options = CommandLineOptions.new([])
    options.parse!
    expect(options.detect).to be_false
  end

  it 'sets detect on -d' do
    options = CommandLineOptions.new(['-d', 'file'])
    options.parse!
    expect(options.detect).to be_true
    expect(options.detect?).to be_true
    expect(options.filename).to eq('file')
  end

  it 'sets detect on --detect' do
    options = CommandLineOptions.new(['--detect', 'file'])
    options.parse!
    expect(options.detect).to be_true
    expect(options.detect?).to be_true
    expect(options.filename).to eq('file')
  end

  it 'sets filename and to_filename and from_encoding' do
    options = CommandLineOptions.new(['file_to_encode', 'file_to_save_to', 'ASCI-US'])
    options.parse!
    expect(options.filename).to eq('file_to_encode')
    expect(options.to_filename).to eq('file_to_save_to')
    expect(options.from_encoding).to eq('ASCI-US')
  end


end
