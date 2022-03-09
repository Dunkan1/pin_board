require 'test_helper'

class PinsControllerTest < ActionDispatch::IntegrationTest
  # called before every single test
  setup do
    @user = users(:user_vic)
    sign_in(@user)
  end
  
  test "should get index" do
    get pins_url
    assert_response :success
  end

  test "should new pin" do
    get new_pin_url
    assert_response 200
  end
  
  # status code 302 Found
  # follow_redirect!
  # assert_equal I18n.t('devise.sessions.signed_in'), flash[:notice]
  # assert_response :redirect

  test "should create new pin" do
    image = fixture_file_upload('test/fixtures/files/samurai.jpg', 'image/jpg')
    post create_pin_url, pin: {  title: "MyString12",
      description: "MyText",
      image: image}
    # puts "========================================"
    # puts @response.content_type.to_str
    # $ text/html
    # puts "========================================"

    # assert_redirected_to @pin
    # assert_redirected_to pin_path(:pin)
    # "succesfully created new pin"
    assert_equal "succesfully created new pin", flash[:notice] 
  end

  test "shouldn't create new pin" do
    image = fixture_file_upload('test/fixtures/files/samurai.jpg', 'image/jpg')
    post create_pin_url, pin: {  description: "MyText",
      image: image}
    
    assert_template 'new'
  end

  test 'update pin' do
    image = fixture_file_upload('test/fixtures/files/samurai.jpg', 'image/jpg')
    put "/pins/1", pin: {  title: "MyString",
      description: "MyText",
      image: image}
    assert_equal "Pin was succesfully created", flash[:notice] 
  end

  test "destroy pin" do
    delete "/pins/2"
    assert_redirected_to root_path
  end

  test "shouldn't update pin" do 
    image = fixture_file_upload('test/fixtures/files/samurai.jpg', 'image/jpg')
    put "/pins/1", pin: {  title: "MyString3",
      description: "MyText",
      image: image}
    assert_template 'edit'
  end

  test 'upvote pin' do
    put "/pins/1/like", {}, {'HTTP_REFERER' => 'http://www.example.com'}
    assert_response :redirect
  end

end