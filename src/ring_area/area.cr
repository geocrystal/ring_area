module RingArea
  class Area
    include Comparable(self)

    property area

    def initialize(@area : Number)
    end

    {% for factor in RingArea::FACTORS.keys %}
      def to_{{factor.id}} : Number
        factor = RingArea::FACTORS[:{{factor.id}}]

        @area * RingArea::FACTOR * factor
      end
    {% end %}

    def <=>(other : RingArea::Area)
      area <=> other.area
    end

    def self.zero : RingArea::Area
      new(0)
    end

    # Adds the value of `self` to *other*.
    def +(other : RingArea::Area) : RingArea::Area
      RingArea::Area.new(self.area + other.area)
    end

    # Removes the value of *other* from `self`.
    def -(other : RingArea::Area) : RingArea::Area
      RingArea::Area.new(self.area - other.area)
    end
  end
end
