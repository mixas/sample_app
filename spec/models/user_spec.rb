# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe User do

  before(:each) do
    @attr = { :name => "Example User", :email => "user@example.com" }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@attr)
  end

  it "should require a name" do
    user_with_blank_name = User.new(@attr.merge( :name => ""))
    user_with_blank_name.should_not be_valid
  end

  it "should create new user" do
    User.create!(@attr)
  end

  it "should require email" do
    user_with_blank_email = User.new(@attr.merge(:email => ""))
    user_with_blank_email.should_not be_valid
  end

  it "name length should not be more then 50 simbols " do
    long_name = "a" * 51
    user_long_name = User.new(@attr.merge(:name => long_name))
    user_long_name.should_not be_valid 
  end

  it "should accept email validation" do
    emails_array = %w[mixas.shel@gmail.com Mi@mail.RU ivanov@sd.gdd.dd]
    emails_array.each do |mail|
      user = User.new(@attr.merge(:email => mail))
      user.should be_valid
    end
  end

  it "should reject email validation" do
    emails_array = %w[mixas.shelgmail.com Mi@dv@mail.RU @sd.gdd.dd]
    emails_array.each do |mail|
      user = User.new(@attr.merge(:email => mail))
      user.should_not be_valid
    end
  end

  it "should reject duplicate email" do
    email_up = @attr[:email].upcase
    User.create!(@attr.merge(:email => email_up))
    new_user = User.new(@attr.merge(:email => email_up))
    new_user.valid?
  end

  
end
