require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "SimpleLogging" do
  LOG_FILE = File.dirname(__FILE__)+'/test.log' 
  TEST_LOG_MESSAGE = "This is a simple log message" 
  TEST_LOG_MESSAGE_B = "This is another simple log message" 
  
  describe "with simple output" do
    before(:each) do 
      File.delete LOG_FILE if File.exist? LOG_FILE
      class A 
        class << self
          attr_accessor :logger
        end
        include NoPlanB::SimpleLogging
        @logger = configure_simple_logger(file: LOG_FILE)
      end      
    end
    
    it "should be able to write to the log with class method simple_log" do
      A.simple_log TEST_LOG_MESSAGE
      expect(File.exist?(LOG_FILE)).to be true
      lines = File.readlines(LOG_FILE)
      expect(lines[0].chomp).to eq TEST_LOG_MESSAGE
    end
    
    it "should be able to write to log using instance method simple_log " do
      A.new.simple_log TEST_LOG_MESSAGE_B
      lines = File.readlines(LOG_FILE)
      expect(lines[0].chomp).to eq TEST_LOG_MESSAGE_B      
    end
    
    it "should be able to write to the log using the logger" do
      A.logger.log TEST_LOG_MESSAGE*2
      lines = File.readlines(LOG_FILE)
      expect(lines[0].chomp).to eq TEST_LOG_MESSAGE*2      
    end
  end
  
  describe "When including the module with timestamped output" do
    before(:each) do 
      File.delete LOG_FILE if File.exist? LOG_FILE
      class A 
        include NoPlanB::SimpleLogging
        logger = configure_simple_logger(file: LOG_FILE, time_stamp: true)
      end      
      A.simple_log TEST_LOG_MESSAGE
    end
    
    it "should have created a log file with correct timestamped message" do
      expect(File.exist?(LOG_FILE)).to be true
      lines = File.readlines(LOG_FILE)
      test_message_start = lines[0].index(TEST_LOG_MESSAGE)
      expect(test_message_start).to be > 0
      timestamp = lines[0][0...test_message_start-2]
      expect(timestamp).to match %r{\d{2}/\d{2}/\d{2} \d{2}:\d{2}:\d{2}}
    end
  end
  
  describe  "when "
end
