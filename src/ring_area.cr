module RingArea
  VERSION = {{ `shards version #{__DIR__}`.chomp.stringify }}

  EARTH_RADIUS = 6371008.8

  # A constant factor used to compute the area of a polygon.
  # It's derived from the square of the Earth's radius divided by 2.
  FACTOR = (EARTH_RADIUS * EARTH_RADIUS) / 2

  # A constant used for converting degrees to radians.
  # Represents the ratio of PI to 180.
  PI_OVER_180 = Math::PI / 180

  extend self

  # Calculate the approximate area of the polygon were it projected onto the earth.
  #
  # Reference:
  # Robert. G. Chamberlain and William H. Duquette, "Some Algorithms for Polygons on a Sphere",
  # JPL Publication 07-03, Jet Propulsion
  # Laboratory, Pasadena, CA, June 2007 https://trs.jpl.nasa.gov/handle/2014/40409
  #
  # `coords` - Ring Coordinates as [[longitude, latitude], ...]
  #
  # Return the approximate signed geodesic area of the polygon in square meters.
  #
  # https://github.com/Turfjs/turf/blob/master/packages/turf-area/index.ts
  def ring_area(coords : Array(Array(Int32 | Float32 | Float64))) : Float64
    coords_length = coords.size

    return 0f64 if coords_length <= 2

    total = 0f64

    coords_length.times do |i|
      lower = coords[i]
      middle = coords[i + 1 == coords_length ? 0 : i + 1]
      upper = coords[i + 2 >= coords_length ? (i + 2) % coords_length : i + 2]

      lower_x = lower[0] * PI_OVER_180
      middle_y = middle[1] * PI_OVER_180
      upper_x = upper[0] * PI_OVER_180

      total += (upper_x - lower_x) * Math.sin(middle_y)
    end

    total.abs * FACTOR
  end
end
