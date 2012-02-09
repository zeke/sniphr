require 'spec_helper'

describe Sniph do

    before(:each) do
      @sniph = Sniph.create!(:url => 'http://siteypants.com', :content => "we love pants")
    end


  describe "tags" do
    
    it "doesn't have any tags to start with" do
      @sniph.tags.should == []
      @sniph.cached_tag_list.should be_nil
    end

    it "blatantly updates tags" do
      @sniph.blatantly_update_tags!('boo, dazz')
      @sniph.tags.size.should == 2
      @sniph.cached_tag_list.should == "boo, dazz"
    end
        
  end
  
  describe "images" do
    
    it "knows when it's a JPEG image" do
      @sniph.content = "http://morehay.com/hayhayhay.png"
      @sniph.image?.should == true
    end

    it "knows when it's a PNG image" do
      @sniph.content = "http://wingwongsingsong.com/x/blah/dodododod/12345.png"
      @sniph.image?.should == true
    end
    
    it "knows when it's a GIF image" do
      @sniph.content = "http://STINGRAY.com/flibbity.GIF"
      @sniph.image?.should == true
    end

    it "knows when it's NOT an image" do
      @sniph.content = "I hate images"
      @sniph.image?.should == false
    end
    
  end
  
  it "knows that it's awesome" do
    true.should == true
  end

end
