require 'spec_helper'

module Mancala

  describe Board do
    subject { Board.new }

    it "should have 14 slots" do
      pending
      subject.slots.size.should == 14
    end
  end

end