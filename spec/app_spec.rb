require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "WTF Tracker" do
  include Capybara
  # Capybara.default_driver = :selenium  # when I start testing JS

  before(:each) do
    Capybara.app = Sinatra::Application.new
  end

  describe "root" do
    it "should respond" do
      visit '/'
      page.status_code.should == 200
    end
  end
  
end
