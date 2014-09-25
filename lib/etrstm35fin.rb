require 'etrstm35fin/version'
require 'cmath'

module Etrstm35fin
  WGS84_MAJOR = 6378137.0
  WGS84_MINOR = 6356752.314245
  FLATTENING = 1.0 / 298.257223563
  SCALE_FACTOR = 0.9996
  FALSE_EASTING = 500000.0
  FALSE_NORTHING = 0.0
  CENTRAL_MERIDIAN = 27.0

  def self.to_wgs84(north_coordinate, east_coordinate)
    central_meridian = to_radians(CENTRAL_MERIDIAN)

    n = FLATTENING / (2.0 - FLATTENING)
    a1 = WGS84_MAJOR / (1.0 + n) * (1.0 + (n**2.0) / 4.0 + (n**4.0) / 64.0)
    e = Math.sqrt(2.0 * FLATTENING - (FLATTENING**2.0))
    h1 = 1.0 / 2.0 * n - 2.0 / 3.0 * (n**2.0) + 37.0/96.0 * (n**3.0) - 1.0/360.0 * (n**4.0)
    h2 = 1.0 / 48.0 * (n**2.0) + 1.0/15.0 * (n**3.0) - 437.0/1440.0 * (n**4.0)
    h3 = 17.0 / 480.0 * (n**3.0) - 37.0 / 840.0 * (n**4.0)
    h4 = 4397.0 / 161280.0 * (n**4.0)

    ee = north_coordinate / (a1 * SCALE_FACTOR)
    nn = (east_coordinate - FALSE_EASTING) / (a1 * SCALE_FACTOR)

    e1p = h1 * Math.sin(2.0 * ee) * Math.cosh(2.0 * nn)
    e2p = h2 * Math.sin(4.0 * ee) * Math.cosh(4.0 * nn)
    e3p = h3 * Math.sin(6.0 * ee) * Math.cosh(6.0 * nn)
    e4p = h4 * Math.sin(8.0 * ee) * Math.cosh(8.0 * nn)

    nn1p = h1 * Math.cos(2.0 * ee) * Math.sinh(2.0 * nn)
    nn2p = h2 * Math.cos(4.0 * ee) * Math.sinh(4.0 * nn)
    nn3p = h3 * Math.cos(6.0 * ee) * Math.sinh(6.0 * nn)
    nn4p = h4 * Math.cos(8.0 * ee) * Math.sinh(8.0 * nn)

    ep = ee - e1p - e2p - e3p - e4p

    nnp = nn - nn1p - nn2p - nn3p - nn4p
    be = Math.asin(Math.sin(ep) / Math.cosh(nnp))

    q = CMath.asinh(Math.tan(be))
    qp = q + e * CMath.atanh(e * Math.tanh(q))
    qp = q + e * CMath.atanh(e * Math.tanh(qp))
    qp = q + e * CMath.atanh(e * Math.tanh(qp))
    qp = q + e * CMath.atanh(e * Math.tanh(qp))

    lat = to_degrees(Math.atan(Math.sinh(qp)))
    lon = to_degrees(central_meridian + Math.asin(Math.tanh(nnp) / Math.cos(be)))
    [lat, lon]
  end

  def self.to_degrees(val)
    (val  * 180.0) / Math::PI
  end

  def self.to_radians(degree)
    degree * (Math::PI / 180)
  end
end
