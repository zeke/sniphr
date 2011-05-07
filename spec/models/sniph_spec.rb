require 'spec_helper'

describe Sniph do


  describe "tags" do
    
    before(:each) do
      @sniph = Sniph.create!(:url => 'http://siteypants.com', :content => "we love pants")
    end

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

end
