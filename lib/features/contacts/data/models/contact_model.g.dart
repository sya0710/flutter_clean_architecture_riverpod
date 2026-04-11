// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetContactModelCollection on Isar {
  IsarCollection<ContactModel> get contactModels => this.collection();
}

const ContactModelSchema = CollectionSchema(
  name: r'ContactModel',
  id: 122675080158055862,
  properties: {
    r'companyCode': PropertySchema(
      id: 0,
      name: r'companyCode',
      type: IsarType.string,
    ),
    r'companyName': PropertySchema(
      id: 1,
      name: r'companyName',
      type: IsarType.string,
    ),
    r'companyNameFurigana': PropertySchema(
      id: 2,
      name: r'companyNameFurigana',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 3,
      name: r'createdAt',
      type: IsarType.string,
    ),
    r'createdBy': PropertySchema(
      id: 4,
      name: r'createdBy',
      type: IsarType.string,
    ),
    r'email': PropertySchema(id: 5, name: r'email', type: IsarType.string),
    r'emails': PropertySchema(id: 6, name: r'emails', type: IsarType.string),
    r'employeeName': PropertySchema(
      id: 7,
      name: r'employeeName',
      type: IsarType.string,
    ),
    r'firstName': PropertySchema(
      id: 8,
      name: r'firstName',
      type: IsarType.string,
    ),
    r'firstNameFurigana': PropertySchema(
      id: 9,
      name: r'firstNameFurigana',
      type: IsarType.string,
    ),
    r'idLocal': PropertySchema(id: 10, name: r'idLocal', type: IsarType.string),
    r'identifier': PropertySchema(
      id: 11,
      name: r'identifier',
      type: IsarType.string,
    ),
    r'isSynced': PropertySchema(id: 12, name: r'isSynced', type: IsarType.bool),
    r'isSyncedLocal': PropertySchema(
      id: 13,
      name: r'isSyncedLocal',
      type: IsarType.bool,
    ),
    r'lastName': PropertySchema(
      id: 14,
      name: r'lastName',
      type: IsarType.string,
    ),
    r'lastNameFurigana': PropertySchema(
      id: 15,
      name: r'lastNameFurigana',
      type: IsarType.string,
    ),
    r'note': PropertySchema(id: 16, name: r'note', type: IsarType.string),
    r'phone': PropertySchema(id: 17, name: r'phone', type: IsarType.string),
    r'phones': PropertySchema(id: 18, name: r'phones', type: IsarType.string),
    r'photo': PropertySchema(id: 19, name: r'photo', type: IsarType.string),
    r'status': PropertySchema(id: 20, name: r'status', type: IsarType.long),
    r'updatedAt': PropertySchema(
      id: 21,
      name: r'updatedAt',
      type: IsarType.string,
    ),
    r'updatedBy': PropertySchema(
      id: 22,
      name: r'updatedBy',
      type: IsarType.string,
    ),
  },

  estimateSize: _contactModelEstimateSize,
  serialize: _contactModelSerialize,
  deserialize: _contactModelDeserialize,
  deserializeProp: _contactModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'employeeName': IndexSchema(
      id: 4093921186658558355,
      name: r'employeeName',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'employeeName',
          type: IndexType.hash,
          caseSensitive: false,
        ),
      ],
    ),
    r'status': IndexSchema(
      id: -107785170620420283,
      name: r'status',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'status',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _contactModelGetId,
  getLinks: _contactModelGetLinks,
  attach: _contactModelAttach,
  version: '3.3.2',
);

int _contactModelEstimateSize(
  ContactModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.companyCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.companyName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.companyNameFurigana;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.createdAt;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.createdBy;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.email;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.emails;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.employeeName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.firstName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.firstNameFurigana;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.idLocal;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.identifier;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.lastName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.lastNameFurigana;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.note;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.phone;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.phones;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.photo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.updatedAt;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.updatedBy;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _contactModelSerialize(
  ContactModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.companyCode);
  writer.writeString(offsets[1], object.companyName);
  writer.writeString(offsets[2], object.companyNameFurigana);
  writer.writeString(offsets[3], object.createdAt);
  writer.writeString(offsets[4], object.createdBy);
  writer.writeString(offsets[5], object.email);
  writer.writeString(offsets[6], object.emails);
  writer.writeString(offsets[7], object.employeeName);
  writer.writeString(offsets[8], object.firstName);
  writer.writeString(offsets[9], object.firstNameFurigana);
  writer.writeString(offsets[10], object.idLocal);
  writer.writeString(offsets[11], object.identifier);
  writer.writeBool(offsets[12], object.isSynced);
  writer.writeBool(offsets[13], object.isSyncedLocal);
  writer.writeString(offsets[14], object.lastName);
  writer.writeString(offsets[15], object.lastNameFurigana);
  writer.writeString(offsets[16], object.note);
  writer.writeString(offsets[17], object.phone);
  writer.writeString(offsets[18], object.phones);
  writer.writeString(offsets[19], object.photo);
  writer.writeLong(offsets[20], object.status);
  writer.writeString(offsets[21], object.updatedAt);
  writer.writeString(offsets[22], object.updatedBy);
}

ContactModel _contactModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ContactModel();
  object.companyCode = reader.readStringOrNull(offsets[0]);
  object.companyName = reader.readStringOrNull(offsets[1]);
  object.companyNameFurigana = reader.readStringOrNull(offsets[2]);
  object.createdAt = reader.readStringOrNull(offsets[3]);
  object.createdBy = reader.readStringOrNull(offsets[4]);
  object.email = reader.readStringOrNull(offsets[5]);
  object.emails = reader.readStringOrNull(offsets[6]);
  object.employeeName = reader.readStringOrNull(offsets[7]);
  object.firstName = reader.readStringOrNull(offsets[8]);
  object.firstNameFurigana = reader.readStringOrNull(offsets[9]);
  object.id = id;
  object.idLocal = reader.readStringOrNull(offsets[10]);
  object.identifier = reader.readStringOrNull(offsets[11]);
  object.isSynced = reader.readBool(offsets[12]);
  object.isSyncedLocal = reader.readBool(offsets[13]);
  object.lastName = reader.readStringOrNull(offsets[14]);
  object.lastNameFurigana = reader.readStringOrNull(offsets[15]);
  object.note = reader.readStringOrNull(offsets[16]);
  object.phone = reader.readStringOrNull(offsets[17]);
  object.phones = reader.readStringOrNull(offsets[18]);
  object.photo = reader.readStringOrNull(offsets[19]);
  object.status = reader.readLongOrNull(offsets[20]);
  object.updatedAt = reader.readStringOrNull(offsets[21]);
  object.updatedBy = reader.readStringOrNull(offsets[22]);
  return object;
}

P _contactModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readBool(offset)) as P;
    case 13:
      return (reader.readBool(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readLongOrNull(offset)) as P;
    case 21:
      return (reader.readStringOrNull(offset)) as P;
    case 22:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _contactModelGetId(ContactModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _contactModelGetLinks(ContactModel object) {
  return [];
}

void _contactModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  ContactModel object,
) {
  object.id = id;
}

extension ContactModelQueryWhereSort
    on QueryBuilder<ContactModel, ContactModel, QWhere> {
  QueryBuilder<ContactModel, ContactModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterWhere> anyStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'status'),
      );
    });
  }
}

extension ContactModelQueryWhere
    on QueryBuilder<ContactModel, ContactModel, QWhereClause> {
  QueryBuilder<ContactModel, ContactModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<ContactModel, ContactModel, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<ContactModel, ContactModel, QAfterWhereClause>
  employeeNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'employeeName', value: [null]),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterWhereClause>
  employeeNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'employeeName',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterWhereClause>
  employeeNameEqualTo(String? employeeName) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'employeeName',
          value: [employeeName],
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterWhereClause>
  employeeNameNotEqualTo(String? employeeName) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'employeeName',
                lower: [],
                upper: [employeeName],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'employeeName',
                lower: [employeeName],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'employeeName',
                lower: [employeeName],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'employeeName',
                lower: [],
                upper: [employeeName],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterWhereClause> statusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'status', value: [null]),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterWhereClause>
  statusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'status',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterWhereClause> statusEqualTo(
    int? status,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'status', value: [status]),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterWhereClause> statusNotEqualTo(
    int? status,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'status',
                lower: [],
                upper: [status],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'status',
                lower: [status],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'status',
                lower: [status],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'status',
                lower: [],
                upper: [status],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterWhereClause> statusGreaterThan(
    int? status, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'status',
          lower: [status],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterWhereClause> statusLessThan(
    int? status, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'status',
          lower: [],
          upper: [status],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterWhereClause> statusBetween(
    int? lowerStatus,
    int? upperStatus, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'status',
          lower: [lowerStatus],
          includeLower: includeLower,
          upper: [upperStatus],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension ContactModelQueryFilter
    on QueryBuilder<ContactModel, ContactModel, QFilterCondition> {
  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  companyCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'companyCode'),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  companyCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'companyCode'),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  companyCodeEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'companyCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  companyCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'companyCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  companyCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'companyCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  companyCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'companyCode',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  companyCodeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'companyCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  companyCodeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'companyCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  companyCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'companyCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  companyCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'companyCode',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  companyCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'companyCode', value: ''),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  companyCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'companyCode', value: ''),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  companyNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'companyName'),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  companyNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'companyName'),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  companyNameEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'companyName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  companyNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'companyName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  companyNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'companyName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  companyNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'companyName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  companyNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'companyName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  companyNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'companyName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  companyNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'companyName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  companyNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'companyName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  companyNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'companyName', value: ''),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  companyNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'companyName', value: ''),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  companyNameFuriganaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'companyNameFurigana'),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  companyNameFuriganaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'companyNameFurigana'),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  companyNameFuriganaEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'companyNameFurigana',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  companyNameFuriganaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'companyNameFurigana',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  companyNameFuriganaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'companyNameFurigana',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  companyNameFuriganaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'companyNameFurigana',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  companyNameFuriganaStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'companyNameFurigana',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  companyNameFuriganaEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'companyNameFurigana',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  companyNameFuriganaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'companyNameFurigana',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  companyNameFuriganaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'companyNameFurigana',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  companyNameFuriganaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'companyNameFurigana', value: ''),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  companyNameFuriganaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          property: r'companyNameFurigana',
          value: '',
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'createdAt'),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'createdAt'),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  createdAtEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'createdAt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  createdAtGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'createdAt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  createdAtLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'createdAt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  createdAtBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'createdAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  createdAtStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'createdAt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  createdAtEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'createdAt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  createdAtContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'createdAt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  createdAtMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'createdAt',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  createdAtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: ''),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  createdAtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'createdAt', value: ''),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  createdByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'createdBy'),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  createdByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'createdBy'),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  createdByEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'createdBy',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  createdByGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'createdBy',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  createdByLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'createdBy',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  createdByBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'createdBy',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  createdByStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'createdBy',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  createdByEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'createdBy',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  createdByContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'createdBy',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  createdByMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'createdBy',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  createdByIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdBy', value: ''),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  createdByIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'createdBy', value: ''),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  emailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'email'),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  emailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'email'),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition> emailEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'email',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  emailGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'email',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition> emailLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'email',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition> emailBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'email',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  emailStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'email',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition> emailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'email',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition> emailContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'email',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition> emailMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'email',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  emailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'email', value: ''),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  emailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'email', value: ''),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  emailsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'emails'),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  emailsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'emails'),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition> emailsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'emails',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  emailsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'emails',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  emailsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'emails',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition> emailsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'emails',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  emailsStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'emails',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  emailsEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'emails',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  emailsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'emails',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition> emailsMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'emails',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  emailsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'emails', value: ''),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  emailsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'emails', value: ''),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  employeeNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'employeeName'),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  employeeNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'employeeName'),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  employeeNameEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'employeeName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  employeeNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'employeeName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  employeeNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'employeeName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  employeeNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'employeeName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  employeeNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'employeeName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  employeeNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'employeeName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  employeeNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'employeeName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  employeeNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'employeeName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  employeeNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'employeeName', value: ''),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  employeeNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'employeeName', value: ''),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  firstNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'firstName'),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  firstNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'firstName'),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  firstNameEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'firstName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  firstNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'firstName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  firstNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'firstName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  firstNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'firstName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  firstNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'firstName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  firstNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'firstName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  firstNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'firstName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  firstNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'firstName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  firstNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'firstName', value: ''),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  firstNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'firstName', value: ''),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  firstNameFuriganaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'firstNameFurigana'),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  firstNameFuriganaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'firstNameFurigana'),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  firstNameFuriganaEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'firstNameFurigana',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  firstNameFuriganaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'firstNameFurigana',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  firstNameFuriganaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'firstNameFurigana',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  firstNameFuriganaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'firstNameFurigana',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  firstNameFuriganaStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'firstNameFurigana',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  firstNameFuriganaEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'firstNameFurigana',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  firstNameFuriganaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'firstNameFurigana',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  firstNameFuriganaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'firstNameFurigana',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  firstNameFuriganaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'firstNameFurigana', value: ''),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  firstNameFuriganaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'firstNameFurigana', value: ''),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
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

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  idLocalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'idLocal'),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  idLocalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'idLocal'),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  idLocalEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'idLocal',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  idLocalGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'idLocal',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  idLocalLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'idLocal',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  idLocalBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'idLocal',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  idLocalStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'idLocal',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  idLocalEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'idLocal',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  idLocalContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'idLocal',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  idLocalMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'idLocal',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  idLocalIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'idLocal', value: ''),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  idLocalIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'idLocal', value: ''),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  identifierIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'identifier'),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  identifierIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'identifier'),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  identifierEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'identifier',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  identifierGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'identifier',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  identifierLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'identifier',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  identifierBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'identifier',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  identifierStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'identifier',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  identifierEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'identifier',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  identifierContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'identifier',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  identifierMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'identifier',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  identifierIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'identifier', value: ''),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  identifierIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'identifier', value: ''),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isSynced', value: value),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  isSyncedLocalEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isSyncedLocal', value: value),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  lastNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastName'),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  lastNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastName'),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  lastNameEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'lastName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  lastNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  lastNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  lastNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  lastNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'lastName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  lastNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'lastName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  lastNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'lastName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  lastNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'lastName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  lastNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastName', value: ''),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  lastNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'lastName', value: ''),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  lastNameFuriganaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastNameFurigana'),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  lastNameFuriganaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastNameFurigana'),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  lastNameFuriganaEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'lastNameFurigana',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  lastNameFuriganaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastNameFurigana',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  lastNameFuriganaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastNameFurigana',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  lastNameFuriganaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastNameFurigana',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  lastNameFuriganaStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'lastNameFurigana',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  lastNameFuriganaEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'lastNameFurigana',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  lastNameFuriganaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'lastNameFurigana',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  lastNameFuriganaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'lastNameFurigana',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  lastNameFuriganaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastNameFurigana', value: ''),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  lastNameFuriganaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'lastNameFurigana', value: ''),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition> noteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'note'),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  noteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'note'),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition> noteEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'note',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  noteGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'note',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition> noteLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'note',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition> noteBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'note',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  noteStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'note',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition> noteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'note',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition> noteContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'note',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition> noteMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'note',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  noteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'note', value: ''),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  noteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'note', value: ''),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  phoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'phone'),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  phoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'phone'),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition> phoneEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'phone',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  phoneGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'phone',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition> phoneLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'phone',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition> phoneBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'phone',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  phoneStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'phone',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition> phoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'phone',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition> phoneContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'phone',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition> phoneMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'phone',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  phoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'phone', value: ''),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  phoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'phone', value: ''),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  phonesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'phones'),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  phonesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'phones'),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition> phonesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'phones',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  phonesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'phones',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  phonesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'phones',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition> phonesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'phones',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  phonesStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'phones',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  phonesEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'phones',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  phonesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'phones',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition> phonesMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'phones',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  phonesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'phones', value: ''),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  phonesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'phones', value: ''),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  photoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'photo'),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  photoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'photo'),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition> photoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'photo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  photoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'photo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition> photoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'photo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition> photoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'photo',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  photoStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'photo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition> photoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'photo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition> photoContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'photo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition> photoMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'photo',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  photoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'photo', value: ''),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  photoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'photo', value: ''),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  statusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'status'),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  statusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'status'),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition> statusEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'status', value: value),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  statusGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'status',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  statusLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'status',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition> statusBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'status',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'updatedAt'),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'updatedAt'),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  updatedAtEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'updatedAt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  updatedAtGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'updatedAt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  updatedAtLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'updatedAt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  updatedAtBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'updatedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  updatedAtStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'updatedAt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  updatedAtEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'updatedAt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  updatedAtContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'updatedAt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  updatedAtMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'updatedAt',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  updatedAtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: ''),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  updatedAtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'updatedAt', value: ''),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  updatedByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'updatedBy'),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  updatedByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'updatedBy'),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  updatedByEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'updatedBy',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  updatedByGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'updatedBy',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  updatedByLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'updatedBy',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  updatedByBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'updatedBy',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  updatedByStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'updatedBy',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  updatedByEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'updatedBy',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  updatedByContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'updatedBy',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  updatedByMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'updatedBy',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  updatedByIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedBy', value: ''),
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterFilterCondition>
  updatedByIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'updatedBy', value: ''),
      );
    });
  }
}

extension ContactModelQueryObject
    on QueryBuilder<ContactModel, ContactModel, QFilterCondition> {}

extension ContactModelQueryLinks
    on QueryBuilder<ContactModel, ContactModel, QFilterCondition> {}

extension ContactModelQuerySortBy
    on QueryBuilder<ContactModel, ContactModel, QSortBy> {
  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> sortByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy>
  sortByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> sortByCompanyName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyName', Sort.asc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy>
  sortByCompanyNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyName', Sort.desc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy>
  sortByCompanyNameFurigana() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyNameFurigana', Sort.asc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy>
  sortByCompanyNameFuriganaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyNameFurigana', Sort.desc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> sortByCreatedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdBy', Sort.asc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> sortByCreatedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdBy', Sort.desc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> sortByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> sortByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> sortByEmails() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emails', Sort.asc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> sortByEmailsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emails', Sort.desc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> sortByEmployeeName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeName', Sort.asc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy>
  sortByEmployeeNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeName', Sort.desc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> sortByFirstName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstName', Sort.asc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> sortByFirstNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstName', Sort.desc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy>
  sortByFirstNameFurigana() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstNameFurigana', Sort.asc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy>
  sortByFirstNameFuriganaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstNameFurigana', Sort.desc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> sortByIdLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idLocal', Sort.asc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> sortByIdLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idLocal', Sort.desc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> sortByIdentifier() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'identifier', Sort.asc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy>
  sortByIdentifierDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'identifier', Sort.desc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> sortByIsSyncedLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSyncedLocal', Sort.asc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy>
  sortByIsSyncedLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSyncedLocal', Sort.desc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> sortByLastName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastName', Sort.asc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> sortByLastNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastName', Sort.desc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy>
  sortByLastNameFurigana() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastNameFurigana', Sort.asc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy>
  sortByLastNameFuriganaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastNameFurigana', Sort.desc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> sortByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> sortByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> sortByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> sortByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> sortByPhones() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phones', Sort.asc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> sortByPhonesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phones', Sort.desc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> sortByPhoto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photo', Sort.asc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> sortByPhotoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photo', Sort.desc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> sortByUpdatedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedBy', Sort.asc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> sortByUpdatedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedBy', Sort.desc);
    });
  }
}

extension ContactModelQuerySortThenBy
    on QueryBuilder<ContactModel, ContactModel, QSortThenBy> {
  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> thenByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy>
  thenByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> thenByCompanyName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyName', Sort.asc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy>
  thenByCompanyNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyName', Sort.desc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy>
  thenByCompanyNameFurigana() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyNameFurigana', Sort.asc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy>
  thenByCompanyNameFuriganaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyNameFurigana', Sort.desc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> thenByCreatedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdBy', Sort.asc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> thenByCreatedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdBy', Sort.desc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> thenByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> thenByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> thenByEmails() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emails', Sort.asc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> thenByEmailsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emails', Sort.desc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> thenByEmployeeName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeName', Sort.asc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy>
  thenByEmployeeNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeName', Sort.desc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> thenByFirstName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstName', Sort.asc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> thenByFirstNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstName', Sort.desc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy>
  thenByFirstNameFurigana() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstNameFurigana', Sort.asc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy>
  thenByFirstNameFuriganaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstNameFurigana', Sort.desc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> thenByIdLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idLocal', Sort.asc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> thenByIdLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idLocal', Sort.desc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> thenByIdentifier() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'identifier', Sort.asc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy>
  thenByIdentifierDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'identifier', Sort.desc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> thenByIsSyncedLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSyncedLocal', Sort.asc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy>
  thenByIsSyncedLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSyncedLocal', Sort.desc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> thenByLastName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastName', Sort.asc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> thenByLastNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastName', Sort.desc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy>
  thenByLastNameFurigana() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastNameFurigana', Sort.asc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy>
  thenByLastNameFuriganaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastNameFurigana', Sort.desc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> thenByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> thenByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> thenByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> thenByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> thenByPhones() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phones', Sort.asc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> thenByPhonesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phones', Sort.desc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> thenByPhoto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photo', Sort.asc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> thenByPhotoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photo', Sort.desc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> thenByUpdatedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedBy', Sort.asc);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QAfterSortBy> thenByUpdatedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedBy', Sort.desc);
    });
  }
}

extension ContactModelQueryWhereDistinct
    on QueryBuilder<ContactModel, ContactModel, QDistinct> {
  QueryBuilder<ContactModel, ContactModel, QDistinct> distinctByCompanyCode({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'companyCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QDistinct> distinctByCompanyName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'companyName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QDistinct>
  distinctByCompanyNameFurigana({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'companyNameFurigana',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QDistinct> distinctByCreatedAt({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QDistinct> distinctByCreatedBy({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdBy', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QDistinct> distinctByEmail({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'email', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QDistinct> distinctByEmails({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'emails', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QDistinct> distinctByEmployeeName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'employeeName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QDistinct> distinctByFirstName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'firstName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QDistinct>
  distinctByFirstNameFurigana({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'firstNameFurigana',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QDistinct> distinctByIdLocal({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idLocal', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QDistinct> distinctByIdentifier({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'identifier', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<ContactModel, ContactModel, QDistinct>
  distinctByIsSyncedLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSyncedLocal');
    });
  }

  QueryBuilder<ContactModel, ContactModel, QDistinct> distinctByLastName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QDistinct>
  distinctByLastNameFurigana({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'lastNameFurigana',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<ContactModel, ContactModel, QDistinct> distinctByNote({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'note', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QDistinct> distinctByPhone({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phone', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QDistinct> distinctByPhones({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phones', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QDistinct> distinctByPhoto({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'photo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<ContactModel, ContactModel, QDistinct> distinctByUpdatedAt({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ContactModel, ContactModel, QDistinct> distinctByUpdatedBy({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedBy', caseSensitive: caseSensitive);
    });
  }
}

extension ContactModelQueryProperty
    on QueryBuilder<ContactModel, ContactModel, QQueryProperty> {
  QueryBuilder<ContactModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ContactModel, String?, QQueryOperations> companyCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyCode');
    });
  }

  QueryBuilder<ContactModel, String?, QQueryOperations> companyNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyName');
    });
  }

  QueryBuilder<ContactModel, String?, QQueryOperations>
  companyNameFuriganaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyNameFurigana');
    });
  }

  QueryBuilder<ContactModel, String?, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<ContactModel, String?, QQueryOperations> createdByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdBy');
    });
  }

  QueryBuilder<ContactModel, String?, QQueryOperations> emailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'email');
    });
  }

  QueryBuilder<ContactModel, String?, QQueryOperations> emailsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'emails');
    });
  }

  QueryBuilder<ContactModel, String?, QQueryOperations> employeeNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'employeeName');
    });
  }

  QueryBuilder<ContactModel, String?, QQueryOperations> firstNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'firstName');
    });
  }

  QueryBuilder<ContactModel, String?, QQueryOperations>
  firstNameFuriganaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'firstNameFurigana');
    });
  }

  QueryBuilder<ContactModel, String?, QQueryOperations> idLocalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idLocal');
    });
  }

  QueryBuilder<ContactModel, String?, QQueryOperations> identifierProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'identifier');
    });
  }

  QueryBuilder<ContactModel, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<ContactModel, bool, QQueryOperations> isSyncedLocalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSyncedLocal');
    });
  }

  QueryBuilder<ContactModel, String?, QQueryOperations> lastNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastName');
    });
  }

  QueryBuilder<ContactModel, String?, QQueryOperations>
  lastNameFuriganaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastNameFurigana');
    });
  }

  QueryBuilder<ContactModel, String?, QQueryOperations> noteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'note');
    });
  }

  QueryBuilder<ContactModel, String?, QQueryOperations> phoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phone');
    });
  }

  QueryBuilder<ContactModel, String?, QQueryOperations> phonesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phones');
    });
  }

  QueryBuilder<ContactModel, String?, QQueryOperations> photoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photo');
    });
  }

  QueryBuilder<ContactModel, int?, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<ContactModel, String?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<ContactModel, String?, QQueryOperations> updatedByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedBy');
    });
  }
}
