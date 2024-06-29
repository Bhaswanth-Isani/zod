import 'package:zod/zod.dart';

/// A ZodDouble is a ZodType that represents a Double.
class ZodDouble extends ZodType {
  /// A ZodDouble is a ZodType that represents a Double.
  ZodDouble(this.value);

  /// The value of the ZodDouble.
  final double? value;

  /// The error message of the ZodDouble.
  String? _error;

  @override
  String? get error => _error;

  @override
  bool get isValid => _error == null;

  @override
  bool get isInvalid => _error != null;

  /// If the value is greater than the min value or not.
  ZodDouble min(double min, {bool inclusive = false, String? message}) {
    if (value != null && inclusive ? value! <= min : value! < min) {
      _error ??= message ?? 'Double.min';
    }
    return this;
  }

  /// If the value is less than the max value or not.
  ZodDouble max(double max, {bool inclusive = false, String? message}) {
    if (value != null && inclusive ? value! >= max : value! > max) {
      _error ??= message ?? 'Double.max';
    }
    return this;
  }

  /// If the value passed in is finite or not.
  ZodDouble finite({String? message}) {
    if (value != null && !value!.isFinite) {
      _error ??= message ?? 'Double.finite';
    }
    return this;
  }

  /// If the value passed in is infinite or not.
  ZodDouble infinite({String? message}) {
    if (value != null && !value!.isInfinite) {
      _error ??= message ?? 'Double.infinite';
    }
    return this;
  }

  /// If the value passed in is null or not.
  ZodDouble notNull({String? message}) {
    if (value != null) {
      _error ??= message ?? 'string.notNull';
    }
    return this;
  }
}
