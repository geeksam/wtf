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

  describe "the new project form" do
    it "should live at /projects" do
      visit '/projects'
      page.should have_field('Name')
      page.should have_field('Slug')
    end

    it "should post to /projects/create, create a Project, and redirect to /projects/:slug" do
      visit '/projects'
      fill_in 'Name', :with => 'My Spiffy Project'
      fill_in 'Slug', :with => 'my-spiffy-project'
      click_button 'Create Project'

      project = Project.find_by_slug('my-spiffy-project')
      project.should_not be_nil
      project.name.should == 'My Spiffy Project'
      project.slug.should == 'my-spiffy-project'

      current_path.should == '/projects/my-spiffy-project'
    end

    it "should re-render if no project name is supplied"
    it "should try to create a slug if one is not supplied"
  end

  describe "the project page" do
    it "should exist"
  end

end
