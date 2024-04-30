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

    def <=>(other : Haversine::Distance)
      area <=> other.area
    end
  end
end
