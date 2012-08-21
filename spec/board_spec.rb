require 'spec_helper'

module Mancala

  describe Board do
    subject { Board.new }

    it "should have 14 slots" do
      subject.slots.size.should == 14
    end

    it "should have four stones in each slot" do
      subject.slots.each do |count|
        count.should == 4
      end
    end

    it "should have no stones in each player's pot" do
      pending
    end
  end

end