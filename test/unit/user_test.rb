require 'test_helper'

class UserTest < ActiveSupport::TestCase

    def setup
        @user_1 = User.create
        @user_2 = User.create
    end

    def teardown
        @user_1 = nil
        @user_2 = nil
    end

  # Replace this with your real tests.
  test "the truth" do
    assert true
  end


    test "create new user" do
        assert @user_1.id < @user_2.id
    end 
end
