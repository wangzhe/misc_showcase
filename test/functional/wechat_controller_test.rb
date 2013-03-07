require 'test_helper'

class WechatControllerTest < ActionController::TestCase

  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  def readfile(filename)
    file = File.open(filename)
    contents = ""
    file.each { |line|
      contents << line
    }
    contents
  end

  test "should do talk" do
    contents = readfile("test/fixture/wechat_request.xml")

    post :talk, :format => "xml", :xml => Hash.from_xml(contents)["xml"]

    assert_response :success

    expect_response = readfile("test/fixture/wechat_response.xml")

    assert_equal expect_response, assigns[:_response_body][0]
  end
end
