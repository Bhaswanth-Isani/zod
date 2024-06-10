import 'package:zod/zod.dart';

/// A ZodList is a ZodType that represents a List.
class ZodList<T> extends ZodType {
  /// A ZodList is a ZodType that represents a Int.
  ZodList(this.value, {this.elements}) {
    if (value != null) {
      for (final element in value!) {
        _error ??= elements?.call(element).error;
      }
    }
  }

  /// The value of the ZodInt.
  final List<T>? value;

  /// The element validation type
  final ZodType Function(T element)? elements;

  /// The error message of the ZodInt.
  String? _error;

  @override
  String? get error => _error;

  @override
  bool get isValid => _error == null;

  @override
  bool get isInvalid => _error != null;

  /// If the list passed in has min items or not.
  ZodList<T> min(int min, {String? message}) {
    if (value!.length < min) {
      _error ??= message ?? 'list.min';
    }
    return this;
  }

  /// If the list passed in has max items or not.
  ZodList<T> max(int max, {String? message}) {
    if (value!.length > max) {
      _error ??= message ?? 'list.max';
    }
    return this;
  }

  /// If the list passed in has exact number of items or not.
  ZodList<T> exactLength(int length, {String? message}) {
    if (value!.length != length) {
      _error ??= message ?? 'list.length';
    }
    return this;
  }

  /// If the value passed in is null or not.
  ZodList<T> notNull({String? message}) {
    if (value != null) {
      _error ??= message ?? 'string.notNull';
    }
    return this;
  }
}
