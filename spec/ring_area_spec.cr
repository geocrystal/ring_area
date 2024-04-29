require "./spec_helper"

describe RingArea do
  it ".rign_area" do
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

    RingArea.ring_area(coordinates).should eq(7748891609977.456)
    RingArea.ring_area(coordinates, :kilometres).should eq(7748891.609977456)
  end
end
