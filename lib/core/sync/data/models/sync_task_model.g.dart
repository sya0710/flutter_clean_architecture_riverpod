// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_task_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSyncTaskModelCollection on Isar {
  IsarCollection<SyncTaskModel> get syncTaskModels => this.collection();
}

const SyncTaskModelSchema = CollectionSchema(
  name: r'SyncTaskModel',
  id: -1637054397144033058,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'entityLocalId': PropertySchema(
      id: 1,
      name: r'entityLocalId',
      type: IsarType.string,
    ),
    r'entityRemoteId': PropertySchema(
      id: 2,
      name: r'entityRemoteId',
      type: IsarType.string,
    ),
    r'entityType': PropertySchema(
      id: 3,
      name: r'entityType',
      type: IsarType.string,
    ),
    r'errorMessage': PropertySchema(
      id: 4,
      name: r'errorMessage',
      type: IsarType.string,
    ),
    r'lastAttemptAt': PropertySchema(
      id: 5,
      name: r'lastAttemptAt',
      type: IsarType.dateTime,
    ),
    r'localVersion': PropertySchema(
      id: 6,
      name: r'localVersion',
      type: IsarType.string,
    ),
    r'maxRetries': PropertySchema(
      id: 7,
      name: r'maxRetries',
      type: IsarType.long,
    ),
    r'operationIndex': PropertySchema(
      id: 8,
      name: r'operationIndex',
      type: IsarType.long,
    ),
    r'payload': PropertySchema(id: 9, name: r'payload', type: IsarType.string),
    r'priorityIndex': PropertySchema(
      id: 10,
      name: r'priorityIndex',
      type: IsarType.long,
    ),
    r'retryCount': PropertySchema(
      id: 11,
      name: r'retryCount',
      type: IsarType.long,
    ),
    r'serverVersion': PropertySchema(
      id: 12,
      name: r'serverVersion',
      type: IsarType.string,
    ),
    r'statusIndex': PropertySchema(
      id: 13,
      name: r'statusIndex',
      type: IsarType.long,
    ),
  },

  estimateSize: _syncTaskModelEstimateSize,
  serialize: _syncTaskModelSerialize,
  deserialize: _syncTaskModelDeserialize,
  deserializeProp: _syncTaskModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'entityType': IndexSchema(
      id: -5109706325448941117,
      name: r'entityType',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'entityType',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'entityLocalId': IndexSchema(
      id: 5522739556450303875,
      name: r'entityLocalId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'entityLocalId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'statusIndex': IndexSchema(
      id: -3068638669929638322,
      name: r'statusIndex',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'statusIndex',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'priorityIndex': IndexSchema(
      id: 1513594599038388933,
      name: r'priorityIndex',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'priorityIndex',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'createdAt': IndexSchema(
      id: -3433535483987302584,
      name: r'createdAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'createdAt',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _syncTaskModelGetId,
  getLinks: _syncTaskModelGetLinks,
  attach: _syncTaskModelAttach,
  version: '3.3.2',
);

int _syncTaskModelEstimateSize(
  SyncTaskModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.entityLocalId.length * 3;
  {
    final value = object.entityRemoteId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.entityType.length * 3;
  {
    final value = object.errorMessage;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.localVersion;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.payload.length * 3;
  {
    final value = object.serverVersion;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _syncTaskModelSerialize(
  SyncTaskModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeString(offsets[1], object.entityLocalId);
  writer.writeString(offsets[2], object.entityRemoteId);
  writer.writeString(offsets[3], object.entityType);
  writer.writeString(offsets[4], object.errorMessage);
  writer.writeDateTime(offsets[5], object.lastAttemptAt);
  writer.writeString(offsets[6], object.localVersion);
  writer.writeLong(offsets[7], object.maxRetries);
  writer.writeLong(offsets[8], object.operationIndex);
  writer.writeString(offsets[9], object.payload);
  writer.writeLong(offsets[10], object.priorityIndex);
  writer.writeLong(offsets[11], object.retryCount);
  writer.writeString(offsets[12], object.serverVersion);
  writer.writeLong(offsets[13], object.statusIndex);
}

SyncTaskModel _syncTaskModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SyncTaskModel();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.entityLocalId = reader.readString(offsets[1]);
  object.entityRemoteId = reader.readStringOrNull(offsets[2]);
  object.entityType = reader.readString(offsets[3]);
  object.errorMessage = reader.readStringOrNull(offsets[4]);
  object.id = id;
  object.lastAttemptAt = reader.readDateTimeOrNull(offsets[5]);
  object.localVersion = reader.readStringOrNull(offsets[6]);
  object.maxRetries = reader.readLong(offsets[7]);
  object.operationIndex = reader.readLong(offsets[8]);
  object.payload = reader.readString(offsets[9]);
  object.priorityIndex = reader.readLong(offsets[10]);
  object.retryCount = reader.readLong(offsets[11]);
  object.serverVersion = reader.readStringOrNull(offsets[12]);
  object.statusIndex = reader.readLong(offsets[13]);
  return object;
}

P _syncTaskModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _syncTaskModelGetId(SyncTaskModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _syncTaskModelGetLinks(SyncTaskModel object) {
  return [];
}

void _syncTaskModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  SyncTaskModel object,
) {
  object.id = id;
}

extension SyncTaskModelQueryWhereSort
    on QueryBuilder<SyncTaskModel, SyncTaskModel, QWhere> {
  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterWhere> anyStatusIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'statusIndex'),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterWhere> anyPriorityIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'priorityIndex'),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterWhere> anyCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'createdAt'),
      );
    });
  }
}

extension SyncTaskModelQueryWhere
    on QueryBuilder<SyncTaskModel, SyncTaskModel, QWhereClause> {
  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterWhereClause> idNotEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterWhereClause>
  entityTypeEqualTo(String entityType) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'entityType', value: [entityType]),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterWhereClause>
  entityTypeNotEqualTo(String entityType) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'entityType',
                lower: [],
                upper: [entityType],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'entityType',
                lower: [entityType],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'entityType',
                lower: [entityType],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'entityType',
                lower: [],
                upper: [entityType],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterWhereClause>
  entityLocalIdEqualTo(String entityLocalId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'entityLocalId',
          value: [entityLocalId],
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterWhereClause>
  entityLocalIdNotEqualTo(String entityLocalId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'entityLocalId',
                lower: [],
                upper: [entityLocalId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'entityLocalId',
                lower: [entityLocalId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'entityLocalId',
                lower: [entityLocalId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'entityLocalId',
                lower: [],
                upper: [entityLocalId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterWhereClause>
  statusIndexEqualTo(int statusIndex) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'statusIndex',
          value: [statusIndex],
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterWhereClause>
  statusIndexNotEqualTo(int statusIndex) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'statusIndex',
                lower: [],
                upper: [statusIndex],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'statusIndex',
                lower: [statusIndex],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'statusIndex',
                lower: [statusIndex],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'statusIndex',
                lower: [],
                upper: [statusIndex],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterWhereClause>
  statusIndexGreaterThan(int statusIndex, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'statusIndex',
          lower: [statusIndex],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterWhereClause>
  statusIndexLessThan(int statusIndex, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'statusIndex',
          lower: [],
          upper: [statusIndex],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterWhereClause>
  statusIndexBetween(
    int lowerStatusIndex,
    int upperStatusIndex, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'statusIndex',
          lower: [lowerStatusIndex],
          includeLower: includeLower,
          upper: [upperStatusIndex],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterWhereClause>
  priorityIndexEqualTo(int priorityIndex) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'priorityIndex',
          value: [priorityIndex],
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterWhereClause>
  priorityIndexNotEqualTo(int priorityIndex) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'priorityIndex',
                lower: [],
                upper: [priorityIndex],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'priorityIndex',
                lower: [priorityIndex],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'priorityIndex',
                lower: [priorityIndex],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'priorityIndex',
                lower: [],
                upper: [priorityIndex],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterWhereClause>
  priorityIndexGreaterThan(int priorityIndex, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'priorityIndex',
          lower: [priorityIndex],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterWhereClause>
  priorityIndexLessThan(int priorityIndex, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'priorityIndex',
          lower: [],
          upper: [priorityIndex],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterWhereClause>
  priorityIndexBetween(
    int lowerPriorityIndex,
    int upperPriorityIndex, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'priorityIndex',
          lower: [lowerPriorityIndex],
          includeLower: includeLower,
          upper: [upperPriorityIndex],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterWhereClause>
  createdAtEqualTo(DateTime createdAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'createdAt', value: [createdAt]),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterWhereClause>
  createdAtNotEqualTo(DateTime createdAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'createdAt',
                lower: [],
                upper: [createdAt],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'createdAt',
                lower: [createdAt],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'createdAt',
                lower: [createdAt],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'createdAt',
                lower: [],
                upper: [createdAt],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterWhereClause>
  createdAtGreaterThan(DateTime createdAt, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'createdAt',
          lower: [createdAt],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterWhereClause>
  createdAtLessThan(DateTime createdAt, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'createdAt',
          lower: [],
          upper: [createdAt],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterWhereClause>
  createdAtBetween(
    DateTime lowerCreatedAt,
    DateTime upperCreatedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'createdAt',
          lower: [lowerCreatedAt],
          includeLower: includeLower,
          upper: [upperCreatedAt],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension SyncTaskModelQueryFilter
    on QueryBuilder<SyncTaskModel, SyncTaskModel, QFilterCondition> {
  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  createdAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  createdAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'createdAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  entityLocalIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'entityLocalId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  entityLocalIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'entityLocalId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  entityLocalIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'entityLocalId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  entityLocalIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'entityLocalId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  entityLocalIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'entityLocalId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  entityLocalIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'entityLocalId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  entityLocalIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'entityLocalId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  entityLocalIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'entityLocalId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  entityLocalIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'entityLocalId', value: ''),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  entityLocalIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'entityLocalId', value: ''),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  entityRemoteIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'entityRemoteId'),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  entityRemoteIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'entityRemoteId'),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  entityRemoteIdEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'entityRemoteId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  entityRemoteIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'entityRemoteId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  entityRemoteIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'entityRemoteId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  entityRemoteIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'entityRemoteId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  entityRemoteIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'entityRemoteId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  entityRemoteIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'entityRemoteId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  entityRemoteIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'entityRemoteId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  entityRemoteIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'entityRemoteId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  entityRemoteIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'entityRemoteId', value: ''),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  entityRemoteIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'entityRemoteId', value: ''),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  entityTypeEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'entityType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  entityTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'entityType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  entityTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'entityType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  entityTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'entityType',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  entityTypeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'entityType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  entityTypeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'entityType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  entityTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'entityType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  entityTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'entityType',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  entityTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'entityType', value: ''),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  entityTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'entityType', value: ''),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  errorMessageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'errorMessage'),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  errorMessageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'errorMessage'),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  errorMessageEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'errorMessage',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  errorMessageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'errorMessage',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  errorMessageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'errorMessage',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  errorMessageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'errorMessage',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  errorMessageStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'errorMessage',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  errorMessageEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'errorMessage',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  errorMessageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'errorMessage',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  errorMessageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'errorMessage',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  errorMessageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'errorMessage', value: ''),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  errorMessageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'errorMessage', value: ''),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  lastAttemptAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastAttemptAt'),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  lastAttemptAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastAttemptAt'),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  lastAttemptAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastAttemptAt', value: value),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  lastAttemptAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastAttemptAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  lastAttemptAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastAttemptAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  lastAttemptAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastAttemptAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  localVersionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'localVersion'),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  localVersionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'localVersion'),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  localVersionEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'localVersion',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  localVersionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'localVersion',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  localVersionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'localVersion',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  localVersionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'localVersion',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  localVersionStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'localVersion',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  localVersionEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'localVersion',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  localVersionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'localVersion',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  localVersionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'localVersion',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  localVersionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'localVersion', value: ''),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  localVersionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'localVersion', value: ''),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  maxRetriesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'maxRetries', value: value),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  maxRetriesGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'maxRetries',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  maxRetriesLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'maxRetries',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  maxRetriesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'maxRetries',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  operationIndexEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'operationIndex', value: value),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  operationIndexGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'operationIndex',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  operationIndexLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'operationIndex',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  operationIndexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'operationIndex',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  payloadEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'payload',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  payloadGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'payload',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  payloadLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'payload',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  payloadBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'payload',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  payloadStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'payload',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  payloadEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'payload',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  payloadContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'payload',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  payloadMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'payload',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  payloadIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'payload', value: ''),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  payloadIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'payload', value: ''),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  priorityIndexEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'priorityIndex', value: value),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  priorityIndexGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'priorityIndex',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  priorityIndexLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'priorityIndex',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  priorityIndexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'priorityIndex',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  retryCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'retryCount', value: value),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  retryCountGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'retryCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  retryCountLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'retryCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  retryCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'retryCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  serverVersionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'serverVersion'),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  serverVersionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'serverVersion'),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  serverVersionEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'serverVersion',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  serverVersionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'serverVersion',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  serverVersionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'serverVersion',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  serverVersionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'serverVersion',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  serverVersionStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'serverVersion',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  serverVersionEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'serverVersion',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  serverVersionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'serverVersion',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  serverVersionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'serverVersion',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  serverVersionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'serverVersion', value: ''),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  serverVersionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'serverVersion', value: ''),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  statusIndexEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'statusIndex', value: value),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  statusIndexGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'statusIndex',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  statusIndexLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'statusIndex',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterFilterCondition>
  statusIndexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'statusIndex',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension SyncTaskModelQueryObject
    on QueryBuilder<SyncTaskModel, SyncTaskModel, QFilterCondition> {}

extension SyncTaskModelQueryLinks
    on QueryBuilder<SyncTaskModel, SyncTaskModel, QFilterCondition> {}

extension SyncTaskModelQuerySortBy
    on QueryBuilder<SyncTaskModel, SyncTaskModel, QSortBy> {
  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy>
  sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy>
  sortByEntityLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityLocalId', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy>
  sortByEntityLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityLocalId', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy>
  sortByEntityRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityRemoteId', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy>
  sortByEntityRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityRemoteId', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy> sortByEntityType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityType', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy>
  sortByEntityTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityType', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy>
  sortByErrorMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorMessage', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy>
  sortByErrorMessageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorMessage', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy>
  sortByLastAttemptAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastAttemptAt', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy>
  sortByLastAttemptAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastAttemptAt', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy>
  sortByLocalVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localVersion', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy>
  sortByLocalVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localVersion', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy> sortByMaxRetries() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxRetries', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy>
  sortByMaxRetriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxRetries', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy>
  sortByOperationIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operationIndex', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy>
  sortByOperationIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operationIndex', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy> sortByPayload() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payload', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy> sortByPayloadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payload', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy>
  sortByPriorityIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priorityIndex', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy>
  sortByPriorityIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priorityIndex', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy> sortByRetryCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'retryCount', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy>
  sortByRetryCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'retryCount', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy>
  sortByServerVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverVersion', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy>
  sortByServerVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverVersion', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy> sortByStatusIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusIndex', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy>
  sortByStatusIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusIndex', Sort.desc);
    });
  }
}

extension SyncTaskModelQuerySortThenBy
    on QueryBuilder<SyncTaskModel, SyncTaskModel, QSortThenBy> {
  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy>
  thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy>
  thenByEntityLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityLocalId', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy>
  thenByEntityLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityLocalId', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy>
  thenByEntityRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityRemoteId', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy>
  thenByEntityRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityRemoteId', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy> thenByEntityType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityType', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy>
  thenByEntityTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityType', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy>
  thenByErrorMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorMessage', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy>
  thenByErrorMessageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorMessage', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy>
  thenByLastAttemptAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastAttemptAt', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy>
  thenByLastAttemptAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastAttemptAt', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy>
  thenByLocalVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localVersion', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy>
  thenByLocalVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localVersion', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy> thenByMaxRetries() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxRetries', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy>
  thenByMaxRetriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxRetries', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy>
  thenByOperationIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operationIndex', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy>
  thenByOperationIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operationIndex', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy> thenByPayload() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payload', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy> thenByPayloadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payload', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy>
  thenByPriorityIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priorityIndex', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy>
  thenByPriorityIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priorityIndex', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy> thenByRetryCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'retryCount', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy>
  thenByRetryCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'retryCount', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy>
  thenByServerVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverVersion', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy>
  thenByServerVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverVersion', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy> thenByStatusIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusIndex', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QAfterSortBy>
  thenByStatusIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusIndex', Sort.desc);
    });
  }
}

extension SyncTaskModelQueryWhereDistinct
    on QueryBuilder<SyncTaskModel, SyncTaskModel, QDistinct> {
  QueryBuilder<SyncTaskModel, SyncTaskModel, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QDistinct>
  distinctByEntityLocalId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'entityLocalId',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QDistinct>
  distinctByEntityRemoteId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'entityRemoteId',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QDistinct> distinctByEntityType({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'entityType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QDistinct> distinctByErrorMessage({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'errorMessage', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QDistinct>
  distinctByLastAttemptAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastAttemptAt');
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QDistinct> distinctByLocalVersion({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'localVersion', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QDistinct> distinctByMaxRetries() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxRetries');
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QDistinct>
  distinctByOperationIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'operationIndex');
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QDistinct> distinctByPayload({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'payload', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QDistinct>
  distinctByPriorityIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'priorityIndex');
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QDistinct> distinctByRetryCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'retryCount');
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QDistinct>
  distinctByServerVersion({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'serverVersion',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<SyncTaskModel, SyncTaskModel, QDistinct>
  distinctByStatusIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'statusIndex');
    });
  }
}

extension SyncTaskModelQueryProperty
    on QueryBuilder<SyncTaskModel, SyncTaskModel, QQueryProperty> {
  QueryBuilder<SyncTaskModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SyncTaskModel, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<SyncTaskModel, String, QQueryOperations>
  entityLocalIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'entityLocalId');
    });
  }

  QueryBuilder<SyncTaskModel, String?, QQueryOperations>
  entityRemoteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'entityRemoteId');
    });
  }

  QueryBuilder<SyncTaskModel, String, QQueryOperations> entityTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'entityType');
    });
  }

  QueryBuilder<SyncTaskModel, String?, QQueryOperations>
  errorMessageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'errorMessage');
    });
  }

  QueryBuilder<SyncTaskModel, DateTime?, QQueryOperations>
  lastAttemptAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastAttemptAt');
    });
  }

  QueryBuilder<SyncTaskModel, String?, QQueryOperations>
  localVersionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localVersion');
    });
  }

  QueryBuilder<SyncTaskModel, int, QQueryOperations> maxRetriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxRetries');
    });
  }

  QueryBuilder<SyncTaskModel, int, QQueryOperations> operationIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'operationIndex');
    });
  }

  QueryBuilder<SyncTaskModel, String, QQueryOperations> payloadProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'payload');
    });
  }

  QueryBuilder<SyncTaskModel, int, QQueryOperations> priorityIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'priorityIndex');
    });
  }

  QueryBuilder<SyncTaskModel, int, QQueryOperations> retryCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'retryCount');
    });
  }

  QueryBuilder<SyncTaskModel, String?, QQueryOperations>
  serverVersionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serverVersion');
    });
  }

  QueryBuilder<SyncTaskModel, int, QQueryOperations> statusIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'statusIndex');
    });
  }
}
