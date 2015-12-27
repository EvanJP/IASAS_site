require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

    test "should get home" do
        get :home
        assert_response :success
    end

    test "should get streams" do
        get :streams
        assert_response :success
    end

    test "should get profiles" do
        get :profiles
        assert_response :success
    end
    
    test "should get hfame" do
        get :hfame
        assert_response :success
    end