# ring_area

[![Crystal CI](https://github.com/geocrystal/ring_area/actions/workflows/crystal.yml/badge.svg)](https://github.com/geocrystal/ring_area/actions/workflows/crystal.yml)
[![GitHub release](https://img.shields.io/github/release/geocrystal/ring_area.svg)](https://github.com/geocrystal/ring_area/releases)
[![License](https://img.shields.io/github/license/geocrystal/ring_area.svg)](https://github.com/geocrystal/ring_area/blob/main/LICENSE)

Calculate the approximate area of the polygon were it projected onto the earth.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     ring_area:
       github: geocrystal/ring_area
   ```

2. Run `shards install`

## Usage

```crystal
require "ring_area"

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

RingArea.ring_area(coordinates).to_meters
# => 7748891609977.456
```
Accepts an `Array(Array(Number))` of Ring Coordinates as `[[longitude1, latitude1], [longitude2, latitude2], ...]`.

Returns the approximate signed geodesic area of the polygon in square meters.

## Contributing

1. Fork it (<https://github.com/geocrystal/ring_area/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Anton Maminov](https://github.com/mamantoha) - creator and maintainer
