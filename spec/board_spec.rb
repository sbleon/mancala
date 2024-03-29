require 'spec_helper'

module Mancala

  describe Board do
    subject { Board.new }

    it "should have 14 slots" do
      subject.slots.size.should == 14
    end

    it "should have four stones in each slot that is not a pot" do
      subject.slots.each_with_index do |count, slot_num|
        count.should == 4 unless [6,13].include? slot_num
      end
    end

    it "should have no stones in each player's pot" do
      subject.slots[6].should == 0
      subject.slots[13].should == 0
    end

    it "should move stones the right places" do
      subject.move 4
      subject.slots[0..5].should == [5, 5, 5, 5, 0, 4]
    end
  end

end