require 'test_helper'

class RendersJsonTest < ActionDispatch::IntegrationTest
  
  test "json of plan data is accessible from browser" do
    visit plans_path
    assert page.has_content?("idk")
  end
  
end
