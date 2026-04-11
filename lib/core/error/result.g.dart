// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Pagination _$PaginationFromJson(Map<String, dynamic> json) => _Pagination(
  currentPage: (json['currentPage'] as num?)?.toInt() ?? 0,
  pageSize: (json['pageSize'] as num?)?.toInt() ?? 0,
  totalElements: (json['totalElements'] as num?)?.toInt() ?? 0,
  totalPages: (json['totalPages'] as num?)?.toInt() ?? 0,
  hasNext: json['hasNext'] as bool? ?? false,
  hasPrevious: json['hasPrevious'] as bool? ?? false,
  first: json['first'] as bool? ?? false,
  last: json['last'] as bool? ?? false,
);

Map<String, dynamic> _$PaginationToJson(_Pagination instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'pageSize': instance.pageSize,
      'totalElements': instance.totalElements,
      'totalPages': instance.totalPages,
      'hasNext': instance.hasNext,
      'hasPrevious': instance.hasPrevious,
      'first': instance.first,
      'last': instance.last,
    };
