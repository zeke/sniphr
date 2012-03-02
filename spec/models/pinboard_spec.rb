require 'spec_helper'

describe Pinboard do

  before(:each) do
    @tags = Pinboard.get_tags_for_url('http://google.com')
  end

  it "returns an array of tags for a URL" do
    @tags.should be_an(Array)
  end

  it "returns tags for google.com" do
    @tags.should include('search')
    @tags.any?{|t| t =~ /search/ }.should == true
  end

  it "doesn't return user-specific 'social' tags" do
    @tags.any?{|t| t =~ /for:/ }.should == false
  end

  it "returns an empty array if no tags were found" do
    @tags = Pinboard.get_tags_for_url('http://nofuckingwaythisworks-i-hope.com')
    @tags.should == []
  end

end