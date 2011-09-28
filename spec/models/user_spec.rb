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
    @attr = { :name => "Example User", 
 	      :email => "user@example.com",
              :password => "examplepass",
              :password_confirmation => "examplepass"
	    }
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

  
  describe "password validations" do

    it "should require a password" do
      User.new(@attr.merge(:password => "", :password_confirmation => "")).
        should_not be_valid
    end

    it "should require a matching password confirmation" do
      User.new(@attr.merge(:password_confirmation => "invalid")).
      should_not be_valid
    end

    it "should reject short passwords" do
      short = "a" * 5
      hash = @attr.merge(:password => short, :password_confirmation => short)
      User.new(hash).should_not be_valid
    end

    it "should reject long passwords" do
      long = "a" * 41
      hash = @attr.merge(:password => long, :password_confirmation => long)
      User.new(hash).should_not be_valid
    end
  end

  describe "password encryption" do

    before(:each) do
      @user = User.create!(@attr)
    end

    it "should have an encrypted password attribute" do
      @user.should respond_to(:encrypted_password)
    end

    it "should set the encrypted password" do
      @user.encrypted_password.should_not be_blank
    end

    describe "has_password?" do
      
      it "should be true if the passwords match" do
        @user.has_password?(@attr[:password]).should be_true
      end

      it "should be false if the passwords don't match" do
        @user.has_password?("invalid").should be_false
      end
    end

    describe "Password walidations" do
 
      it "should be nil if email/password mismatch" do
        wrong_pass_user = User.authenticate(@attr[:pass], "wrong_pass")
        wrong_pass_user.should be_nil
      end

      it "should be nil if email is wrong" do
        wrong_email_user = User.authenticate("wrong@mail.ru", @attr[:password])
      end

      it "should return user if email/pass match" do
        matching_user = User.authenticate(@attr[:email], @attr[:password])
        matching_user.should == @user
      end
    end

  end
    
end
