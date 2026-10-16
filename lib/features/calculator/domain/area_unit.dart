enum AreaUnit {
  sqFt(
    displayName: 'Square Feet (sq ft)',
    shortName: 'sq ft',
    sqFtFactor: 1.0,
    symbol: 'ft²',
  ),
  sqYd(
    displayName: 'Square Yard / Gaj (sq yd)',
    shortName: 'sq yd',
    sqFtFactor: 9.0,
    symbol: 'yd²',
  ),
  sqM(
    displayName: 'Square Meter (sq m)',
    shortName: 'sq m',
    sqFtFactor: 10.7639104,
    symbol: 'm²',
  ),
  acre(
    displayName: 'Acre',
    shortName: 'acre',
    sqFtFactor: 43560.0,
    symbol: 'ac',
  ),
  hectare(
    displayName: 'Hectare',
    shortName: 'ha',
    sqFtFactor: 107639.104,
    symbol: 'ha',
  ),
  guntha(
    displayName: 'Guntha',
    shortName: 'guntha',
    sqFtFactor: 1089.0,
    symbol: 'gth',
  ),
  bigha(
    displayName: 'Bigha (Standard)',
    shortName: 'bigha',
    sqFtFactor: 27225.0,
    symbol: 'bigha',
  ),
  cent(
    displayName: 'Cent',
    shortName: 'cent',
    sqFtFactor: 435.6,
    symbol: 'cent',
  ),
  ground(
    displayName: 'Ground',
    shortName: 'ground',
    sqFtFactor: 2400.0,
    symbol: 'ground',
  ),
  marla(
    displayName: 'Marla',
    shortName: 'marla',
    sqFtFactor: 272.25,
    symbol: 'marla',
  ),
  kanal(
    displayName: 'Kanal',
    shortName: 'kanal',
    sqFtFactor: 5445.0,
    symbol: 'kanal',
  );

  final String displayName;
  final String shortName;
  final double sqFtFactor;
  final String symbol;

  const AreaUnit({
    required this.displayName,
    required this.shortName,
    required this.sqFtFactor,
    required this.symbol,
  });

  /// Converts a value from this unit to another unit
  double convertTo(double value, AreaUnit targetUnit) {
    if (this == targetUnit) return value;
    final valueInSqFt = value * sqFtFactor;
    return valueInSqFt / targetUnit.sqFtFactor;
  }
}

enum LengthUnit {
  feet(displayName: 'Feet (ft)', factorInFeet: 1.0),
  yards(displayName: 'Yards (yd)', factorInFeet: 3.0),
  meters(displayName: 'Meters (m)', factorInFeet: 3.28084),
  inches(displayName: 'Inches (in)', factorInFeet: 0.0833333);

  final String displayName;
  final double factorInFeet;

  const LengthUnit({
    required this.displayName,
    required this.factorInFeet,
  });

  double toFeet(double value) => value * factorInFeet;
}
