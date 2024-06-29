import 'package:zod/zod.dart';

/// A ZodString is a ZodType that represents a string.
class ZodString extends ZodType {
  /// A ZodString is a ZodType that represents a string.
  ZodString(this.value);

  /// The value of the ZodString.
  final String? value;

  /// The error message of the ZodString.
  String? _error;

  @override
  String? get error => _error;

  @override
  bool get isValid => _error == null;

  @override
  bool get isInvalid => _error != null;

  /// If the length of the value passed in is greater than the minLength
  /// parameter or not.
  ZodString min(int minLength, {String? message}) {
    if (value != null && value!.length < minLength) {
      _error ??= message ?? 'string.min.length';
    }
    return this;
  }

  /// If the length of the value passed in is less than the maxLength
  /// parameter or not.
  ZodString max(int maxLength, {String? message}) {
    if (value != null && value!.length > maxLength) {
      _error ??= message ?? 'string.max.length';
    }
    return this;
  }

  /// If the length of the value passed in is equal to the length parameter or
  /// not.
  ZodString length(int length, {String? message}) {
    if (value != null && value!.length != length) {
      _error ??= message ?? 'string.length';
    }
    return this;
  }

  /// If the value passed is a valid email address or not.
  ZodString email({String? message}) {
    if (value != null &&
        !RegExp(
          r"^(?!\.)(?!.*\.\.)([A-Z0-9_'+\-\.]*)[A-Z0-9_+-]@([A-Z0-9][A-Z0-9\-]*\.)+[A-Z]{2,}$",
          caseSensitive: false,
        ).hasMatch(value!)) {
      _error ??= message ?? 'string.email';
    }
    return this;
  }

  /// If the value passed is a valid URL or not.
  ZodString url({String? message}) {
    if (value != null) {
      try {
        Uri.parse(value!);
      } catch (_) {
        _error ??= message ?? 'string.url';
      }
    }
    return this;
  }

  /// If the value passed in is an emoji or not.
  ZodString uuid({String? message}) {
    if (value != null &&
        !RegExp(
          r'^[0-9a-fA-F]{8}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{12}$',
          caseSensitive: false,
        ).hasMatch(value!)) {
      _error ??= message ?? 'string.uuid';
    }
    return this;
  }

  /// If the value passed in is a valid nanoid or not.
  ZodString nanoid({String? message}) {
    if (value != null && !RegExp(r'^[a-z0-9_-]{21}$').hasMatch(value!)) {
      _error ??= message ?? 'string.nanoid';
    }
    return this;
  }

  /// If the value passed in is a valid cuid or not.
  ZodString cuid({String? message}) {
    if (value != null && !RegExp(r'^c[^\s-]{8,}$').hasMatch(value!)) {
      _error ??= message ?? 'string.cuid';
    }
    return this;
  }

  /// If the value passed in is a valid cuid2 or not.
  ZodString cuid2({String? message}) {
    if (value != null && !RegExp(r'^[0-9a-z]+$').hasMatch(value!)) {
      _error ??= message ?? 'string.cuid2';
    }
    return this;
  }

  /// If the value passed in is a valid ulid or not.
  ZodString ulid({String? message}) {
    if (value != null &&
        !RegExp(r'^[0-9A-HJKMNP-TV-Z]{26}$').hasMatch(value!)) {
      _error ??= message ?? 'string.ulid';
    }
    return this;
  }

  /// If the value passed in starts with the prefix or not.
  ZodString startsWith(String prefix, {String? message}) {
    if (value != null && !value!.startsWith(prefix)) {
      _error ??= message ?? 'string.startsWith';
    }
    return this;
  }

  /// If the value passed in ends with the suffix or not.
  ZodString endsWith(String suffix, {String? message}) {
    if (value != null && !value!.endsWith(suffix)) {
      _error ??= message ?? 'string.endsWith';
    }
    return this;
  }

  /// If the value passed in contains the substring or not.
  ZodString contains(String substring, {String? message}) {
    if (value != null && !value!.contains(substring)) {
      _error ??= message ?? 'string.contains';
    }
    return this;
  }

  /// If the value passed in matches the pattern or not.
  ZodString regex(String pattern, {String? message}) {
    if (value != null && !RegExp(pattern).hasMatch(value!)) {
      _error ??= message ?? 'string.matches';
    }
    return this;
  }

  /// If the value passed in is a valid IPv4 address or not.
  ZodString ipv4({String? message}) {
    if (value != null &&
        !RegExp(
          r'^(?:(?:25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\.){3}(?:25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])$',
        ).hasMatch(value!)) {
      _error ??= message ?? 'string.ipv4';
    }
    return this;
  }

  /// If the value passed in is a valid IPv6 address or not.
  ZodString ipv6({String? message}) {
    if (value != null &&
        !RegExp(
          r'^(([a-f0-9]{1,4}:){7}|::([a-f0-9]{1,4}:){0,6}|([a-f0-9]{1,4}:){1}:([a-f0-9]{1,4}:){0,5}|([a-f0-9]{1,4}:){2}:([a-f0-9]{1,4}:){0,4}|([a-f0-9]{1,4}:){3}:([a-f0-9]{1,4}:){0,3}|([a-f0-9]{1,4}:){4}:([a-f0-9]{1,4}:){0,2}|([a-f0-9]{1,4}:){5}:([a-f0-9]{1,4}:){0,1})([a-f0-9]{1,4}|(((25[0-5])|(2[0-4][0-9])|(1[0-9]{2})|([0-9]{1,2}))\.){3}((25[0-5])|(2[0-4][0-9])|(1[0-9]{2})|([0-9]{1,2})))$',
        ).hasMatch(value!)) {
      _error ??= message ?? 'string.ipv6';
    }
    return this;
  }

  /// If the value passed in is a valid base64 string or not.
  ZodString base64({String? message}) {
    if (value != null &&
        !RegExp(
          r'^([0-9a-zA-Z+/]{4})*(([0-9a-zA-Z+/]{2}==)|([0-9a-zA-Z+/]{3}=))?$',
        ).hasMatch(value!)) {
      _error ??= message ?? 'string.base64';
    }
    return this;
  }

  /// If the value passed in is null or not.
  ZodString notNull({String? message}) {
    if (value != null) {
      _error ??= message ?? 'string.notNull';
    }
    return this;
  }
}
