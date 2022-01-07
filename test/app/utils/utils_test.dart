import 'package:flutter_test/flutter_test.dart';

import 'package:navigation_drawer_challenge/app/utils/utils.dart';

void main() {
  group('linearScale', () {
    test('it should work with default domain', () {
      final numScale = linearScale(range: const Range(0, 100));

      expect(numScale(0), 0);
      expect(numScale(0.5), 50.0);
      expect(numScale(1), 100.0);
    });

    test('it should fail with values out of domain', () {
      final numScale1 = linearScale(range: const Range(0, 100));
      expect(() => numScale1(-0.5), throwsA(isInstanceOf<Exception>()));
      expect(() => numScale1(1.5), throwsA(isInstanceOf<Exception>()));
      expect(numScale1(0.5), 50);

      final numScale2 = linearScale(
        domain: const Range(10, 20),
        range: const Range(0, 100),
      );
      expect(() => numScale2(5), throwsA(isInstanceOf<Exception>()));
      expect(() => numScale2(25), throwsA(isInstanceOf<Exception>()));
      expect(numScale2(15), 50);
    });

    test('it should work with negative domains', () {
      final numScale1 = linearScale(
        domain: const Range(-20, -10),
        range: const Range(0, 100),
      );

      expect(numScale1(-20), 0);
      expect(numScale1(-15), 50);
      expect(numScale1(-10), 100);
    });

    test('it should work with small domains', () {
      final numScale1 = linearScale(
        domain: const Range(0.01, 0.02),
        range: const Range(0, 100),
      );

      expect(numScale1(0.010).round(), 0);
      expect(numScale1(0.015).round(), 50);
      expect(numScale1(0.020).round(), 100);
    });

    test('it should work with custom domains', () {
      final numScale1 = linearScale(
        domain: const Range(0, 100),
        range: const Range(0, 100),
      );
      expect(numScale1(0), 0);
      expect(numScale1(0.5), 0.5);
      expect(numScale1(50), 50.0);
      expect(numScale1(100), 100.0);

      final numScale2 = linearScale(
        domain: const Range(0, 0.1),
        range: const Range(0, 100),
      );
      expect(numScale2(0), 0);
      expect(numScale2(0.05), 50.0);
      expect(numScale2(0.1), 100.0);

      final numScale3 = linearScale(
        domain: const Range(10, 20),
        range: const Range(0, 100),
      );
      expect(numScale3(10), 0);
      expect(numScale3(15), 50.0);
      expect(numScale3(20), 100.0);
    });
  });
}
