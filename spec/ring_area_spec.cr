require "./spec_helper"

describe RingArea do
  coordinates = [
    [125, -15],
    [113, -22],
    [117, -37],
    [130, -33],
    [148, -39],
    [154, -27],
    [144, -15],
    [125, -15],
  ]

  other_coordinates = [
    [-1, -1],
    [-1, 1],
    [1, 1],
    [1, -1],
    [-1, -1],
  ]

  it ".rign_area" do
    RingArea.ring_area(coordinates).should be_a(RingArea::Area)
    RingArea.ring_area(coordinates).to_meters.should eq(7748891609977.456)
    RingArea.ring_area(coordinates).to_kilometers.should eq(7748891.609977456)
  end

  describe "<=>" do
    it { (coordinates == other_coordinates).should be_false }
    it { (coordinates > other_coordinates).should be_true }
  end
end
