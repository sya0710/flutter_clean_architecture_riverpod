import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';
part 'result.g.dart';

@Freezed(genericArgumentFactories: true)
sealed class Result<T> with _$Result<T> {
  const factory Result.success({
    required T data,
    String? message,
    Pagination? pagination,
  }) = Success<T>;

  const factory Result.error({
    String? message,
    String? errorCode,
  }) = Error<T>;

  factory Result.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) {
    final runtimeType =
        (json['runtimeType'] as String?) ?? _inferRuntimeType(json);

    if (runtimeType == 'success') {
      final paginationRaw = json['pagination'];
      return Result.success(
        data: fromJsonT(json['data']),
        message: json['message']?.toString(),
        pagination: paginationRaw is Map<String, dynamic>
            ? Pagination.fromJson(paginationRaw)
            : null,
      );
    }

    return Result.error(
      message: json['message']?.toString(),
      errorCode: json['errorCode']?.toString(),
    );
  }
}

String _inferRuntimeType(Map<String, dynamic> json) {
  // Prefer success when a data payload exists; otherwise treat as error.
  final hasData = json.containsKey('data') && json['data'] != null;
  if (hasData) {
    return 'success';
  }

  final status = json['status']?.toString().toLowerCase();
  if (status == 'success' || status == 'ok') {
    return 'success';
  }

  return 'error';
}

@freezed
abstract class Pagination with _$Pagination {
  const factory Pagination({
    @Default(0) int currentPage,
    @Default(0) int pageSize,
    @Default(0) int totalElements,
    @Default(0) int totalPages,
    @Default(false) bool hasNext,
    @Default(false) bool hasPrevious,
    @Default(false) bool first,
    @Default(false) bool last,
  }) = _Pagination;

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);
}
