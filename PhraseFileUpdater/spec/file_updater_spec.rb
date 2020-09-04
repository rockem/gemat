require 'file_updater'

describe FileUpdater do

  PHRASES_FILE = "phrases.tmp"
  LINE1 = "LINE 1"
  LINE2 = "LINE 2"

  before(:each) do
    createPhrasesFile
    @fileUpdater = FileUpdater.new(PHRASES_FILE)
    @processor = mock("Processor")
  end

  after(:each) do
    File.delete(PHRASES_FILE)
  end

  it "should delegate every row to processor" do
    @processor.should_receive(:process).with(LINE1)
    @processor.should_receive(:process).with(LINE2)
    @fileUpdater.updateWith(@processor)
  end

  def createPhrasesFile
    phrasesFile = File.new(PHRASES_FILE, "w")
    phrasesFile.puts LINE1
    phrasesFile.puts LINE2
    phrasesFile.close
  end

  it "should write processor output back to file" do
    processed_lines = ["P_LINE1", "P_LINE2"]
    @processor.stub!(:process).with(LINE1).and_return(processed_lines[0])
    @processor.stub!(:process).with(LINE2).and_return(processed_lines[1])
    @fileUpdater.updateWith(@processor)

    assertFileContains processed_lines
  end

  def assertFileContains(lines)
    row = 0
    file = File.new(PHRASES_FILE, "r")
    while (line = file.gets)
      line.chomp.should == lines[row]
      row = row + 1
    end
    file.close
  end


end

