// TODO(WJOM): Make a Flutter package

class Range {
  const Range(this.start, this.end);

  final double start;
  final double end;
}

double Function(double) linearScale({
  Range domain = const Range(0, 1),
  required Range range,
}) {
  final startDomain = domain.start;
  final endDomain = domain.end;
  final startRange = range.start;
  final endRange = range.end;

  if (startDomain >= endDomain || startRange >= endRange) {
    throw Exception('Invalid values');
  }
  final factor = (endRange - startRange) / (endDomain - startDomain);

  return (double value) {
    if (value < startDomain || value > endDomain) {
      throw Exception('Value out of domain');
    }

    return (value - startDomain) * factor + startRange;
  };
}
