require 'spec_helper'

describe User do
  
  before do
    @user = Factory(:user)
  end
  
  describe "initialize" do
    
    it "generates a permalinkish UID for the user based on the provider handle"
    
    it "is in public mode by default" do
      @user = User.new
      @user.mode.should == "public"
    end
    
  end

  describe "helper methods for provider" do
        
    it "facebook?" do
      @user.facebook?.should == false
      @user.provider = "facebook"
      @user.facebook?.should == true
    end

    it "twitter?" do
      @user.twitter?.should == true
      @user.provider = "facebook"
      @user.twitter?.should == false
    end
    
    describe "url" do
      
      it "infers url for twitter users" do
        @user.nickname = 'bozo'
        @user.url.should == "https://twitter.com/#!/bozo"
      end
      
      it "uses fb_url if present, or defers to generic profile url" do
        @user.provider = 'facebook'
        @user.uid = '12345'
        @user.fb_url = "http://me.com"
        @user.url.should == "http://me.com"
        
        @user.fb_url = ""
        @user.url.should == "http://www.facebook.com/profile.php?id=12345"
      end

    end
    
  end
end
