import 'package:zod/src/zod_double.dart';
import 'package:zod/src/zod_int.dart';
import 'package:zod/src/zod_list.dart';
import 'package:zod/src/zod_string.dart';

/// Class for creating ZodTypes which can be used to validate data such as
/// strings, numbers, and lists.
class Zod {
  /// Creates a ZodString type. Used to validate strings.
  static ZodString zodString(String? value) => ZodString(value);

  /// Creates a ZodInt type. Used to validate integers.
  static ZodInt zodInt(int? value) => ZodInt(value);

  /// Creates a ZodDouble type. Used to validate doubles.
  static ZodDouble zodDouble(double? value) => ZodDouble(value);

  /// Creates a ZodList type. Used to validate lists. You can also use the
  /// elements property to specify a custom validation for each element in the
  /// list.
  static ZodList<T> zodList<T>(
    List<T> type, {
    ZodType Function(T element)? elements,
  }) =>
      ZodList(type, elements: elements);
}

/// A ZodType is a type that can be validated.
abstract class ZodType {
  /// The error message of the ZodString.
  String? get error;

  /// If the value is valid.
  bool get isValid;

  /// If the value is invalid.
  bool get isInvalid;
}
