require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "a user should enter their first name" do
    user = User.new
    assert !user.save
    assert !user.errors[:first_name].empty?
  end

  test "a user should enter their last name" do
    user = User.new
    assert !user.save
    assert !user.errors[:last_name].empty?
  end

  test "a user should enter their profile name" do
    user = User.new
    assert !user.save
    assert !user.errors[:profile_name].empty?
  end

  test "a user should have a unique profile name" do
    user = User.new
    user.profile_name = users(:jon).profile_name
    
    assert !user.save
    puts user.errors.inspect
    assert !user.errors[:profile_name].empty?
  end

  test "a user should have a profile name without spaces" do
    user = User.new
    user.profile_name = "My profile name"
    assert !user.save
    assert !user.errors[:profile_name].empty?
    assert user.errors[:profile_name].include?("must be formatted correctly.")
  end

  test "a user can have a correctly formatted profile name" do
    user = User.new(first_name: "jon", last_name: "goodey", email: "goodeyjon1@hotmail.com")
    user.profile_name = "My profile name"
    user.password = user.password_confirmation = "asdfghjk"
    user.profile_name = "jon11"
    assert user.valid?
  end
end