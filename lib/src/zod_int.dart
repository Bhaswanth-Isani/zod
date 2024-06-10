import 'package:zod/zod.dart';

/// A ZodInt is a ZodType that represents a Int.
class ZodInt extends ZodType {
  /// A ZodInt is a ZodType that represents a Int.
  ZodInt(this.value);

  /// The value of the ZodInt.
  final int? value;

  /// The error message of the ZodInt.
  String? _error;

  @override
  String? get error => _error;

  @override
  bool get isValid => _error == null;

  @override
  bool get isInvalid => _error != null;

  /// If the value is greater than the min value or not.
  ZodInt min(int min, {bool inclusive = false, String? message}) {
    if (inclusive ? (value ?? 0) <= min : (value ?? 0) < min) {
      _error ??= message ?? 'int.min';
    }
    return this;
  }

  /// If the value is less than the max value or not.
  ZodInt max(int max, {bool inclusive = false, String? message}) {
    if (inclusive ? (value ?? 0) >= max : (value ?? 0) > max) {
      _error ??= message ?? 'int.max';
    }
    return this;
  }

  /// If the value passed in is null or not.
  ZodInt notNull({String? message}) {
    if (value != null) {
      _error ??= message ?? 'string.notNull';
    }
    return this;
  }
}
