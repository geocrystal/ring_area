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
    ring_area_1 = RingArea.ring_area(coordinates)
    ring_area_2 = RingArea.ring_area(other_coordinates)

    it { (ring_area_1 == ring_area_2).should be_false }
    it { (ring_area_1 > ring_area_2).should be_true }
  end

  describe "operations" do
    ring_area_1 = RingArea.ring_area(coordinates)
    ring_area_2 = RingArea.ring_area(other_coordinates)

    it { (ring_area_1 + ring_area_2).should be_a(RingArea::Area) }
    it { (ring_area_1 + ring_area_2).to_meters.should eq(7798346482558.176) }
    it { (ring_area_1 - ring_area_2).to_meters.should eq(7699436737396.736) }
    it { [ring_area_1, ring_area_2].sum.to_meters.should eq(7798346482558.176) }
  end
end
