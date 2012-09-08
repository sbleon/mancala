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

    it "should move stones the right places" do
      subject.move 4
      subject.slots[0..5].should == [5, 5, 5, 5, 0, 4]
    end
  end

end