// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class $UserTableTable extends UserTable
    with TableInfo<$UserTableTable, UserModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _userNameMeta =
      const VerificationMeta('userName');
  @override
  late final GeneratedColumn<String> userName = GeneratedColumn<String>(
      'user_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userAcctypeMeta =
      const VerificationMeta('userAcctype');
  @override
  late final GeneratedColumn<int> userAcctype = GeneratedColumn<int>(
      'user_acctype', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _branchIdMeta =
      const VerificationMeta('branchId');
  @override
  late final GeneratedColumn<int> branchId = GeneratedColumn<int>(
      'branch_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _groupIdMeta =
      const VerificationMeta('groupId');
  @override
  late final GeneratedColumn<int> groupId = GeneratedColumn<int>(
      'group_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<Uint8List> image = GeneratedColumn<Uint8List>(
      'image', aliasedName, false,
      type: DriftSqlType.blob, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, userName, password, userAcctype, branchId, groupId, note, image];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_table';
  @override
  VerificationContext validateIntegrity(Insertable<UserModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_name')) {
      context.handle(_userNameMeta,
          userName.isAcceptableOrUnknown(data['user_name']!, _userNameMeta));
    } else if (isInserting) {
      context.missing(_userNameMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('user_acctype')) {
      context.handle(
          _userAcctypeMeta,
          userAcctype.isAcceptableOrUnknown(
              data['user_acctype']!, _userAcctypeMeta));
    } else if (isInserting) {
      context.missing(_userAcctypeMeta);
    }
    if (data.containsKey('branch_id')) {
      context.handle(_branchIdMeta,
          branchId.isAcceptableOrUnknown(data['branch_id']!, _branchIdMeta));
    } else if (isInserting) {
      context.missing(_branchIdMeta);
    }
    if (data.containsKey('group_id')) {
      context.handle(_groupIdMeta,
          groupId.isAcceptableOrUnknown(data['group_id']!, _groupIdMeta));
    } else if (isInserting) {
      context.missing(_groupIdMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    } else if (isInserting) {
      context.missing(_noteMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_name'])!,
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
      userAcctype: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_acctype'])!,
      branchId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}branch_id'])!,
      groupId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}group_id'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}image'])!,
    );
  }

  @override
  $UserTableTable createAlias(String alias) {
    return $UserTableTable(attachedDatabase, alias);
  }
}

class UserTableCompanion extends UpdateCompanion<UserModel> {
  final Value<int> id;
  final Value<String> userName;
  final Value<String> password;
  final Value<int> userAcctype;
  final Value<int> branchId;
  final Value<int> groupId;
  final Value<String> note;
  final Value<Uint8List> image;
  const UserTableCompanion({
    this.id = const Value.absent(),
    this.userName = const Value.absent(),
    this.password = const Value.absent(),
    this.userAcctype = const Value.absent(),
    this.branchId = const Value.absent(),
    this.groupId = const Value.absent(),
    this.note = const Value.absent(),
    this.image = const Value.absent(),
  });
  UserTableCompanion.insert({
    this.id = const Value.absent(),
    required String userName,
    required String password,
    required int userAcctype,
    required int branchId,
    required int groupId,
    required String note,
    required Uint8List image,
  })  : userName = Value(userName),
        password = Value(password),
        userAcctype = Value(userAcctype),
        branchId = Value(branchId),
        groupId = Value(groupId),
        note = Value(note),
        image = Value(image);
  static Insertable<UserModel> custom({
    Expression<int>? id,
    Expression<String>? userName,
    Expression<String>? password,
    Expression<int>? userAcctype,
    Expression<int>? branchId,
    Expression<int>? groupId,
    Expression<String>? note,
    Expression<Uint8List>? image,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userName != null) 'user_name': userName,
      if (password != null) 'password': password,
      if (userAcctype != null) 'user_acctype': userAcctype,
      if (branchId != null) 'branch_id': branchId,
      if (groupId != null) 'group_id': groupId,
      if (note != null) 'note': note,
      if (image != null) 'image': image,
    });
  }

  UserTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? userName,
      Value<String>? password,
      Value<int>? userAcctype,
      Value<int>? branchId,
      Value<int>? groupId,
      Value<String>? note,
      Value<Uint8List>? image}) {
    return UserTableCompanion(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      password: password ?? this.password,
      userAcctype: userAcctype ?? this.userAcctype,
      branchId: branchId ?? this.branchId,
      groupId: groupId ?? this.groupId,
      note: note ?? this.note,
      image: image ?? this.image,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userName.present) {
      map['user_name'] = Variable<String>(userName.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (userAcctype.present) {
      map['user_acctype'] = Variable<int>(userAcctype.value);
    }
    if (branchId.present) {
      map['branch_id'] = Variable<int>(branchId.value);
    }
    if (groupId.present) {
      map['group_id'] = Variable<int>(groupId.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (image.present) {
      map['image'] = Variable<Uint8List>(image.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserTableCompanion(')
          ..write('id: $id, ')
          ..write('userName: $userName, ')
          ..write('password: $password, ')
          ..write('userAcctype: $userAcctype, ')
          ..write('branchId: $branchId, ')
          ..write('groupId: $groupId, ')
          ..write('note: $note, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }
}

class $CompanyTableTable extends CompanyTable
    with TableInfo<$CompanyTableTable, CompanyModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CompanyTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _enNameMeta = const VerificationMeta('enName');
  @override
  late final GeneratedColumn<String> enName = GeneratedColumn<String>(
      'en_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _shortNameMeta =
      const VerificationMeta('shortName');
  @override
  late final GeneratedColumn<String> shortName = GeneratedColumn<String>(
      'short_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _enShortNameMeta =
      const VerificationMeta('enShortName');
  @override
  late final GeneratedColumn<String> enShortName = GeneratedColumn<String>(
      'en_short_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _websiteMeta =
      const VerificationMeta('website');
  @override
  late final GeneratedColumn<String> website = GeneratedColumn<String>(
      'website', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _logoMeta = const VerificationMeta('logo');
  @override
  late final GeneratedColumn<Uint8List> logo = GeneratedColumn<Uint8List>(
      'logo', aliasedName, false,
      type: DriftSqlType.blob, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, enName, shortName, enShortName, address, website, note, logo];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'company_table';
  @override
  VerificationContext validateIntegrity(Insertable<CompanyModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('en_name')) {
      context.handle(_enNameMeta,
          enName.isAcceptableOrUnknown(data['en_name']!, _enNameMeta));
    } else if (isInserting) {
      context.missing(_enNameMeta);
    }
    if (data.containsKey('short_name')) {
      context.handle(_shortNameMeta,
          shortName.isAcceptableOrUnknown(data['short_name']!, _shortNameMeta));
    } else if (isInserting) {
      context.missing(_shortNameMeta);
    }
    if (data.containsKey('en_short_name')) {
      context.handle(
          _enShortNameMeta,
          enShortName.isAcceptableOrUnknown(
              data['en_short_name']!, _enShortNameMeta));
    } else if (isInserting) {
      context.missing(_enShortNameMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('website')) {
      context.handle(_websiteMeta,
          website.isAcceptableOrUnknown(data['website']!, _websiteMeta));
    } else if (isInserting) {
      context.missing(_websiteMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    } else if (isInserting) {
      context.missing(_noteMeta);
    }
    if (data.containsKey('logo')) {
      context.handle(
          _logoMeta, logo.isAcceptableOrUnknown(data['logo']!, _logoMeta));
    } else if (isInserting) {
      context.missing(_logoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CompanyModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CompanyModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      enName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}en_name'])!,
      shortName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}short_name'])!,
      enShortName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}en_short_name'])!,
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address'])!,
      website: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}website'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note'])!,
      logo: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}logo'])!,
    );
  }

  @override
  $CompanyTableTable createAlias(String alias) {
    return $CompanyTableTable(attachedDatabase, alias);
  }
}

class CompanyTableCompanion extends UpdateCompanion<CompanyModel> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> enName;
  final Value<String> shortName;
  final Value<String> enShortName;
  final Value<String> address;
  final Value<String> website;
  final Value<String> note;
  final Value<Uint8List> logo;
  const CompanyTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.enName = const Value.absent(),
    this.shortName = const Value.absent(),
    this.enShortName = const Value.absent(),
    this.address = const Value.absent(),
    this.website = const Value.absent(),
    this.note = const Value.absent(),
    this.logo = const Value.absent(),
  });
  CompanyTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String enName,
    required String shortName,
    required String enShortName,
    required String address,
    required String website,
    required String note,
    required Uint8List logo,
  })  : name = Value(name),
        enName = Value(enName),
        shortName = Value(shortName),
        enShortName = Value(enShortName),
        address = Value(address),
        website = Value(website),
        note = Value(note),
        logo = Value(logo);
  static Insertable<CompanyModel> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? enName,
    Expression<String>? shortName,
    Expression<String>? enShortName,
    Expression<String>? address,
    Expression<String>? website,
    Expression<String>? note,
    Expression<Uint8List>? logo,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (enName != null) 'en_name': enName,
      if (shortName != null) 'short_name': shortName,
      if (enShortName != null) 'en_short_name': enShortName,
      if (address != null) 'address': address,
      if (website != null) 'website': website,
      if (note != null) 'note': note,
      if (logo != null) 'logo': logo,
    });
  }

  CompanyTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? enName,
      Value<String>? shortName,
      Value<String>? enShortName,
      Value<String>? address,
      Value<String>? website,
      Value<String>? note,
      Value<Uint8List>? logo}) {
    return CompanyTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      enName: enName ?? this.enName,
      shortName: shortName ?? this.shortName,
      enShortName: enShortName ?? this.enShortName,
      address: address ?? this.address,
      website: website ?? this.website,
      note: note ?? this.note,
      logo: logo ?? this.logo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (enName.present) {
      map['en_name'] = Variable<String>(enName.value);
    }
    if (shortName.present) {
      map['short_name'] = Variable<String>(shortName.value);
    }
    if (enShortName.present) {
      map['en_short_name'] = Variable<String>(enShortName.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (website.present) {
      map['website'] = Variable<String>(website.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (logo.present) {
      map['logo'] = Variable<Uint8List>(logo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CompanyTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('enName: $enName, ')
          ..write('shortName: $shortName, ')
          ..write('enShortName: $enShortName, ')
          ..write('address: $address, ')
          ..write('website: $website, ')
          ..write('note: $note, ')
          ..write('logo: $logo')
          ..write(')'))
        .toString();
  }
}

class $BranchTableTable extends BranchTable
    with TableInfo<$BranchTableTable, BranchModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BranchTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _companyIdMeta =
      const VerificationMeta('companyId');
  @override
  late final GeneratedColumn<int> companyId = GeneratedColumn<int>(
      'company_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _arReportHeaderMeta =
      const VerificationMeta('arReportHeader');
  @override
  late final GeneratedColumn<String> arReportHeader = GeneratedColumn<String>(
      'ar_report_header', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _enReportHeaderMeta =
      const VerificationMeta('enReportHeader');
  @override
  late final GeneratedColumn<String> enReportHeader = GeneratedColumn<String>(
      'en_report_header', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _logoMeta = const VerificationMeta('logo');
  @override
  late final GeneratedColumn<Uint8List> logo = GeneratedColumn<Uint8List>(
      'logo', aliasedName, false,
      type: DriftSqlType.blob, requiredDuringInsert: true);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        companyId,
        name,
        address,
        phone,
        email,
        arReportHeader,
        enReportHeader,
        logo,
        note
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'branch_table';
  @override
  VerificationContext validateIntegrity(Insertable<BranchModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('company_id')) {
      context.handle(_companyIdMeta,
          companyId.isAcceptableOrUnknown(data['company_id']!, _companyIdMeta));
    } else if (isInserting) {
      context.missing(_companyIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('ar_report_header')) {
      context.handle(
          _arReportHeaderMeta,
          arReportHeader.isAcceptableOrUnknown(
              data['ar_report_header']!, _arReportHeaderMeta));
    } else if (isInserting) {
      context.missing(_arReportHeaderMeta);
    }
    if (data.containsKey('en_report_header')) {
      context.handle(
          _enReportHeaderMeta,
          enReportHeader.isAcceptableOrUnknown(
              data['en_report_header']!, _enReportHeaderMeta));
    } else if (isInserting) {
      context.missing(_enReportHeaderMeta);
    }
    if (data.containsKey('logo')) {
      context.handle(
          _logoMeta, logo.isAcceptableOrUnknown(data['logo']!, _logoMeta));
    } else if (isInserting) {
      context.missing(_logoMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    } else if (isInserting) {
      context.missing(_noteMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BranchModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BranchModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      companyId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}company_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address'])!,
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      arReportHeader: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}ar_report_header'])!,
      enReportHeader: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}en_report_header'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note'])!,
      logo: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}logo'])!,
    );
  }

  @override
  $BranchTableTable createAlias(String alias) {
    return $BranchTableTable(attachedDatabase, alias);
  }
}

class BranchTableCompanion extends UpdateCompanion<BranchModel> {
  final Value<int> id;
  final Value<int> companyId;
  final Value<String> name;
  final Value<String> address;
  final Value<String> phone;
  final Value<String> email;
  final Value<String> arReportHeader;
  final Value<String> enReportHeader;
  final Value<Uint8List> logo;
  final Value<String> note;
  const BranchTableCompanion({
    this.id = const Value.absent(),
    this.companyId = const Value.absent(),
    this.name = const Value.absent(),
    this.address = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.arReportHeader = const Value.absent(),
    this.enReportHeader = const Value.absent(),
    this.logo = const Value.absent(),
    this.note = const Value.absent(),
  });
  BranchTableCompanion.insert({
    this.id = const Value.absent(),
    required int companyId,
    required String name,
    required String address,
    required String phone,
    required String email,
    required String arReportHeader,
    required String enReportHeader,
    required Uint8List logo,
    required String note,
  })  : companyId = Value(companyId),
        name = Value(name),
        address = Value(address),
        phone = Value(phone),
        email = Value(email),
        arReportHeader = Value(arReportHeader),
        enReportHeader = Value(enReportHeader),
        logo = Value(logo),
        note = Value(note);
  static Insertable<BranchModel> custom({
    Expression<int>? id,
    Expression<int>? companyId,
    Expression<String>? name,
    Expression<String>? address,
    Expression<String>? phone,
    Expression<String>? email,
    Expression<String>? arReportHeader,
    Expression<String>? enReportHeader,
    Expression<Uint8List>? logo,
    Expression<String>? note,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (companyId != null) 'company_id': companyId,
      if (name != null) 'name': name,
      if (address != null) 'address': address,
      if (phone != null) 'phone': phone,
      if (email != null) 'email': email,
      if (arReportHeader != null) 'ar_report_header': arReportHeader,
      if (enReportHeader != null) 'en_report_header': enReportHeader,
      if (logo != null) 'logo': logo,
      if (note != null) 'note': note,
    });
  }

  BranchTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? companyId,
      Value<String>? name,
      Value<String>? address,
      Value<String>? phone,
      Value<String>? email,
      Value<String>? arReportHeader,
      Value<String>? enReportHeader,
      Value<Uint8List>? logo,
      Value<String>? note}) {
    return BranchTableCompanion(
      id: id ?? this.id,
      companyId: companyId ?? this.companyId,
      name: name ?? this.name,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      arReportHeader: arReportHeader ?? this.arReportHeader,
      enReportHeader: enReportHeader ?? this.enReportHeader,
      logo: logo ?? this.logo,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (companyId.present) {
      map['company_id'] = Variable<int>(companyId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (arReportHeader.present) {
      map['ar_report_header'] = Variable<String>(arReportHeader.value);
    }
    if (enReportHeader.present) {
      map['en_report_header'] = Variable<String>(enReportHeader.value);
    }
    if (logo.present) {
      map['logo'] = Variable<Uint8List>(logo.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BranchTableCompanion(')
          ..write('id: $id, ')
          ..write('companyId: $companyId, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('arReportHeader: $arReportHeader, ')
          ..write('enReportHeader: $enReportHeader, ')
          ..write('logo: $logo, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

class $CurencyTableTable extends CurencyTable
    with TableInfo<$CurencyTableTable, CurencyModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CurencyTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _symbolMeta = const VerificationMeta('symbol');
  @override
  late final GeneratedColumn<String> symbol = GeneratedColumn<String>(
      'symbol', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _subNameMeta =
      const VerificationMeta('subName');
  @override
  late final GeneratedColumn<String> subName = GeneratedColumn<String>(
      'sub_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<double> value = GeneratedColumn<double>(
      'value', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _equivelantMeta =
      const VerificationMeta('equivelant');
  @override
  late final GeneratedColumn<double> equivelant = GeneratedColumn<double>(
      'equivelant', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _localCurrencyMeta =
      const VerificationMeta('localCurrency');
  @override
  late final GeneratedColumn<bool> localCurrency = GeneratedColumn<bool>(
      'local_currency', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("local_currency" IN (0, 1))'));
  static const VerificationMeta _storeCurrencyMeta =
      const VerificationMeta('storeCurrency');
  @override
  late final GeneratedColumn<bool> storeCurrency = GeneratedColumn<bool>(
      'store_currency', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("store_currency" IN (0, 1))'));
  static const VerificationMeta _maxValueMeta =
      const VerificationMeta('maxValue');
  @override
  late final GeneratedColumn<double> maxValue = GeneratedColumn<double>(
      'max_value', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _minValueMeta =
      const VerificationMeta('minValue');
  @override
  late final GeneratedColumn<double> minValue = GeneratedColumn<double>(
      'min_value', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _newDataMeta =
      const VerificationMeta('newData');
  @override
  late final GeneratedColumn<bool> newData = GeneratedColumn<bool>(
      'new_data', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("new_data" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        symbol,
        subName,
        value,
        equivelant,
        localCurrency,
        storeCurrency,
        maxValue,
        minValue,
        note,
        newData
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'curency_table';
  @override
  VerificationContext validateIntegrity(Insertable<CurencyModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('symbol')) {
      context.handle(_symbolMeta,
          symbol.isAcceptableOrUnknown(data['symbol']!, _symbolMeta));
    } else if (isInserting) {
      context.missing(_symbolMeta);
    }
    if (data.containsKey('sub_name')) {
      context.handle(_subNameMeta,
          subName.isAcceptableOrUnknown(data['sub_name']!, _subNameMeta));
    } else if (isInserting) {
      context.missing(_subNameMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('equivelant')) {
      context.handle(
          _equivelantMeta,
          equivelant.isAcceptableOrUnknown(
              data['equivelant']!, _equivelantMeta));
    } else if (isInserting) {
      context.missing(_equivelantMeta);
    }
    if (data.containsKey('local_currency')) {
      context.handle(
          _localCurrencyMeta,
          localCurrency.isAcceptableOrUnknown(
              data['local_currency']!, _localCurrencyMeta));
    } else if (isInserting) {
      context.missing(_localCurrencyMeta);
    }
    if (data.containsKey('store_currency')) {
      context.handle(
          _storeCurrencyMeta,
          storeCurrency.isAcceptableOrUnknown(
              data['store_currency']!, _storeCurrencyMeta));
    } else if (isInserting) {
      context.missing(_storeCurrencyMeta);
    }
    if (data.containsKey('max_value')) {
      context.handle(_maxValueMeta,
          maxValue.isAcceptableOrUnknown(data['max_value']!, _maxValueMeta));
    } else if (isInserting) {
      context.missing(_maxValueMeta);
    }
    if (data.containsKey('min_value')) {
      context.handle(_minValueMeta,
          minValue.isAcceptableOrUnknown(data['min_value']!, _minValueMeta));
    } else if (isInserting) {
      context.missing(_minValueMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    } else if (isInserting) {
      context.missing(_noteMeta);
    }
    if (data.containsKey('new_data')) {
      context.handle(_newDataMeta,
          newData.isAcceptableOrUnknown(data['new_data']!, _newDataMeta));
    } else if (isInserting) {
      context.missing(_newDataMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CurencyModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CurencyModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      symbol: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}symbol'])!,
      subName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sub_name'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}value'])!,
      equivelant: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}equivelant'])!,
      localCurrency: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}local_currency'])!,
      storeCurrency: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}store_currency'])!,
      maxValue: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}max_value'])!,
      minValue: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}min_value'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note'])!,
      newData: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}new_data'])!,
    );
  }

  @override
  $CurencyTableTable createAlias(String alias) {
    return $CurencyTableTable(attachedDatabase, alias);
  }
}

class CurencyTableCompanion extends UpdateCompanion<CurencyModel> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> symbol;
  final Value<String> subName;
  final Value<double> value;
  final Value<double> equivelant;
  final Value<bool> localCurrency;
  final Value<bool> storeCurrency;
  final Value<double> maxValue;
  final Value<double> minValue;
  final Value<String> note;
  final Value<bool> newData;
  const CurencyTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.symbol = const Value.absent(),
    this.subName = const Value.absent(),
    this.value = const Value.absent(),
    this.equivelant = const Value.absent(),
    this.localCurrency = const Value.absent(),
    this.storeCurrency = const Value.absent(),
    this.maxValue = const Value.absent(),
    this.minValue = const Value.absent(),
    this.note = const Value.absent(),
    this.newData = const Value.absent(),
  });
  CurencyTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String symbol,
    required String subName,
    required double value,
    required double equivelant,
    required bool localCurrency,
    required bool storeCurrency,
    required double maxValue,
    required double minValue,
    required String note,
    required bool newData,
  })  : name = Value(name),
        symbol = Value(symbol),
        subName = Value(subName),
        value = Value(value),
        equivelant = Value(equivelant),
        localCurrency = Value(localCurrency),
        storeCurrency = Value(storeCurrency),
        maxValue = Value(maxValue),
        minValue = Value(minValue),
        note = Value(note),
        newData = Value(newData);
  static Insertable<CurencyModel> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? symbol,
    Expression<String>? subName,
    Expression<double>? value,
    Expression<double>? equivelant,
    Expression<bool>? localCurrency,
    Expression<bool>? storeCurrency,
    Expression<double>? maxValue,
    Expression<double>? minValue,
    Expression<String>? note,
    Expression<bool>? newData,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (symbol != null) 'symbol': symbol,
      if (subName != null) 'sub_name': subName,
      if (value != null) 'value': value,
      if (equivelant != null) 'equivelant': equivelant,
      if (localCurrency != null) 'local_currency': localCurrency,
      if (storeCurrency != null) 'store_currency': storeCurrency,
      if (maxValue != null) 'max_value': maxValue,
      if (minValue != null) 'min_value': minValue,
      if (note != null) 'note': note,
      if (newData != null) 'new_data': newData,
    });
  }

  CurencyTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? symbol,
      Value<String>? subName,
      Value<double>? value,
      Value<double>? equivelant,
      Value<bool>? localCurrency,
      Value<bool>? storeCurrency,
      Value<double>? maxValue,
      Value<double>? minValue,
      Value<String>? note,
      Value<bool>? newData}) {
    return CurencyTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      symbol: symbol ?? this.symbol,
      subName: subName ?? this.subName,
      value: value ?? this.value,
      equivelant: equivelant ?? this.equivelant,
      localCurrency: localCurrency ?? this.localCurrency,
      storeCurrency: storeCurrency ?? this.storeCurrency,
      maxValue: maxValue ?? this.maxValue,
      minValue: minValue ?? this.minValue,
      note: note ?? this.note,
      newData: newData ?? this.newData,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (symbol.present) {
      map['symbol'] = Variable<String>(symbol.value);
    }
    if (subName.present) {
      map['sub_name'] = Variable<String>(subName.value);
    }
    if (value.present) {
      map['value'] = Variable<double>(value.value);
    }
    if (equivelant.present) {
      map['equivelant'] = Variable<double>(equivelant.value);
    }
    if (localCurrency.present) {
      map['local_currency'] = Variable<bool>(localCurrency.value);
    }
    if (storeCurrency.present) {
      map['store_currency'] = Variable<bool>(storeCurrency.value);
    }
    if (maxValue.present) {
      map['max_value'] = Variable<double>(maxValue.value);
    }
    if (minValue.present) {
      map['min_value'] = Variable<double>(minValue.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (newData.present) {
      map['new_data'] = Variable<bool>(newData.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CurencyTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('symbol: $symbol, ')
          ..write('subName: $subName, ')
          ..write('value: $value, ')
          ..write('equivelant: $equivelant, ')
          ..write('localCurrency: $localCurrency, ')
          ..write('storeCurrency: $storeCurrency, ')
          ..write('maxValue: $maxValue, ')
          ..write('minValue: $minValue, ')
          ..write('note: $note, ')
          ..write('newData: $newData')
          ..write(')'))
        .toString();
  }
}

class $UserStoreTableTable extends UserStoreTable
    with TableInfo<$UserStoreTableTable, UserStoreModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserStoreTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _accountNumberMeta =
      const VerificationMeta('accountNumber');
  @override
  late final GeneratedColumn<int> accountNumber = GeneratedColumn<int>(
      'account_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _branchIdMeta =
      const VerificationMeta('branchId');
  @override
  late final GeneratedColumn<int> branchId = GeneratedColumn<int>(
      'branch_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _storeManagerMeta =
      const VerificationMeta('storeManager');
  @override
  late final GeneratedColumn<String> storeManager = GeneratedColumn<String>(
      'store_manager', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _managerPhoneMeta =
      const VerificationMeta('managerPhone');
  @override
  late final GeneratedColumn<String> managerPhone = GeneratedColumn<String>(
      'manager_phone', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, accountNumber, branchId, storeManager, managerPhone, note];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_store_table';
  @override
  VerificationContext validateIntegrity(Insertable<UserStoreModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('account_number')) {
      context.handle(
          _accountNumberMeta,
          accountNumber.isAcceptableOrUnknown(
              data['account_number']!, _accountNumberMeta));
    } else if (isInserting) {
      context.missing(_accountNumberMeta);
    }
    if (data.containsKey('branch_id')) {
      context.handle(_branchIdMeta,
          branchId.isAcceptableOrUnknown(data['branch_id']!, _branchIdMeta));
    } else if (isInserting) {
      context.missing(_branchIdMeta);
    }
    if (data.containsKey('store_manager')) {
      context.handle(
          _storeManagerMeta,
          storeManager.isAcceptableOrUnknown(
              data['store_manager']!, _storeManagerMeta));
    } else if (isInserting) {
      context.missing(_storeManagerMeta);
    }
    if (data.containsKey('manager_phone')) {
      context.handle(
          _managerPhoneMeta,
          managerPhone.isAcceptableOrUnknown(
              data['manager_phone']!, _managerPhoneMeta));
    } else if (isInserting) {
      context.missing(_managerPhoneMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    } else if (isInserting) {
      context.missing(_noteMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserStoreModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserStoreModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      accountNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}account_number'])!,
      branchId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}branch_id'])!,
      storeManager: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}store_manager'])!,
      managerPhone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}manager_phone'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note'])!,
    );
  }

  @override
  $UserStoreTableTable createAlias(String alias) {
    return $UserStoreTableTable(attachedDatabase, alias);
  }
}

class UserStoreTableCompanion extends UpdateCompanion<UserStoreModel> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> accountNumber;
  final Value<int> branchId;
  final Value<String> storeManager;
  final Value<String> managerPhone;
  final Value<String> note;
  const UserStoreTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.accountNumber = const Value.absent(),
    this.branchId = const Value.absent(),
    this.storeManager = const Value.absent(),
    this.managerPhone = const Value.absent(),
    this.note = const Value.absent(),
  });
  UserStoreTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int accountNumber,
    required int branchId,
    required String storeManager,
    required String managerPhone,
    required String note,
  })  : name = Value(name),
        accountNumber = Value(accountNumber),
        branchId = Value(branchId),
        storeManager = Value(storeManager),
        managerPhone = Value(managerPhone),
        note = Value(note);
  static Insertable<UserStoreModel> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? accountNumber,
    Expression<int>? branchId,
    Expression<String>? storeManager,
    Expression<String>? managerPhone,
    Expression<String>? note,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (accountNumber != null) 'account_number': accountNumber,
      if (branchId != null) 'branch_id': branchId,
      if (storeManager != null) 'store_manager': storeManager,
      if (managerPhone != null) 'manager_phone': managerPhone,
      if (note != null) 'note': note,
    });
  }

  UserStoreTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? accountNumber,
      Value<int>? branchId,
      Value<String>? storeManager,
      Value<String>? managerPhone,
      Value<String>? note}) {
    return UserStoreTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      accountNumber: accountNumber ?? this.accountNumber,
      branchId: branchId ?? this.branchId,
      storeManager: storeManager ?? this.storeManager,
      managerPhone: managerPhone ?? this.managerPhone,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (accountNumber.present) {
      map['account_number'] = Variable<int>(accountNumber.value);
    }
    if (branchId.present) {
      map['branch_id'] = Variable<int>(branchId.value);
    }
    if (storeManager.present) {
      map['store_manager'] = Variable<String>(storeManager.value);
    }
    if (managerPhone.present) {
      map['manager_phone'] = Variable<String>(managerPhone.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserStoreTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('accountNumber: $accountNumber, ')
          ..write('branchId: $branchId, ')
          ..write('storeManager: $storeManager, ')
          ..write('managerPhone: $managerPhone, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

class $UnitTableTable extends UnitTable
    with TableInfo<$UnitTableTable, UnitModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UnitTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _newDataMeta =
      const VerificationMeta('newData');
  @override
  late final GeneratedColumn<bool> newData = GeneratedColumn<bool>(
      'new_data', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("new_data" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [id, name, note, newData];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'unit_table';
  @override
  VerificationContext validateIntegrity(Insertable<UnitModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    } else if (isInserting) {
      context.missing(_noteMeta);
    }
    if (data.containsKey('new_data')) {
      context.handle(_newDataMeta,
          newData.isAcceptableOrUnknown(data['new_data']!, _newDataMeta));
    } else if (isInserting) {
      context.missing(_newDataMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UnitModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UnitModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note'])!,
      newData: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}new_data'])!,
    );
  }

  @override
  $UnitTableTable createAlias(String alias) {
    return $UnitTableTable(attachedDatabase, alias);
  }
}

class UnitTableCompanion extends UpdateCompanion<UnitModel> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> note;
  final Value<bool> newData;
  const UnitTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.note = const Value.absent(),
    this.newData = const Value.absent(),
  });
  UnitTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String note,
    required bool newData,
  })  : name = Value(name),
        note = Value(note),
        newData = Value(newData);
  static Insertable<UnitModel> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? note,
    Expression<bool>? newData,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (note != null) 'note': note,
      if (newData != null) 'new_data': newData,
    });
  }

  UnitTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? note,
      Value<bool>? newData}) {
    return UnitTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      note: note ?? this.note,
      newData: newData ?? this.newData,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (newData.present) {
      map['new_data'] = Variable<bool>(newData.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UnitTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('note: $note, ')
          ..write('newData: $newData')
          ..write(')'))
        .toString();
  }
}

class $ItemGroupTableTable extends ItemGroupTable
    with TableInfo<$ItemGroupTableTable, ItemGroupModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ItemGroupTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<int> code = GeneratedColumn<int>(
      'code', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<int> type = GeneratedColumn<int>(
      'type', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _parentMeta = const VerificationMeta('parent');
  @override
  late final GeneratedColumn<int> parent = GeneratedColumn<int>(
      'parent', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _newDataMeta =
      const VerificationMeta('newData');
  @override
  late final GeneratedColumn<bool> newData = GeneratedColumn<bool>(
      'new_data', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("new_data" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, code, type, parent, name, note, newData];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'item_group_table';
  @override
  VerificationContext validateIntegrity(Insertable<ItemGroupModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('parent')) {
      context.handle(_parentMeta,
          parent.isAcceptableOrUnknown(data['parent']!, _parentMeta));
    } else if (isInserting) {
      context.missing(_parentMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    } else if (isInserting) {
      context.missing(_noteMeta);
    }
    if (data.containsKey('new_data')) {
      context.handle(_newDataMeta,
          newData.isAcceptableOrUnknown(data['new_data']!, _newDataMeta));
    } else if (isInserting) {
      context.missing(_newDataMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ItemGroupModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ItemGroupModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}code'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!,
      parent: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}parent'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note'])!,
      newData: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}new_data'])!,
    );
  }

  @override
  $ItemGroupTableTable createAlias(String alias) {
    return $ItemGroupTableTable(attachedDatabase, alias);
  }
}

class ItemGroupTableCompanion extends UpdateCompanion<ItemGroupModel> {
  final Value<int> id;
  final Value<int> code;
  final Value<int> type;
  final Value<int> parent;
  final Value<String> name;
  final Value<String> note;
  final Value<bool> newData;
  const ItemGroupTableCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.type = const Value.absent(),
    this.parent = const Value.absent(),
    this.name = const Value.absent(),
    this.note = const Value.absent(),
    this.newData = const Value.absent(),
  });
  ItemGroupTableCompanion.insert({
    this.id = const Value.absent(),
    required int code,
    required int type,
    required int parent,
    required String name,
    required String note,
    required bool newData,
  })  : code = Value(code),
        type = Value(type),
        parent = Value(parent),
        name = Value(name),
        note = Value(note),
        newData = Value(newData);
  static Insertable<ItemGroupModel> custom({
    Expression<int>? id,
    Expression<int>? code,
    Expression<int>? type,
    Expression<int>? parent,
    Expression<String>? name,
    Expression<String>? note,
    Expression<bool>? newData,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (type != null) 'type': type,
      if (parent != null) 'parent': parent,
      if (name != null) 'name': name,
      if (note != null) 'note': note,
      if (newData != null) 'new_data': newData,
    });
  }

  ItemGroupTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? code,
      Value<int>? type,
      Value<int>? parent,
      Value<String>? name,
      Value<String>? note,
      Value<bool>? newData}) {
    return ItemGroupTableCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      type: type ?? this.type,
      parent: parent ?? this.parent,
      name: name ?? this.name,
      note: note ?? this.note,
      newData: newData ?? this.newData,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<int>(code.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(type.value);
    }
    if (parent.present) {
      map['parent'] = Variable<int>(parent.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (newData.present) {
      map['new_data'] = Variable<bool>(newData.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemGroupTableCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('type: $type, ')
          ..write('parent: $parent, ')
          ..write('name: $name, ')
          ..write('note: $note, ')
          ..write('newData: $newData')
          ..write(')'))
        .toString();
  }
}

class $ItemUnitTableTable extends ItemUnitTable
    with TableInfo<$ItemUnitTableTable, ItemUnitsModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ItemUnitTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<int> itemId = GeneratedColumn<int>(
      'item_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _itemUnitIdMeta =
      const VerificationMeta('itemUnitId');
  @override
  late final GeneratedColumn<int> itemUnitId = GeneratedColumn<int>(
      'item_unit_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _unitFactorMeta =
      const VerificationMeta('unitFactor');
  @override
  late final GeneratedColumn<int> unitFactor = GeneratedColumn<int>(
      'unit_factor', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _wholeSalepriceMeta =
      const VerificationMeta('wholeSaleprice');
  @override
  late final GeneratedColumn<double> wholeSaleprice = GeneratedColumn<double>(
      'whole_saleprice', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _retailPriceMeta =
      const VerificationMeta('retailPrice');
  @override
  late final GeneratedColumn<double> retailPrice = GeneratedColumn<double>(
      'retail_price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _spacialPriceMeta =
      const VerificationMeta('spacialPrice');
  @override
  late final GeneratedColumn<double> spacialPrice = GeneratedColumn<double>(
      'spacial_price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _intialCostMeta =
      const VerificationMeta('intialCost');
  @override
  late final GeneratedColumn<double> intialCost = GeneratedColumn<double>(
      'intial_cost', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _itemDiscountMeta =
      const VerificationMeta('itemDiscount');
  @override
  late final GeneratedColumn<double> itemDiscount = GeneratedColumn<double>(
      'item_discount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _unitBarcodeMeta =
      const VerificationMeta('unitBarcode');
  @override
  late final GeneratedColumn<String> unitBarcode = GeneratedColumn<String>(
      'unit_barcode', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _newDataMeta =
      const VerificationMeta('newData');
  @override
  late final GeneratedColumn<bool> newData = GeneratedColumn<bool>(
      'new_data', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("new_data" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        itemId,
        itemUnitId,
        unitFactor,
        wholeSaleprice,
        retailPrice,
        spacialPrice,
        intialCost,
        itemDiscount,
        unitBarcode,
        newData
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'item_unit_table';
  @override
  VerificationContext validateIntegrity(Insertable<ItemUnitsModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('item_id')) {
      context.handle(_itemIdMeta,
          itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta));
    } else if (isInserting) {
      context.missing(_itemIdMeta);
    }
    if (data.containsKey('item_unit_id')) {
      context.handle(
          _itemUnitIdMeta,
          itemUnitId.isAcceptableOrUnknown(
              data['item_unit_id']!, _itemUnitIdMeta));
    } else if (isInserting) {
      context.missing(_itemUnitIdMeta);
    }
    if (data.containsKey('unit_factor')) {
      context.handle(
          _unitFactorMeta,
          unitFactor.isAcceptableOrUnknown(
              data['unit_factor']!, _unitFactorMeta));
    } else if (isInserting) {
      context.missing(_unitFactorMeta);
    }
    if (data.containsKey('whole_saleprice')) {
      context.handle(
          _wholeSalepriceMeta,
          wholeSaleprice.isAcceptableOrUnknown(
              data['whole_saleprice']!, _wholeSalepriceMeta));
    } else if (isInserting) {
      context.missing(_wholeSalepriceMeta);
    }
    if (data.containsKey('retail_price')) {
      context.handle(
          _retailPriceMeta,
          retailPrice.isAcceptableOrUnknown(
              data['retail_price']!, _retailPriceMeta));
    } else if (isInserting) {
      context.missing(_retailPriceMeta);
    }
    if (data.containsKey('spacial_price')) {
      context.handle(
          _spacialPriceMeta,
          spacialPrice.isAcceptableOrUnknown(
              data['spacial_price']!, _spacialPriceMeta));
    } else if (isInserting) {
      context.missing(_spacialPriceMeta);
    }
    if (data.containsKey('intial_cost')) {
      context.handle(
          _intialCostMeta,
          intialCost.isAcceptableOrUnknown(
              data['intial_cost']!, _intialCostMeta));
    } else if (isInserting) {
      context.missing(_intialCostMeta);
    }
    if (data.containsKey('item_discount')) {
      context.handle(
          _itemDiscountMeta,
          itemDiscount.isAcceptableOrUnknown(
              data['item_discount']!, _itemDiscountMeta));
    } else if (isInserting) {
      context.missing(_itemDiscountMeta);
    }
    if (data.containsKey('unit_barcode')) {
      context.handle(
          _unitBarcodeMeta,
          unitBarcode.isAcceptableOrUnknown(
              data['unit_barcode']!, _unitBarcodeMeta));
    } else if (isInserting) {
      context.missing(_unitBarcodeMeta);
    }
    if (data.containsKey('new_data')) {
      context.handle(_newDataMeta,
          newData.isAcceptableOrUnknown(data['new_data']!, _newDataMeta));
    } else if (isInserting) {
      context.missing(_newDataMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  ItemUnitsModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ItemUnitsModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      itemId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}item_id'])!,
      itemUnitId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}item_unit_id'])!,
      unitFactor: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}unit_factor'])!,
      wholeSaleprice: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}whole_saleprice'])!,
      retailPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}retail_price'])!,
      spacialPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}spacial_price'])!,
      intialCost: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}intial_cost'])!,
      itemDiscount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}item_discount'])!,
      unitBarcode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unit_barcode'])!,
      newData: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}new_data'])!,
    );
  }

  @override
  $ItemUnitTableTable createAlias(String alias) {
    return $ItemUnitTableTable(attachedDatabase, alias);
  }
}

class ItemUnitTableCompanion extends UpdateCompanion<ItemUnitsModel> {
  final Value<int> id;
  final Value<int> itemId;
  final Value<int> itemUnitId;
  final Value<int> unitFactor;
  final Value<double> wholeSaleprice;
  final Value<double> retailPrice;
  final Value<double> spacialPrice;
  final Value<double> intialCost;
  final Value<double> itemDiscount;
  final Value<String> unitBarcode;
  final Value<bool> newData;
  final Value<int> rowid;
  const ItemUnitTableCompanion({
    this.id = const Value.absent(),
    this.itemId = const Value.absent(),
    this.itemUnitId = const Value.absent(),
    this.unitFactor = const Value.absent(),
    this.wholeSaleprice = const Value.absent(),
    this.retailPrice = const Value.absent(),
    this.spacialPrice = const Value.absent(),
    this.intialCost = const Value.absent(),
    this.itemDiscount = const Value.absent(),
    this.unitBarcode = const Value.absent(),
    this.newData = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ItemUnitTableCompanion.insert({
    required int id,
    required int itemId,
    required int itemUnitId,
    required int unitFactor,
    required double wholeSaleprice,
    required double retailPrice,
    required double spacialPrice,
    required double intialCost,
    required double itemDiscount,
    required String unitBarcode,
    required bool newData,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        itemId = Value(itemId),
        itemUnitId = Value(itemUnitId),
        unitFactor = Value(unitFactor),
        wholeSaleprice = Value(wholeSaleprice),
        retailPrice = Value(retailPrice),
        spacialPrice = Value(spacialPrice),
        intialCost = Value(intialCost),
        itemDiscount = Value(itemDiscount),
        unitBarcode = Value(unitBarcode),
        newData = Value(newData);
  static Insertable<ItemUnitsModel> custom({
    Expression<int>? id,
    Expression<int>? itemId,
    Expression<int>? itemUnitId,
    Expression<int>? unitFactor,
    Expression<double>? wholeSaleprice,
    Expression<double>? retailPrice,
    Expression<double>? spacialPrice,
    Expression<double>? intialCost,
    Expression<double>? itemDiscount,
    Expression<String>? unitBarcode,
    Expression<bool>? newData,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (itemId != null) 'item_id': itemId,
      if (itemUnitId != null) 'item_unit_id': itemUnitId,
      if (unitFactor != null) 'unit_factor': unitFactor,
      if (wholeSaleprice != null) 'whole_saleprice': wholeSaleprice,
      if (retailPrice != null) 'retail_price': retailPrice,
      if (spacialPrice != null) 'spacial_price': spacialPrice,
      if (intialCost != null) 'intial_cost': intialCost,
      if (itemDiscount != null) 'item_discount': itemDiscount,
      if (unitBarcode != null) 'unit_barcode': unitBarcode,
      if (newData != null) 'new_data': newData,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ItemUnitTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? itemId,
      Value<int>? itemUnitId,
      Value<int>? unitFactor,
      Value<double>? wholeSaleprice,
      Value<double>? retailPrice,
      Value<double>? spacialPrice,
      Value<double>? intialCost,
      Value<double>? itemDiscount,
      Value<String>? unitBarcode,
      Value<bool>? newData,
      Value<int>? rowid}) {
    return ItemUnitTableCompanion(
      id: id ?? this.id,
      itemId: itemId ?? this.itemId,
      itemUnitId: itemUnitId ?? this.itemUnitId,
      unitFactor: unitFactor ?? this.unitFactor,
      wholeSaleprice: wholeSaleprice ?? this.wholeSaleprice,
      retailPrice: retailPrice ?? this.retailPrice,
      spacialPrice: spacialPrice ?? this.spacialPrice,
      intialCost: intialCost ?? this.intialCost,
      itemDiscount: itemDiscount ?? this.itemDiscount,
      unitBarcode: unitBarcode ?? this.unitBarcode,
      newData: newData ?? this.newData,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (itemId.present) {
      map['item_id'] = Variable<int>(itemId.value);
    }
    if (itemUnitId.present) {
      map['item_unit_id'] = Variable<int>(itemUnitId.value);
    }
    if (unitFactor.present) {
      map['unit_factor'] = Variable<int>(unitFactor.value);
    }
    if (wholeSaleprice.present) {
      map['whole_saleprice'] = Variable<double>(wholeSaleprice.value);
    }
    if (retailPrice.present) {
      map['retail_price'] = Variable<double>(retailPrice.value);
    }
    if (spacialPrice.present) {
      map['spacial_price'] = Variable<double>(spacialPrice.value);
    }
    if (intialCost.present) {
      map['intial_cost'] = Variable<double>(intialCost.value);
    }
    if (itemDiscount.present) {
      map['item_discount'] = Variable<double>(itemDiscount.value);
    }
    if (unitBarcode.present) {
      map['unit_barcode'] = Variable<String>(unitBarcode.value);
    }
    if (newData.present) {
      map['new_data'] = Variable<bool>(newData.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemUnitTableCompanion(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('itemUnitId: $itemUnitId, ')
          ..write('unitFactor: $unitFactor, ')
          ..write('wholeSaleprice: $wholeSaleprice, ')
          ..write('retailPrice: $retailPrice, ')
          ..write('spacialPrice: $spacialPrice, ')
          ..write('intialCost: $intialCost, ')
          ..write('itemDiscount: $itemDiscount, ')
          ..write('unitBarcode: $unitBarcode, ')
          ..write('newData: $newData, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ItemTableTable extends ItemTable
    with TableInfo<$ItemTableTable, ItemModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ItemTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _itemGroupIdMeta =
      const VerificationMeta('itemGroupId');
  @override
  late final GeneratedColumn<int> itemGroupId = GeneratedColumn<int>(
      'item_group_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _itemCodeMeta =
      const VerificationMeta('itemCode');
  @override
  late final GeneratedColumn<int> itemCode = GeneratedColumn<int>(
      'item_code', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _enNameMeta = const VerificationMeta('enName');
  @override
  late final GeneratedColumn<String> enName = GeneratedColumn<String>(
      'en_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<int> type = GeneratedColumn<int>(
      'type', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _itemLimitMeta =
      const VerificationMeta('itemLimit');
  @override
  late final GeneratedColumn<int> itemLimit = GeneratedColumn<int>(
      'item_limit', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _itemImageMeta =
      const VerificationMeta('itemImage');
  @override
  late final GeneratedColumn<Uint8List> itemImage = GeneratedColumn<Uint8List>(
      'item_image', aliasedName, false,
      type: DriftSqlType.blob, requiredDuringInsert: true);
  static const VerificationMeta _isExpireMeta =
      const VerificationMeta('isExpire');
  @override
  late final GeneratedColumn<bool> isExpire = GeneratedColumn<bool>(
      'is_expire', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_expire" IN (0, 1))'));
  static const VerificationMeta _freeQuantityAllowMeta =
      const VerificationMeta('freeQuantityAllow');
  @override
  late final GeneratedColumn<bool> freeQuantityAllow = GeneratedColumn<bool>(
      'free_quantity_allow', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("free_quantity_allow" IN (0, 1))'));
  static const VerificationMeta _hasTaxMeta = const VerificationMeta('hasTax');
  @override
  late final GeneratedColumn<bool> hasTax = GeneratedColumn<bool>(
      'has_tax', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("has_tax" IN (0, 1))'));
  static const VerificationMeta _hasAlternatedMeta =
      const VerificationMeta('hasAlternated');
  @override
  late final GeneratedColumn<bool> hasAlternated = GeneratedColumn<bool>(
      'has_alternated', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("has_alternated" IN (0, 1))'));
  static const VerificationMeta _newDataMeta =
      const VerificationMeta('newData');
  @override
  late final GeneratedColumn<bool> newData = GeneratedColumn<bool>(
      'new_data', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("new_data" IN (0, 1))'));
  static const VerificationMeta _notifyBeforeMeta =
      const VerificationMeta('notifyBefore');
  @override
  late final GeneratedColumn<int> notifyBefore = GeneratedColumn<int>(
      'notify_before', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _taxRateMeta =
      const VerificationMeta('taxRate');
  @override
  late final GeneratedColumn<int> taxRate = GeneratedColumn<int>(
      'tax_rate', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _itemCompanyMeta =
      const VerificationMeta('itemCompany');
  @override
  late final GeneratedColumn<String> itemCompany = GeneratedColumn<String>(
      'item_company', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _orignalCountryMeta =
      const VerificationMeta('orignalCountry');
  @override
  late final GeneratedColumn<String> orignalCountry = GeneratedColumn<String>(
      'orignal_country', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _itemDescriptionMeta =
      const VerificationMeta('itemDescription');
  @override
  late final GeneratedColumn<String> itemDescription = GeneratedColumn<String>(
      'item_description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        itemGroupId,
        itemCode,
        name,
        enName,
        type,
        itemLimit,
        itemImage,
        isExpire,
        freeQuantityAllow,
        hasTax,
        hasAlternated,
        newData,
        notifyBefore,
        taxRate,
        itemCompany,
        orignalCountry,
        itemDescription,
        note
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'item_table';
  @override
  VerificationContext validateIntegrity(Insertable<ItemModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('item_group_id')) {
      context.handle(
          _itemGroupIdMeta,
          itemGroupId.isAcceptableOrUnknown(
              data['item_group_id']!, _itemGroupIdMeta));
    } else if (isInserting) {
      context.missing(_itemGroupIdMeta);
    }
    if (data.containsKey('item_code')) {
      context.handle(_itemCodeMeta,
          itemCode.isAcceptableOrUnknown(data['item_code']!, _itemCodeMeta));
    } else if (isInserting) {
      context.missing(_itemCodeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('en_name')) {
      context.handle(_enNameMeta,
          enName.isAcceptableOrUnknown(data['en_name']!, _enNameMeta));
    } else if (isInserting) {
      context.missing(_enNameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('item_limit')) {
      context.handle(_itemLimitMeta,
          itemLimit.isAcceptableOrUnknown(data['item_limit']!, _itemLimitMeta));
    } else if (isInserting) {
      context.missing(_itemLimitMeta);
    }
    if (data.containsKey('item_image')) {
      context.handle(_itemImageMeta,
          itemImage.isAcceptableOrUnknown(data['item_image']!, _itemImageMeta));
    } else if (isInserting) {
      context.missing(_itemImageMeta);
    }
    if (data.containsKey('is_expire')) {
      context.handle(_isExpireMeta,
          isExpire.isAcceptableOrUnknown(data['is_expire']!, _isExpireMeta));
    } else if (isInserting) {
      context.missing(_isExpireMeta);
    }
    if (data.containsKey('free_quantity_allow')) {
      context.handle(
          _freeQuantityAllowMeta,
          freeQuantityAllow.isAcceptableOrUnknown(
              data['free_quantity_allow']!, _freeQuantityAllowMeta));
    } else if (isInserting) {
      context.missing(_freeQuantityAllowMeta);
    }
    if (data.containsKey('has_tax')) {
      context.handle(_hasTaxMeta,
          hasTax.isAcceptableOrUnknown(data['has_tax']!, _hasTaxMeta));
    } else if (isInserting) {
      context.missing(_hasTaxMeta);
    }
    if (data.containsKey('has_alternated')) {
      context.handle(
          _hasAlternatedMeta,
          hasAlternated.isAcceptableOrUnknown(
              data['has_alternated']!, _hasAlternatedMeta));
    } else if (isInserting) {
      context.missing(_hasAlternatedMeta);
    }
    if (data.containsKey('new_data')) {
      context.handle(_newDataMeta,
          newData.isAcceptableOrUnknown(data['new_data']!, _newDataMeta));
    } else if (isInserting) {
      context.missing(_newDataMeta);
    }
    if (data.containsKey('notify_before')) {
      context.handle(
          _notifyBeforeMeta,
          notifyBefore.isAcceptableOrUnknown(
              data['notify_before']!, _notifyBeforeMeta));
    } else if (isInserting) {
      context.missing(_notifyBeforeMeta);
    }
    if (data.containsKey('tax_rate')) {
      context.handle(_taxRateMeta,
          taxRate.isAcceptableOrUnknown(data['tax_rate']!, _taxRateMeta));
    } else if (isInserting) {
      context.missing(_taxRateMeta);
    }
    if (data.containsKey('item_company')) {
      context.handle(
          _itemCompanyMeta,
          itemCompany.isAcceptableOrUnknown(
              data['item_company']!, _itemCompanyMeta));
    } else if (isInserting) {
      context.missing(_itemCompanyMeta);
    }
    if (data.containsKey('orignal_country')) {
      context.handle(
          _orignalCountryMeta,
          orignalCountry.isAcceptableOrUnknown(
              data['orignal_country']!, _orignalCountryMeta));
    } else if (isInserting) {
      context.missing(_orignalCountryMeta);
    }
    if (data.containsKey('item_description')) {
      context.handle(
          _itemDescriptionMeta,
          itemDescription.isAcceptableOrUnknown(
              data['item_description']!, _itemDescriptionMeta));
    } else if (isInserting) {
      context.missing(_itemDescriptionMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    } else if (isInserting) {
      context.missing(_noteMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ItemModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ItemModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      itemGroupId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}item_group_id'])!,
      itemCode: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}item_code'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      enName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}en_name'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!,
      itemLimit: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}item_limit'])!,
      itemImage: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}item_image'])!,
      isExpire: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_expire'])!,
      notifyBefore: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}notify_before'])!,
      freeQuantityAllow: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}free_quantity_allow'])!,
      hasTax: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}has_tax'])!,
      taxRate: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tax_rate'])!,
      itemCompany: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_company'])!,
      orignalCountry: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}orignal_country'])!,
      itemDescription: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}item_description'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note'])!,
      hasAlternated: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}has_alternated'])!,
      newData: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}new_data'])!,
    );
  }

  @override
  $ItemTableTable createAlias(String alias) {
    return $ItemTableTable(attachedDatabase, alias);
  }
}

class ItemTableCompanion extends UpdateCompanion<ItemModel> {
  final Value<int> id;
  final Value<int> itemGroupId;
  final Value<int> itemCode;
  final Value<String> name;
  final Value<String> enName;
  final Value<int> type;
  final Value<int> itemLimit;
  final Value<Uint8List> itemImage;
  final Value<bool> isExpire;
  final Value<bool> freeQuantityAllow;
  final Value<bool> hasTax;
  final Value<bool> hasAlternated;
  final Value<bool> newData;
  final Value<int> notifyBefore;
  final Value<int> taxRate;
  final Value<String> itemCompany;
  final Value<String> orignalCountry;
  final Value<String> itemDescription;
  final Value<String> note;
  const ItemTableCompanion({
    this.id = const Value.absent(),
    this.itemGroupId = const Value.absent(),
    this.itemCode = const Value.absent(),
    this.name = const Value.absent(),
    this.enName = const Value.absent(),
    this.type = const Value.absent(),
    this.itemLimit = const Value.absent(),
    this.itemImage = const Value.absent(),
    this.isExpire = const Value.absent(),
    this.freeQuantityAllow = const Value.absent(),
    this.hasTax = const Value.absent(),
    this.hasAlternated = const Value.absent(),
    this.newData = const Value.absent(),
    this.notifyBefore = const Value.absent(),
    this.taxRate = const Value.absent(),
    this.itemCompany = const Value.absent(),
    this.orignalCountry = const Value.absent(),
    this.itemDescription = const Value.absent(),
    this.note = const Value.absent(),
  });
  ItemTableCompanion.insert({
    this.id = const Value.absent(),
    required int itemGroupId,
    required int itemCode,
    required String name,
    required String enName,
    required int type,
    required int itemLimit,
    required Uint8List itemImage,
    required bool isExpire,
    required bool freeQuantityAllow,
    required bool hasTax,
    required bool hasAlternated,
    required bool newData,
    required int notifyBefore,
    required int taxRate,
    required String itemCompany,
    required String orignalCountry,
    required String itemDescription,
    required String note,
  })  : itemGroupId = Value(itemGroupId),
        itemCode = Value(itemCode),
        name = Value(name),
        enName = Value(enName),
        type = Value(type),
        itemLimit = Value(itemLimit),
        itemImage = Value(itemImage),
        isExpire = Value(isExpire),
        freeQuantityAllow = Value(freeQuantityAllow),
        hasTax = Value(hasTax),
        hasAlternated = Value(hasAlternated),
        newData = Value(newData),
        notifyBefore = Value(notifyBefore),
        taxRate = Value(taxRate),
        itemCompany = Value(itemCompany),
        orignalCountry = Value(orignalCountry),
        itemDescription = Value(itemDescription),
        note = Value(note);
  static Insertable<ItemModel> custom({
    Expression<int>? id,
    Expression<int>? itemGroupId,
    Expression<int>? itemCode,
    Expression<String>? name,
    Expression<String>? enName,
    Expression<int>? type,
    Expression<int>? itemLimit,
    Expression<Uint8List>? itemImage,
    Expression<bool>? isExpire,
    Expression<bool>? freeQuantityAllow,
    Expression<bool>? hasTax,
    Expression<bool>? hasAlternated,
    Expression<bool>? newData,
    Expression<int>? notifyBefore,
    Expression<int>? taxRate,
    Expression<String>? itemCompany,
    Expression<String>? orignalCountry,
    Expression<String>? itemDescription,
    Expression<String>? note,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (itemGroupId != null) 'item_group_id': itemGroupId,
      if (itemCode != null) 'item_code': itemCode,
      if (name != null) 'name': name,
      if (enName != null) 'en_name': enName,
      if (type != null) 'type': type,
      if (itemLimit != null) 'item_limit': itemLimit,
      if (itemImage != null) 'item_image': itemImage,
      if (isExpire != null) 'is_expire': isExpire,
      if (freeQuantityAllow != null) 'free_quantity_allow': freeQuantityAllow,
      if (hasTax != null) 'has_tax': hasTax,
      if (hasAlternated != null) 'has_alternated': hasAlternated,
      if (newData != null) 'new_data': newData,
      if (notifyBefore != null) 'notify_before': notifyBefore,
      if (taxRate != null) 'tax_rate': taxRate,
      if (itemCompany != null) 'item_company': itemCompany,
      if (orignalCountry != null) 'orignal_country': orignalCountry,
      if (itemDescription != null) 'item_description': itemDescription,
      if (note != null) 'note': note,
    });
  }

  ItemTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? itemGroupId,
      Value<int>? itemCode,
      Value<String>? name,
      Value<String>? enName,
      Value<int>? type,
      Value<int>? itemLimit,
      Value<Uint8List>? itemImage,
      Value<bool>? isExpire,
      Value<bool>? freeQuantityAllow,
      Value<bool>? hasTax,
      Value<bool>? hasAlternated,
      Value<bool>? newData,
      Value<int>? notifyBefore,
      Value<int>? taxRate,
      Value<String>? itemCompany,
      Value<String>? orignalCountry,
      Value<String>? itemDescription,
      Value<String>? note}) {
    return ItemTableCompanion(
      id: id ?? this.id,
      itemGroupId: itemGroupId ?? this.itemGroupId,
      itemCode: itemCode ?? this.itemCode,
      name: name ?? this.name,
      enName: enName ?? this.enName,
      type: type ?? this.type,
      itemLimit: itemLimit ?? this.itemLimit,
      itemImage: itemImage ?? this.itemImage,
      isExpire: isExpire ?? this.isExpire,
      freeQuantityAllow: freeQuantityAllow ?? this.freeQuantityAllow,
      hasTax: hasTax ?? this.hasTax,
      hasAlternated: hasAlternated ?? this.hasAlternated,
      newData: newData ?? this.newData,
      notifyBefore: notifyBefore ?? this.notifyBefore,
      taxRate: taxRate ?? this.taxRate,
      itemCompany: itemCompany ?? this.itemCompany,
      orignalCountry: orignalCountry ?? this.orignalCountry,
      itemDescription: itemDescription ?? this.itemDescription,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (itemGroupId.present) {
      map['item_group_id'] = Variable<int>(itemGroupId.value);
    }
    if (itemCode.present) {
      map['item_code'] = Variable<int>(itemCode.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (enName.present) {
      map['en_name'] = Variable<String>(enName.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(type.value);
    }
    if (itemLimit.present) {
      map['item_limit'] = Variable<int>(itemLimit.value);
    }
    if (itemImage.present) {
      map['item_image'] = Variable<Uint8List>(itemImage.value);
    }
    if (isExpire.present) {
      map['is_expire'] = Variable<bool>(isExpire.value);
    }
    if (freeQuantityAllow.present) {
      map['free_quantity_allow'] = Variable<bool>(freeQuantityAllow.value);
    }
    if (hasTax.present) {
      map['has_tax'] = Variable<bool>(hasTax.value);
    }
    if (hasAlternated.present) {
      map['has_alternated'] = Variable<bool>(hasAlternated.value);
    }
    if (newData.present) {
      map['new_data'] = Variable<bool>(newData.value);
    }
    if (notifyBefore.present) {
      map['notify_before'] = Variable<int>(notifyBefore.value);
    }
    if (taxRate.present) {
      map['tax_rate'] = Variable<int>(taxRate.value);
    }
    if (itemCompany.present) {
      map['item_company'] = Variable<String>(itemCompany.value);
    }
    if (orignalCountry.present) {
      map['orignal_country'] = Variable<String>(orignalCountry.value);
    }
    if (itemDescription.present) {
      map['item_description'] = Variable<String>(itemDescription.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemTableCompanion(')
          ..write('id: $id, ')
          ..write('itemGroupId: $itemGroupId, ')
          ..write('itemCode: $itemCode, ')
          ..write('name: $name, ')
          ..write('enName: $enName, ')
          ..write('type: $type, ')
          ..write('itemLimit: $itemLimit, ')
          ..write('itemImage: $itemImage, ')
          ..write('isExpire: $isExpire, ')
          ..write('freeQuantityAllow: $freeQuantityAllow, ')
          ..write('hasTax: $hasTax, ')
          ..write('hasAlternated: $hasAlternated, ')
          ..write('newData: $newData, ')
          ..write('notifyBefore: $notifyBefore, ')
          ..write('taxRate: $taxRate, ')
          ..write('itemCompany: $itemCompany, ')
          ..write('orignalCountry: $orignalCountry, ')
          ..write('itemDescription: $itemDescription, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

class $PaymentTableTable extends PaymentTable
    with TableInfo<$PaymentTableTable, PaymentModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PaymentTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _methodNameMeta =
      const VerificationMeta('methodName');
  @override
  late final GeneratedColumn<String> methodName = GeneratedColumn<String>(
      'method_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _methodNoteMeta =
      const VerificationMeta('methodNote');
  @override
  late final GeneratedColumn<String> methodNote = GeneratedColumn<String>(
      'method_note', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _newDataMeta =
      const VerificationMeta('newData');
  @override
  late final GeneratedColumn<bool> newData = GeneratedColumn<bool>(
      'new_data', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("new_data" IN (0, 1))'));
  static const VerificationMeta _isDefaultMeta =
      const VerificationMeta('isDefault');
  @override
  late final GeneratedColumn<bool> isDefault = GeneratedColumn<bool>(
      'is_default', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_default" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, userId, methodName, methodNote, newData, isDefault];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'payment_table';
  @override
  VerificationContext validateIntegrity(Insertable<PaymentModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('method_name')) {
      context.handle(
          _methodNameMeta,
          methodName.isAcceptableOrUnknown(
              data['method_name']!, _methodNameMeta));
    } else if (isInserting) {
      context.missing(_methodNameMeta);
    }
    if (data.containsKey('method_note')) {
      context.handle(
          _methodNoteMeta,
          methodNote.isAcceptableOrUnknown(
              data['method_note']!, _methodNoteMeta));
    } else if (isInserting) {
      context.missing(_methodNoteMeta);
    }
    if (data.containsKey('new_data')) {
      context.handle(_newDataMeta,
          newData.isAcceptableOrUnknown(data['new_data']!, _newDataMeta));
    } else if (isInserting) {
      context.missing(_newDataMeta);
    }
    if (data.containsKey('is_default')) {
      context.handle(_isDefaultMeta,
          isDefault.isAcceptableOrUnknown(data['is_default']!, _isDefaultMeta));
    } else if (isInserting) {
      context.missing(_isDefaultMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PaymentModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PaymentModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      methodName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}method_name'])!,
      newData: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}new_data'])!,
      isDefault: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_default'])!,
      methodNote: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}method_note'])!,
    );
  }

  @override
  $PaymentTableTable createAlias(String alias) {
    return $PaymentTableTable(attachedDatabase, alias);
  }
}

class PaymentTableCompanion extends UpdateCompanion<PaymentModel> {
  final Value<int> id;
  final Value<int> userId;
  final Value<String> methodName;
  final Value<String> methodNote;
  final Value<bool> newData;
  final Value<bool> isDefault;
  const PaymentTableCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.methodName = const Value.absent(),
    this.methodNote = const Value.absent(),
    this.newData = const Value.absent(),
    this.isDefault = const Value.absent(),
  });
  PaymentTableCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required String methodName,
    required String methodNote,
    required bool newData,
    required bool isDefault,
  })  : userId = Value(userId),
        methodName = Value(methodName),
        methodNote = Value(methodNote),
        newData = Value(newData),
        isDefault = Value(isDefault);
  static Insertable<PaymentModel> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<String>? methodName,
    Expression<String>? methodNote,
    Expression<bool>? newData,
    Expression<bool>? isDefault,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (methodName != null) 'method_name': methodName,
      if (methodNote != null) 'method_note': methodNote,
      if (newData != null) 'new_data': newData,
      if (isDefault != null) 'is_default': isDefault,
    });
  }

  PaymentTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? userId,
      Value<String>? methodName,
      Value<String>? methodNote,
      Value<bool>? newData,
      Value<bool>? isDefault}) {
    return PaymentTableCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      methodName: methodName ?? this.methodName,
      methodNote: methodNote ?? this.methodNote,
      newData: newData ?? this.newData,
      isDefault: isDefault ?? this.isDefault,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (methodName.present) {
      map['method_name'] = Variable<String>(methodName.value);
    }
    if (methodNote.present) {
      map['method_note'] = Variable<String>(methodNote.value);
    }
    if (newData.present) {
      map['new_data'] = Variable<bool>(newData.value);
    }
    if (isDefault.present) {
      map['is_default'] = Variable<bool>(isDefault.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PaymentTableCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('methodName: $methodName, ')
          ..write('methodNote: $methodNote, ')
          ..write('newData: $newData, ')
          ..write('isDefault: $isDefault')
          ..write(')'))
        .toString();
  }
}

class $SystemDocTableTable extends SystemDocTable
    with TableInfo<$SystemDocTableTable, SystemDocModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SystemDocTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _docTypeMeta =
      const VerificationMeta('docType');
  @override
  late final GeneratedColumn<int> docType = GeneratedColumn<int>(
      'doc_type', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _docNameMeta =
      const VerificationMeta('docName');
  @override
  late final GeneratedColumn<String> docName = GeneratedColumn<String>(
      'doc_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, docType, docName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'system_doc_table';
  @override
  VerificationContext validateIntegrity(Insertable<SystemDocModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('doc_type')) {
      context.handle(_docTypeMeta,
          docType.isAcceptableOrUnknown(data['doc_type']!, _docTypeMeta));
    } else if (isInserting) {
      context.missing(_docTypeMeta);
    }
    if (data.containsKey('doc_name')) {
      context.handle(_docNameMeta,
          docName.isAcceptableOrUnknown(data['doc_name']!, _docNameMeta));
    } else if (isInserting) {
      context.missing(_docNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SystemDocModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SystemDocModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      docName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}doc_name'])!,
      docType: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}doc_type'])!,
    );
  }

  @override
  $SystemDocTableTable createAlias(String alias) {
    return $SystemDocTableTable(attachedDatabase, alias);
  }
}

class SystemDocTableCompanion extends UpdateCompanion<SystemDocModel> {
  final Value<int> id;
  final Value<int> docType;
  final Value<String> docName;
  const SystemDocTableCompanion({
    this.id = const Value.absent(),
    this.docType = const Value.absent(),
    this.docName = const Value.absent(),
  });
  SystemDocTableCompanion.insert({
    this.id = const Value.absent(),
    required int docType,
    required String docName,
  })  : docType = Value(docType),
        docName = Value(docName);
  static Insertable<SystemDocModel> custom({
    Expression<int>? id,
    Expression<int>? docType,
    Expression<String>? docName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (docType != null) 'doc_type': docType,
      if (docName != null) 'doc_name': docName,
    });
  }

  SystemDocTableCompanion copyWith(
      {Value<int>? id, Value<int>? docType, Value<String>? docName}) {
    return SystemDocTableCompanion(
      id: id ?? this.id,
      docType: docType ?? this.docType,
      docName: docName ?? this.docName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (docType.present) {
      map['doc_type'] = Variable<int>(docType.value);
    }
    if (docName.present) {
      map['doc_name'] = Variable<String>(docName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SystemDocTableCompanion(')
          ..write('id: $id, ')
          ..write('docType: $docType, ')
          ..write('docName: $docName')
          ..write(')'))
        .toString();
  }
}

class $UserSettingTableTable extends UserSettingTable
    with TableInfo<$UserSettingTableTable, UserSettingModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserSettingTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _custParentMeta =
      const VerificationMeta('custParent');
  @override
  late final GeneratedColumn<int> custParent = GeneratedColumn<int>(
      'cust_parent', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _custGroupMeta =
      const VerificationMeta('custGroup');
  @override
  late final GeneratedColumn<int> custGroup = GeneratedColumn<int>(
      'cust_group', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _generateCodeMeta =
      const VerificationMeta('generateCode');
  @override
  late final GeneratedColumn<String> generateCode = GeneratedColumn<String>(
      'generate_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, custParent, custGroup, generateCode];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_setting_table';
  @override
  VerificationContext validateIntegrity(Insertable<UserSettingModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('cust_parent')) {
      context.handle(
          _custParentMeta,
          custParent.isAcceptableOrUnknown(
              data['cust_parent']!, _custParentMeta));
    } else if (isInserting) {
      context.missing(_custParentMeta);
    }
    if (data.containsKey('cust_group')) {
      context.handle(_custGroupMeta,
          custGroup.isAcceptableOrUnknown(data['cust_group']!, _custGroupMeta));
    } else if (isInserting) {
      context.missing(_custGroupMeta);
    }
    if (data.containsKey('generate_code')) {
      context.handle(
          _generateCodeMeta,
          generateCode.isAcceptableOrUnknown(
              data['generate_code']!, _generateCodeMeta));
    } else if (isInserting) {
      context.missing(_generateCodeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserSettingModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserSettingModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      custParent: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}cust_parent'])!,
      generateCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}generate_code'])!,
      custGroup: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}cust_group'])!,
    );
  }

  @override
  $UserSettingTableTable createAlias(String alias) {
    return $UserSettingTableTable(attachedDatabase, alias);
  }
}

class UserSettingTableCompanion extends UpdateCompanion<UserSettingModel> {
  final Value<int> id;
  final Value<int> custParent;
  final Value<int> custGroup;
  final Value<String> generateCode;
  const UserSettingTableCompanion({
    this.id = const Value.absent(),
    this.custParent = const Value.absent(),
    this.custGroup = const Value.absent(),
    this.generateCode = const Value.absent(),
  });
  UserSettingTableCompanion.insert({
    this.id = const Value.absent(),
    required int custParent,
    required int custGroup,
    required String generateCode,
  })  : custParent = Value(custParent),
        custGroup = Value(custGroup),
        generateCode = Value(generateCode);
  static Insertable<UserSettingModel> custom({
    Expression<int>? id,
    Expression<int>? custParent,
    Expression<int>? custGroup,
    Expression<String>? generateCode,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (custParent != null) 'cust_parent': custParent,
      if (custGroup != null) 'cust_group': custGroup,
      if (generateCode != null) 'generate_code': generateCode,
    });
  }

  UserSettingTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? custParent,
      Value<int>? custGroup,
      Value<String>? generateCode}) {
    return UserSettingTableCompanion(
      id: id ?? this.id,
      custParent: custParent ?? this.custParent,
      custGroup: custGroup ?? this.custGroup,
      generateCode: generateCode ?? this.generateCode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (custParent.present) {
      map['cust_parent'] = Variable<int>(custParent.value);
    }
    if (custGroup.present) {
      map['cust_group'] = Variable<int>(custGroup.value);
    }
    if (generateCode.present) {
      map['generate_code'] = Variable<String>(generateCode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserSettingTableCompanion(')
          ..write('id: $id, ')
          ..write('custParent: $custParent, ')
          ..write('custGroup: $custGroup, ')
          ..write('generateCode: $generateCode')
          ..write(')'))
        .toString();
  }
}

class $ItemAlterTableTable extends ItemAlterTable
    with TableInfo<$ItemAlterTableTable, ItemAlterModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ItemAlterTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<int> itemId = GeneratedColumn<int>(
      'item_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _itemAlterIdMeta =
      const VerificationMeta('itemAlterId');
  @override
  late final GeneratedColumn<int> itemAlterId = GeneratedColumn<int>(
      'item_alter_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _itemOrderMeta =
      const VerificationMeta('itemOrder');
  @override
  late final GeneratedColumn<int> itemOrder = GeneratedColumn<int>(
      'item_order', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, itemId, itemAlterId, itemOrder];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'item_alter_table';
  @override
  VerificationContext validateIntegrity(Insertable<ItemAlterModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('item_id')) {
      context.handle(_itemIdMeta,
          itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta));
    } else if (isInserting) {
      context.missing(_itemIdMeta);
    }
    if (data.containsKey('item_alter_id')) {
      context.handle(
          _itemAlterIdMeta,
          itemAlterId.isAcceptableOrUnknown(
              data['item_alter_id']!, _itemAlterIdMeta));
    } else if (isInserting) {
      context.missing(_itemAlterIdMeta);
    }
    if (data.containsKey('item_order')) {
      context.handle(_itemOrderMeta,
          itemOrder.isAcceptableOrUnknown(data['item_order']!, _itemOrderMeta));
    } else if (isInserting) {
      context.missing(_itemOrderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ItemAlterModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ItemAlterModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      itemId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}item_id'])!,
      itemAlterId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}item_alter_id'])!,
      itemOrder: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}item_order'])!,
    );
  }

  @override
  $ItemAlterTableTable createAlias(String alias) {
    return $ItemAlterTableTable(attachedDatabase, alias);
  }
}

class ItemAlterTableCompanion extends UpdateCompanion<ItemAlterModel> {
  final Value<int> id;
  final Value<int> itemId;
  final Value<int> itemAlterId;
  final Value<int> itemOrder;
  const ItemAlterTableCompanion({
    this.id = const Value.absent(),
    this.itemId = const Value.absent(),
    this.itemAlterId = const Value.absent(),
    this.itemOrder = const Value.absent(),
  });
  ItemAlterTableCompanion.insert({
    this.id = const Value.absent(),
    required int itemId,
    required int itemAlterId,
    required int itemOrder,
  })  : itemId = Value(itemId),
        itemAlterId = Value(itemAlterId),
        itemOrder = Value(itemOrder);
  static Insertable<ItemAlterModel> custom({
    Expression<int>? id,
    Expression<int>? itemId,
    Expression<int>? itemAlterId,
    Expression<int>? itemOrder,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (itemId != null) 'item_id': itemId,
      if (itemAlterId != null) 'item_alter_id': itemAlterId,
      if (itemOrder != null) 'item_order': itemOrder,
    });
  }

  ItemAlterTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? itemId,
      Value<int>? itemAlterId,
      Value<int>? itemOrder}) {
    return ItemAlterTableCompanion(
      id: id ?? this.id,
      itemId: itemId ?? this.itemId,
      itemAlterId: itemAlterId ?? this.itemAlterId,
      itemOrder: itemOrder ?? this.itemOrder,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (itemId.present) {
      map['item_id'] = Variable<int>(itemId.value);
    }
    if (itemAlterId.present) {
      map['item_alter_id'] = Variable<int>(itemAlterId.value);
    }
    if (itemOrder.present) {
      map['item_order'] = Variable<int>(itemOrder.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemAlterTableCompanion(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('itemAlterId: $itemAlterId, ')
          ..write('itemOrder: $itemOrder')
          ..write(')'))
        .toString();
  }
}

class $BarcodeTableTable extends BarcodeTable
    with TableInfo<$BarcodeTableTable, BarcodeModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BarcodeTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<int> itemId = GeneratedColumn<int>(
      'item_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _itemBarcodeMeta =
      const VerificationMeta('itemBarcode');
  @override
  late final GeneratedColumn<String> itemBarcode = GeneratedColumn<String>(
      'item_barcode', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, itemId, itemBarcode];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'barcode_table';
  @override
  VerificationContext validateIntegrity(Insertable<BarcodeModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('item_id')) {
      context.handle(_itemIdMeta,
          itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta));
    } else if (isInserting) {
      context.missing(_itemIdMeta);
    }
    if (data.containsKey('item_barcode')) {
      context.handle(
          _itemBarcodeMeta,
          itemBarcode.isAcceptableOrUnknown(
              data['item_barcode']!, _itemBarcodeMeta));
    } else if (isInserting) {
      context.missing(_itemBarcodeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BarcodeModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BarcodeModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      itemId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}item_id'])!,
      itemBarcode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_barcode'])!,
    );
  }

  @override
  $BarcodeTableTable createAlias(String alias) {
    return $BarcodeTableTable(attachedDatabase, alias);
  }
}

class BarcodeTableCompanion extends UpdateCompanion<BarcodeModel> {
  final Value<int> id;
  final Value<int> itemId;
  final Value<String> itemBarcode;
  const BarcodeTableCompanion({
    this.id = const Value.absent(),
    this.itemId = const Value.absent(),
    this.itemBarcode = const Value.absent(),
  });
  BarcodeTableCompanion.insert({
    this.id = const Value.absent(),
    required int itemId,
    required String itemBarcode,
  })  : itemId = Value(itemId),
        itemBarcode = Value(itemBarcode);
  static Insertable<BarcodeModel> custom({
    Expression<int>? id,
    Expression<int>? itemId,
    Expression<String>? itemBarcode,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (itemId != null) 'item_id': itemId,
      if (itemBarcode != null) 'item_barcode': itemBarcode,
    });
  }

  BarcodeTableCompanion copyWith(
      {Value<int>? id, Value<int>? itemId, Value<String>? itemBarcode}) {
    return BarcodeTableCompanion(
      id: id ?? this.id,
      itemId: itemId ?? this.itemId,
      itemBarcode: itemBarcode ?? this.itemBarcode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (itemId.present) {
      map['item_id'] = Variable<int>(itemId.value);
    }
    if (itemBarcode.present) {
      map['item_barcode'] = Variable<String>(itemBarcode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BarcodeTableCompanion(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('itemBarcode: $itemBarcode')
          ..write(')'))
        .toString();
  }
}

class $AccountTableTable extends AccountTable
    with TableInfo<$AccountTableTable, AccountModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccountTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _accNumberMeta =
      const VerificationMeta('accNumber');
  @override
  late final GeneratedColumn<int> accNumber = GeneratedColumn<int>(
      'acc_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _accNameMeta =
      const VerificationMeta('accName');
  @override
  late final GeneratedColumn<String> accName = GeneratedColumn<String>(
      'acc_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _accParentMeta =
      const VerificationMeta('accParent');
  @override
  late final GeneratedColumn<int> accParent = GeneratedColumn<int>(
      'acc_parent', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _accTypeMeta =
      const VerificationMeta('accType');
  @override
  late final GeneratedColumn<int> accType = GeneratedColumn<int>(
      'acc_type', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _accLevelMeta =
      const VerificationMeta('accLevel');
  @override
  late final GeneratedColumn<int> accLevel = GeneratedColumn<int>(
      'acc_level', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _accCatagoryMeta =
      const VerificationMeta('accCatagory');
  @override
  late final GeneratedColumn<int> accCatagory = GeneratedColumn<int>(
      'acc_catagory', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _accCatIdMeta =
      const VerificationMeta('accCatId');
  @override
  late final GeneratedColumn<int> accCatId = GeneratedColumn<int>(
      'acc_cat_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _accPhoneMeta =
      const VerificationMeta('accPhone');
  @override
  late final GeneratedColumn<String> accPhone = GeneratedColumn<String>(
      'acc_phone', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _accLimitMeta =
      const VerificationMeta('accLimit');
  @override
  late final GeneratedColumn<int> accLimit = GeneratedColumn<int>(
      'acc_limit', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _paymentTypeMeta =
      const VerificationMeta('paymentType');
  @override
  late final GeneratedColumn<int> paymentType = GeneratedColumn<int>(
      'payment_type', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _branchIdMeta =
      const VerificationMeta('branchId');
  @override
  late final GeneratedColumn<int> branchId = GeneratedColumn<int>(
      'branch_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _accStopedMeta =
      const VerificationMeta('accStoped');
  @override
  late final GeneratedColumn<bool> accStoped = GeneratedColumn<bool>(
      'acc_stoped', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("acc_stoped" IN (0, 1))'));
  static const VerificationMeta _newDataMeta =
      const VerificationMeta('newData');
  @override
  late final GeneratedColumn<bool> newData = GeneratedColumn<bool>(
      'new_data', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("new_data" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        accNumber,
        accName,
        accParent,
        accType,
        accLevel,
        note,
        accCatagory,
        accCatId,
        accPhone,
        address,
        email,
        accLimit,
        paymentType,
        branchId,
        accStoped,
        newData
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'account_table';
  @override
  VerificationContext validateIntegrity(Insertable<AccountModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('acc_number')) {
      context.handle(_accNumberMeta,
          accNumber.isAcceptableOrUnknown(data['acc_number']!, _accNumberMeta));
    } else if (isInserting) {
      context.missing(_accNumberMeta);
    }
    if (data.containsKey('acc_name')) {
      context.handle(_accNameMeta,
          accName.isAcceptableOrUnknown(data['acc_name']!, _accNameMeta));
    } else if (isInserting) {
      context.missing(_accNameMeta);
    }
    if (data.containsKey('acc_parent')) {
      context.handle(_accParentMeta,
          accParent.isAcceptableOrUnknown(data['acc_parent']!, _accParentMeta));
    } else if (isInserting) {
      context.missing(_accParentMeta);
    }
    if (data.containsKey('acc_type')) {
      context.handle(_accTypeMeta,
          accType.isAcceptableOrUnknown(data['acc_type']!, _accTypeMeta));
    } else if (isInserting) {
      context.missing(_accTypeMeta);
    }
    if (data.containsKey('acc_level')) {
      context.handle(_accLevelMeta,
          accLevel.isAcceptableOrUnknown(data['acc_level']!, _accLevelMeta));
    } else if (isInserting) {
      context.missing(_accLevelMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    } else if (isInserting) {
      context.missing(_noteMeta);
    }
    if (data.containsKey('acc_catagory')) {
      context.handle(
          _accCatagoryMeta,
          accCatagory.isAcceptableOrUnknown(
              data['acc_catagory']!, _accCatagoryMeta));
    } else if (isInserting) {
      context.missing(_accCatagoryMeta);
    }
    if (data.containsKey('acc_cat_id')) {
      context.handle(_accCatIdMeta,
          accCatId.isAcceptableOrUnknown(data['acc_cat_id']!, _accCatIdMeta));
    } else if (isInserting) {
      context.missing(_accCatIdMeta);
    }
    if (data.containsKey('acc_phone')) {
      context.handle(_accPhoneMeta,
          accPhone.isAcceptableOrUnknown(data['acc_phone']!, _accPhoneMeta));
    } else if (isInserting) {
      context.missing(_accPhoneMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('acc_limit')) {
      context.handle(_accLimitMeta,
          accLimit.isAcceptableOrUnknown(data['acc_limit']!, _accLimitMeta));
    } else if (isInserting) {
      context.missing(_accLimitMeta);
    }
    if (data.containsKey('payment_type')) {
      context.handle(
          _paymentTypeMeta,
          paymentType.isAcceptableOrUnknown(
              data['payment_type']!, _paymentTypeMeta));
    } else if (isInserting) {
      context.missing(_paymentTypeMeta);
    }
    if (data.containsKey('branch_id')) {
      context.handle(_branchIdMeta,
          branchId.isAcceptableOrUnknown(data['branch_id']!, _branchIdMeta));
    } else if (isInserting) {
      context.missing(_branchIdMeta);
    }
    if (data.containsKey('acc_stoped')) {
      context.handle(_accStopedMeta,
          accStoped.isAcceptableOrUnknown(data['acc_stoped']!, _accStopedMeta));
    } else if (isInserting) {
      context.missing(_accStopedMeta);
    }
    if (data.containsKey('new_data')) {
      context.handle(_newDataMeta,
          newData.isAcceptableOrUnknown(data['new_data']!, _newDataMeta));
    } else if (isInserting) {
      context.missing(_newDataMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AccountModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AccountModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      accNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}acc_number'])!,
      accName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}acc_name'])!,
      accParent: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}acc_parent'])!,
      accType: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}acc_type'])!,
      accLevel: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}acc_level'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note'])!,
      accCatagory: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}acc_catagory'])!,
      accCatId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}acc_cat_id'])!,
      accPhone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}acc_phone'])!,
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      accLimit: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}acc_limit'])!,
      paymentType: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}payment_type'])!,
      branchId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}branch_id'])!,
      accStoped: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}acc_stoped'])!,
      newData: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}new_data'])!,
    );
  }

  @override
  $AccountTableTable createAlias(String alias) {
    return $AccountTableTable(attachedDatabase, alias);
  }
}

class AccountTableCompanion extends UpdateCompanion<AccountModel> {
  final Value<int> id;
  final Value<int> accNumber;
  final Value<String> accName;
  final Value<int> accParent;
  final Value<int> accType;
  final Value<int> accLevel;
  final Value<String> note;
  final Value<int> accCatagory;
  final Value<int> accCatId;
  final Value<String> accPhone;
  final Value<String> address;
  final Value<String> email;
  final Value<int> accLimit;
  final Value<int> paymentType;
  final Value<int> branchId;
  final Value<bool> accStoped;
  final Value<bool> newData;
  const AccountTableCompanion({
    this.id = const Value.absent(),
    this.accNumber = const Value.absent(),
    this.accName = const Value.absent(),
    this.accParent = const Value.absent(),
    this.accType = const Value.absent(),
    this.accLevel = const Value.absent(),
    this.note = const Value.absent(),
    this.accCatagory = const Value.absent(),
    this.accCatId = const Value.absent(),
    this.accPhone = const Value.absent(),
    this.address = const Value.absent(),
    this.email = const Value.absent(),
    this.accLimit = const Value.absent(),
    this.paymentType = const Value.absent(),
    this.branchId = const Value.absent(),
    this.accStoped = const Value.absent(),
    this.newData = const Value.absent(),
  });
  AccountTableCompanion.insert({
    this.id = const Value.absent(),
    required int accNumber,
    required String accName,
    required int accParent,
    required int accType,
    required int accLevel,
    required String note,
    required int accCatagory,
    required int accCatId,
    required String accPhone,
    required String address,
    required String email,
    required int accLimit,
    required int paymentType,
    required int branchId,
    required bool accStoped,
    required bool newData,
  })  : accNumber = Value(accNumber),
        accName = Value(accName),
        accParent = Value(accParent),
        accType = Value(accType),
        accLevel = Value(accLevel),
        note = Value(note),
        accCatagory = Value(accCatagory),
        accCatId = Value(accCatId),
        accPhone = Value(accPhone),
        address = Value(address),
        email = Value(email),
        accLimit = Value(accLimit),
        paymentType = Value(paymentType),
        branchId = Value(branchId),
        accStoped = Value(accStoped),
        newData = Value(newData);
  static Insertable<AccountModel> custom({
    Expression<int>? id,
    Expression<int>? accNumber,
    Expression<String>? accName,
    Expression<int>? accParent,
    Expression<int>? accType,
    Expression<int>? accLevel,
    Expression<String>? note,
    Expression<int>? accCatagory,
    Expression<int>? accCatId,
    Expression<String>? accPhone,
    Expression<String>? address,
    Expression<String>? email,
    Expression<int>? accLimit,
    Expression<int>? paymentType,
    Expression<int>? branchId,
    Expression<bool>? accStoped,
    Expression<bool>? newData,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (accNumber != null) 'acc_number': accNumber,
      if (accName != null) 'acc_name': accName,
      if (accParent != null) 'acc_parent': accParent,
      if (accType != null) 'acc_type': accType,
      if (accLevel != null) 'acc_level': accLevel,
      if (note != null) 'note': note,
      if (accCatagory != null) 'acc_catagory': accCatagory,
      if (accCatId != null) 'acc_cat_id': accCatId,
      if (accPhone != null) 'acc_phone': accPhone,
      if (address != null) 'address': address,
      if (email != null) 'email': email,
      if (accLimit != null) 'acc_limit': accLimit,
      if (paymentType != null) 'payment_type': paymentType,
      if (branchId != null) 'branch_id': branchId,
      if (accStoped != null) 'acc_stoped': accStoped,
      if (newData != null) 'new_data': newData,
    });
  }

  AccountTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? accNumber,
      Value<String>? accName,
      Value<int>? accParent,
      Value<int>? accType,
      Value<int>? accLevel,
      Value<String>? note,
      Value<int>? accCatagory,
      Value<int>? accCatId,
      Value<String>? accPhone,
      Value<String>? address,
      Value<String>? email,
      Value<int>? accLimit,
      Value<int>? paymentType,
      Value<int>? branchId,
      Value<bool>? accStoped,
      Value<bool>? newData}) {
    return AccountTableCompanion(
      id: id ?? this.id,
      accNumber: accNumber ?? this.accNumber,
      accName: accName ?? this.accName,
      accParent: accParent ?? this.accParent,
      accType: accType ?? this.accType,
      accLevel: accLevel ?? this.accLevel,
      note: note ?? this.note,
      accCatagory: accCatagory ?? this.accCatagory,
      accCatId: accCatId ?? this.accCatId,
      accPhone: accPhone ?? this.accPhone,
      address: address ?? this.address,
      email: email ?? this.email,
      accLimit: accLimit ?? this.accLimit,
      paymentType: paymentType ?? this.paymentType,
      branchId: branchId ?? this.branchId,
      accStoped: accStoped ?? this.accStoped,
      newData: newData ?? this.newData,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (accNumber.present) {
      map['acc_number'] = Variable<int>(accNumber.value);
    }
    if (accName.present) {
      map['acc_name'] = Variable<String>(accName.value);
    }
    if (accParent.present) {
      map['acc_parent'] = Variable<int>(accParent.value);
    }
    if (accType.present) {
      map['acc_type'] = Variable<int>(accType.value);
    }
    if (accLevel.present) {
      map['acc_level'] = Variable<int>(accLevel.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (accCatagory.present) {
      map['acc_catagory'] = Variable<int>(accCatagory.value);
    }
    if (accCatId.present) {
      map['acc_cat_id'] = Variable<int>(accCatId.value);
    }
    if (accPhone.present) {
      map['acc_phone'] = Variable<String>(accPhone.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (accLimit.present) {
      map['acc_limit'] = Variable<int>(accLimit.value);
    }
    if (paymentType.present) {
      map['payment_type'] = Variable<int>(paymentType.value);
    }
    if (branchId.present) {
      map['branch_id'] = Variable<int>(branchId.value);
    }
    if (accStoped.present) {
      map['acc_stoped'] = Variable<bool>(accStoped.value);
    }
    if (newData.present) {
      map['new_data'] = Variable<bool>(newData.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountTableCompanion(')
          ..write('id: $id, ')
          ..write('accNumber: $accNumber, ')
          ..write('accName: $accName, ')
          ..write('accParent: $accParent, ')
          ..write('accType: $accType, ')
          ..write('accLevel: $accLevel, ')
          ..write('note: $note, ')
          ..write('accCatagory: $accCatagory, ')
          ..write('accCatId: $accCatId, ')
          ..write('accPhone: $accPhone, ')
          ..write('address: $address, ')
          ..write('email: $email, ')
          ..write('accLimit: $accLimit, ')
          ..write('paymentType: $paymentType, ')
          ..write('branchId: $branchId, ')
          ..write('accStoped: $accStoped, ')
          ..write('newData: $newData')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UserTableTable userTable = $UserTableTable(this);
  late final $CompanyTableTable companyTable = $CompanyTableTable(this);
  late final $BranchTableTable branchTable = $BranchTableTable(this);
  late final $CurencyTableTable curencyTable = $CurencyTableTable(this);
  late final $UserStoreTableTable userStoreTable = $UserStoreTableTable(this);
  late final $UnitTableTable unitTable = $UnitTableTable(this);
  late final $ItemGroupTableTable itemGroupTable = $ItemGroupTableTable(this);
  late final $ItemUnitTableTable itemUnitTable = $ItemUnitTableTable(this);
  late final $ItemTableTable itemTable = $ItemTableTable(this);
  late final $PaymentTableTable paymentTable = $PaymentTableTable(this);
  late final $SystemDocTableTable systemDocTable = $SystemDocTableTable(this);
  late final $UserSettingTableTable userSettingTable =
      $UserSettingTableTable(this);
  late final $ItemAlterTableTable itemAlterTable = $ItemAlterTableTable(this);
  late final $BarcodeTableTable barcodeTable = $BarcodeTableTable(this);
  late final $AccountTableTable accountTable = $AccountTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        userTable,
        companyTable,
        branchTable,
        curencyTable,
        userStoreTable,
        unitTable,
        itemGroupTable,
        itemUnitTable,
        itemTable,
        paymentTable,
        systemDocTable,
        userSettingTable,
        itemAlterTable,
        barcodeTable,
        accountTable
      ];
}

typedef $$UserTableTableCreateCompanionBuilder = UserTableCompanion Function({
  Value<int> id,
  required String userName,
  required String password,
  required int userAcctype,
  required int branchId,
  required int groupId,
  required String note,
  required Uint8List image,
});
typedef $$UserTableTableUpdateCompanionBuilder = UserTableCompanion Function({
  Value<int> id,
  Value<String> userName,
  Value<String> password,
  Value<int> userAcctype,
  Value<int> branchId,
  Value<int> groupId,
  Value<String> note,
  Value<Uint8List> image,
});

class $$UserTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UserTableTable,
    UserModel,
    $$UserTableTableFilterComposer,
    $$UserTableTableOrderingComposer,
    $$UserTableTableCreateCompanionBuilder,
    $$UserTableTableUpdateCompanionBuilder> {
  $$UserTableTableTableManager(_$AppDatabase db, $UserTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$UserTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$UserTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> userName = const Value.absent(),
            Value<String> password = const Value.absent(),
            Value<int> userAcctype = const Value.absent(),
            Value<int> branchId = const Value.absent(),
            Value<int> groupId = const Value.absent(),
            Value<String> note = const Value.absent(),
            Value<Uint8List> image = const Value.absent(),
          }) =>
              UserTableCompanion(
            id: id,
            userName: userName,
            password: password,
            userAcctype: userAcctype,
            branchId: branchId,
            groupId: groupId,
            note: note,
            image: image,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String userName,
            required String password,
            required int userAcctype,
            required int branchId,
            required int groupId,
            required String note,
            required Uint8List image,
          }) =>
              UserTableCompanion.insert(
            id: id,
            userName: userName,
            password: password,
            userAcctype: userAcctype,
            branchId: branchId,
            groupId: groupId,
            note: note,
            image: image,
          ),
        ));
}

class $$UserTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $UserTableTable> {
  $$UserTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get userName => $state.composableBuilder(
      column: $state.table.userName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get password => $state.composableBuilder(
      column: $state.table.password,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get userAcctype => $state.composableBuilder(
      column: $state.table.userAcctype,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get branchId => $state.composableBuilder(
      column: $state.table.branchId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get groupId => $state.composableBuilder(
      column: $state.table.groupId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get note => $state.composableBuilder(
      column: $state.table.note,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<Uint8List> get image => $state.composableBuilder(
      column: $state.table.image,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$UserTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $UserTableTable> {
  $$UserTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get userName => $state.composableBuilder(
      column: $state.table.userName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get password => $state.composableBuilder(
      column: $state.table.password,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get userAcctype => $state.composableBuilder(
      column: $state.table.userAcctype,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get branchId => $state.composableBuilder(
      column: $state.table.branchId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get groupId => $state.composableBuilder(
      column: $state.table.groupId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get note => $state.composableBuilder(
      column: $state.table.note,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<Uint8List> get image => $state.composableBuilder(
      column: $state.table.image,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$CompanyTableTableCreateCompanionBuilder = CompanyTableCompanion
    Function({
  Value<int> id,
  required String name,
  required String enName,
  required String shortName,
  required String enShortName,
  required String address,
  required String website,
  required String note,
  required Uint8List logo,
});
typedef $$CompanyTableTableUpdateCompanionBuilder = CompanyTableCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<String> enName,
  Value<String> shortName,
  Value<String> enShortName,
  Value<String> address,
  Value<String> website,
  Value<String> note,
  Value<Uint8List> logo,
});

class $$CompanyTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CompanyTableTable,
    CompanyModel,
    $$CompanyTableTableFilterComposer,
    $$CompanyTableTableOrderingComposer,
    $$CompanyTableTableCreateCompanionBuilder,
    $$CompanyTableTableUpdateCompanionBuilder> {
  $$CompanyTableTableTableManager(_$AppDatabase db, $CompanyTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$CompanyTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$CompanyTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> enName = const Value.absent(),
            Value<String> shortName = const Value.absent(),
            Value<String> enShortName = const Value.absent(),
            Value<String> address = const Value.absent(),
            Value<String> website = const Value.absent(),
            Value<String> note = const Value.absent(),
            Value<Uint8List> logo = const Value.absent(),
          }) =>
              CompanyTableCompanion(
            id: id,
            name: name,
            enName: enName,
            shortName: shortName,
            enShortName: enShortName,
            address: address,
            website: website,
            note: note,
            logo: logo,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String enName,
            required String shortName,
            required String enShortName,
            required String address,
            required String website,
            required String note,
            required Uint8List logo,
          }) =>
              CompanyTableCompanion.insert(
            id: id,
            name: name,
            enName: enName,
            shortName: shortName,
            enShortName: enShortName,
            address: address,
            website: website,
            note: note,
            logo: logo,
          ),
        ));
}

class $$CompanyTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $CompanyTableTable> {
  $$CompanyTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get enName => $state.composableBuilder(
      column: $state.table.enName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get shortName => $state.composableBuilder(
      column: $state.table.shortName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get enShortName => $state.composableBuilder(
      column: $state.table.enShortName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get address => $state.composableBuilder(
      column: $state.table.address,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get website => $state.composableBuilder(
      column: $state.table.website,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get note => $state.composableBuilder(
      column: $state.table.note,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<Uint8List> get logo => $state.composableBuilder(
      column: $state.table.logo,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$CompanyTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $CompanyTableTable> {
  $$CompanyTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get enName => $state.composableBuilder(
      column: $state.table.enName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get shortName => $state.composableBuilder(
      column: $state.table.shortName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get enShortName => $state.composableBuilder(
      column: $state.table.enShortName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get address => $state.composableBuilder(
      column: $state.table.address,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get website => $state.composableBuilder(
      column: $state.table.website,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get note => $state.composableBuilder(
      column: $state.table.note,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<Uint8List> get logo => $state.composableBuilder(
      column: $state.table.logo,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$BranchTableTableCreateCompanionBuilder = BranchTableCompanion
    Function({
  Value<int> id,
  required int companyId,
  required String name,
  required String address,
  required String phone,
  required String email,
  required String arReportHeader,
  required String enReportHeader,
  required Uint8List logo,
  required String note,
});
typedef $$BranchTableTableUpdateCompanionBuilder = BranchTableCompanion
    Function({
  Value<int> id,
  Value<int> companyId,
  Value<String> name,
  Value<String> address,
  Value<String> phone,
  Value<String> email,
  Value<String> arReportHeader,
  Value<String> enReportHeader,
  Value<Uint8List> logo,
  Value<String> note,
});

class $$BranchTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BranchTableTable,
    BranchModel,
    $$BranchTableTableFilterComposer,
    $$BranchTableTableOrderingComposer,
    $$BranchTableTableCreateCompanionBuilder,
    $$BranchTableTableUpdateCompanionBuilder> {
  $$BranchTableTableTableManager(_$AppDatabase db, $BranchTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$BranchTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$BranchTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> companyId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> address = const Value.absent(),
            Value<String> phone = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String> arReportHeader = const Value.absent(),
            Value<String> enReportHeader = const Value.absent(),
            Value<Uint8List> logo = const Value.absent(),
            Value<String> note = const Value.absent(),
          }) =>
              BranchTableCompanion(
            id: id,
            companyId: companyId,
            name: name,
            address: address,
            phone: phone,
            email: email,
            arReportHeader: arReportHeader,
            enReportHeader: enReportHeader,
            logo: logo,
            note: note,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int companyId,
            required String name,
            required String address,
            required String phone,
            required String email,
            required String arReportHeader,
            required String enReportHeader,
            required Uint8List logo,
            required String note,
          }) =>
              BranchTableCompanion.insert(
            id: id,
            companyId: companyId,
            name: name,
            address: address,
            phone: phone,
            email: email,
            arReportHeader: arReportHeader,
            enReportHeader: enReportHeader,
            logo: logo,
            note: note,
          ),
        ));
}

class $$BranchTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $BranchTableTable> {
  $$BranchTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get companyId => $state.composableBuilder(
      column: $state.table.companyId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get address => $state.composableBuilder(
      column: $state.table.address,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get phone => $state.composableBuilder(
      column: $state.table.phone,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get email => $state.composableBuilder(
      column: $state.table.email,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get arReportHeader => $state.composableBuilder(
      column: $state.table.arReportHeader,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get enReportHeader => $state.composableBuilder(
      column: $state.table.enReportHeader,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<Uint8List> get logo => $state.composableBuilder(
      column: $state.table.logo,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get note => $state.composableBuilder(
      column: $state.table.note,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$BranchTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $BranchTableTable> {
  $$BranchTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get companyId => $state.composableBuilder(
      column: $state.table.companyId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get address => $state.composableBuilder(
      column: $state.table.address,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get phone => $state.composableBuilder(
      column: $state.table.phone,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get email => $state.composableBuilder(
      column: $state.table.email,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get arReportHeader => $state.composableBuilder(
      column: $state.table.arReportHeader,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get enReportHeader => $state.composableBuilder(
      column: $state.table.enReportHeader,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<Uint8List> get logo => $state.composableBuilder(
      column: $state.table.logo,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get note => $state.composableBuilder(
      column: $state.table.note,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$CurencyTableTableCreateCompanionBuilder = CurencyTableCompanion
    Function({
  Value<int> id,
  required String name,
  required String symbol,
  required String subName,
  required double value,
  required double equivelant,
  required bool localCurrency,
  required bool storeCurrency,
  required double maxValue,
  required double minValue,
  required String note,
  required bool newData,
});
typedef $$CurencyTableTableUpdateCompanionBuilder = CurencyTableCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<String> symbol,
  Value<String> subName,
  Value<double> value,
  Value<double> equivelant,
  Value<bool> localCurrency,
  Value<bool> storeCurrency,
  Value<double> maxValue,
  Value<double> minValue,
  Value<String> note,
  Value<bool> newData,
});

class $$CurencyTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CurencyTableTable,
    CurencyModel,
    $$CurencyTableTableFilterComposer,
    $$CurencyTableTableOrderingComposer,
    $$CurencyTableTableCreateCompanionBuilder,
    $$CurencyTableTableUpdateCompanionBuilder> {
  $$CurencyTableTableTableManager(_$AppDatabase db, $CurencyTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$CurencyTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$CurencyTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> symbol = const Value.absent(),
            Value<String> subName = const Value.absent(),
            Value<double> value = const Value.absent(),
            Value<double> equivelant = const Value.absent(),
            Value<bool> localCurrency = const Value.absent(),
            Value<bool> storeCurrency = const Value.absent(),
            Value<double> maxValue = const Value.absent(),
            Value<double> minValue = const Value.absent(),
            Value<String> note = const Value.absent(),
            Value<bool> newData = const Value.absent(),
          }) =>
              CurencyTableCompanion(
            id: id,
            name: name,
            symbol: symbol,
            subName: subName,
            value: value,
            equivelant: equivelant,
            localCurrency: localCurrency,
            storeCurrency: storeCurrency,
            maxValue: maxValue,
            minValue: minValue,
            note: note,
            newData: newData,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String symbol,
            required String subName,
            required double value,
            required double equivelant,
            required bool localCurrency,
            required bool storeCurrency,
            required double maxValue,
            required double minValue,
            required String note,
            required bool newData,
          }) =>
              CurencyTableCompanion.insert(
            id: id,
            name: name,
            symbol: symbol,
            subName: subName,
            value: value,
            equivelant: equivelant,
            localCurrency: localCurrency,
            storeCurrency: storeCurrency,
            maxValue: maxValue,
            minValue: minValue,
            note: note,
            newData: newData,
          ),
        ));
}

class $$CurencyTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $CurencyTableTable> {
  $$CurencyTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get symbol => $state.composableBuilder(
      column: $state.table.symbol,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get subName => $state.composableBuilder(
      column: $state.table.subName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get value => $state.composableBuilder(
      column: $state.table.value,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get equivelant => $state.composableBuilder(
      column: $state.table.equivelant,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get localCurrency => $state.composableBuilder(
      column: $state.table.localCurrency,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get storeCurrency => $state.composableBuilder(
      column: $state.table.storeCurrency,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get maxValue => $state.composableBuilder(
      column: $state.table.maxValue,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get minValue => $state.composableBuilder(
      column: $state.table.minValue,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get note => $state.composableBuilder(
      column: $state.table.note,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get newData => $state.composableBuilder(
      column: $state.table.newData,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$CurencyTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $CurencyTableTable> {
  $$CurencyTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get symbol => $state.composableBuilder(
      column: $state.table.symbol,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get subName => $state.composableBuilder(
      column: $state.table.subName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get value => $state.composableBuilder(
      column: $state.table.value,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get equivelant => $state.composableBuilder(
      column: $state.table.equivelant,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get localCurrency => $state.composableBuilder(
      column: $state.table.localCurrency,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get storeCurrency => $state.composableBuilder(
      column: $state.table.storeCurrency,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get maxValue => $state.composableBuilder(
      column: $state.table.maxValue,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get minValue => $state.composableBuilder(
      column: $state.table.minValue,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get note => $state.composableBuilder(
      column: $state.table.note,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get newData => $state.composableBuilder(
      column: $state.table.newData,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$UserStoreTableTableCreateCompanionBuilder = UserStoreTableCompanion
    Function({
  Value<int> id,
  required String name,
  required int accountNumber,
  required int branchId,
  required String storeManager,
  required String managerPhone,
  required String note,
});
typedef $$UserStoreTableTableUpdateCompanionBuilder = UserStoreTableCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<int> accountNumber,
  Value<int> branchId,
  Value<String> storeManager,
  Value<String> managerPhone,
  Value<String> note,
});

class $$UserStoreTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UserStoreTableTable,
    UserStoreModel,
    $$UserStoreTableTableFilterComposer,
    $$UserStoreTableTableOrderingComposer,
    $$UserStoreTableTableCreateCompanionBuilder,
    $$UserStoreTableTableUpdateCompanionBuilder> {
  $$UserStoreTableTableTableManager(
      _$AppDatabase db, $UserStoreTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$UserStoreTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$UserStoreTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> accountNumber = const Value.absent(),
            Value<int> branchId = const Value.absent(),
            Value<String> storeManager = const Value.absent(),
            Value<String> managerPhone = const Value.absent(),
            Value<String> note = const Value.absent(),
          }) =>
              UserStoreTableCompanion(
            id: id,
            name: name,
            accountNumber: accountNumber,
            branchId: branchId,
            storeManager: storeManager,
            managerPhone: managerPhone,
            note: note,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required int accountNumber,
            required int branchId,
            required String storeManager,
            required String managerPhone,
            required String note,
          }) =>
              UserStoreTableCompanion.insert(
            id: id,
            name: name,
            accountNumber: accountNumber,
            branchId: branchId,
            storeManager: storeManager,
            managerPhone: managerPhone,
            note: note,
          ),
        ));
}

class $$UserStoreTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $UserStoreTableTable> {
  $$UserStoreTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get accountNumber => $state.composableBuilder(
      column: $state.table.accountNumber,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get branchId => $state.composableBuilder(
      column: $state.table.branchId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get storeManager => $state.composableBuilder(
      column: $state.table.storeManager,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get managerPhone => $state.composableBuilder(
      column: $state.table.managerPhone,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get note => $state.composableBuilder(
      column: $state.table.note,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$UserStoreTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $UserStoreTableTable> {
  $$UserStoreTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get accountNumber => $state.composableBuilder(
      column: $state.table.accountNumber,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get branchId => $state.composableBuilder(
      column: $state.table.branchId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get storeManager => $state.composableBuilder(
      column: $state.table.storeManager,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get managerPhone => $state.composableBuilder(
      column: $state.table.managerPhone,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get note => $state.composableBuilder(
      column: $state.table.note,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$UnitTableTableCreateCompanionBuilder = UnitTableCompanion Function({
  Value<int> id,
  required String name,
  required String note,
  required bool newData,
});
typedef $$UnitTableTableUpdateCompanionBuilder = UnitTableCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> note,
  Value<bool> newData,
});

class $$UnitTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UnitTableTable,
    UnitModel,
    $$UnitTableTableFilterComposer,
    $$UnitTableTableOrderingComposer,
    $$UnitTableTableCreateCompanionBuilder,
    $$UnitTableTableUpdateCompanionBuilder> {
  $$UnitTableTableTableManager(_$AppDatabase db, $UnitTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$UnitTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$UnitTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> note = const Value.absent(),
            Value<bool> newData = const Value.absent(),
          }) =>
              UnitTableCompanion(
            id: id,
            name: name,
            note: note,
            newData: newData,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String note,
            required bool newData,
          }) =>
              UnitTableCompanion.insert(
            id: id,
            name: name,
            note: note,
            newData: newData,
          ),
        ));
}

class $$UnitTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $UnitTableTable> {
  $$UnitTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get note => $state.composableBuilder(
      column: $state.table.note,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get newData => $state.composableBuilder(
      column: $state.table.newData,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$UnitTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $UnitTableTable> {
  $$UnitTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get note => $state.composableBuilder(
      column: $state.table.note,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get newData => $state.composableBuilder(
      column: $state.table.newData,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$ItemGroupTableTableCreateCompanionBuilder = ItemGroupTableCompanion
    Function({
  Value<int> id,
  required int code,
  required int type,
  required int parent,
  required String name,
  required String note,
  required bool newData,
});
typedef $$ItemGroupTableTableUpdateCompanionBuilder = ItemGroupTableCompanion
    Function({
  Value<int> id,
  Value<int> code,
  Value<int> type,
  Value<int> parent,
  Value<String> name,
  Value<String> note,
  Value<bool> newData,
});

class $$ItemGroupTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ItemGroupTableTable,
    ItemGroupModel,
    $$ItemGroupTableTableFilterComposer,
    $$ItemGroupTableTableOrderingComposer,
    $$ItemGroupTableTableCreateCompanionBuilder,
    $$ItemGroupTableTableUpdateCompanionBuilder> {
  $$ItemGroupTableTableTableManager(
      _$AppDatabase db, $ItemGroupTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ItemGroupTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ItemGroupTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> code = const Value.absent(),
            Value<int> type = const Value.absent(),
            Value<int> parent = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> note = const Value.absent(),
            Value<bool> newData = const Value.absent(),
          }) =>
              ItemGroupTableCompanion(
            id: id,
            code: code,
            type: type,
            parent: parent,
            name: name,
            note: note,
            newData: newData,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int code,
            required int type,
            required int parent,
            required String name,
            required String note,
            required bool newData,
          }) =>
              ItemGroupTableCompanion.insert(
            id: id,
            code: code,
            type: type,
            parent: parent,
            name: name,
            note: note,
            newData: newData,
          ),
        ));
}

class $$ItemGroupTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ItemGroupTableTable> {
  $$ItemGroupTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get code => $state.composableBuilder(
      column: $state.table.code,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get parent => $state.composableBuilder(
      column: $state.table.parent,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get note => $state.composableBuilder(
      column: $state.table.note,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get newData => $state.composableBuilder(
      column: $state.table.newData,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ItemGroupTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ItemGroupTableTable> {
  $$ItemGroupTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get code => $state.composableBuilder(
      column: $state.table.code,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get parent => $state.composableBuilder(
      column: $state.table.parent,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get note => $state.composableBuilder(
      column: $state.table.note,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get newData => $state.composableBuilder(
      column: $state.table.newData,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$ItemUnitTableTableCreateCompanionBuilder = ItemUnitTableCompanion
    Function({
  required int id,
  required int itemId,
  required int itemUnitId,
  required int unitFactor,
  required double wholeSaleprice,
  required double retailPrice,
  required double spacialPrice,
  required double intialCost,
  required double itemDiscount,
  required String unitBarcode,
  required bool newData,
  Value<int> rowid,
});
typedef $$ItemUnitTableTableUpdateCompanionBuilder = ItemUnitTableCompanion
    Function({
  Value<int> id,
  Value<int> itemId,
  Value<int> itemUnitId,
  Value<int> unitFactor,
  Value<double> wholeSaleprice,
  Value<double> retailPrice,
  Value<double> spacialPrice,
  Value<double> intialCost,
  Value<double> itemDiscount,
  Value<String> unitBarcode,
  Value<bool> newData,
  Value<int> rowid,
});

class $$ItemUnitTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ItemUnitTableTable,
    ItemUnitsModel,
    $$ItemUnitTableTableFilterComposer,
    $$ItemUnitTableTableOrderingComposer,
    $$ItemUnitTableTableCreateCompanionBuilder,
    $$ItemUnitTableTableUpdateCompanionBuilder> {
  $$ItemUnitTableTableTableManager(_$AppDatabase db, $ItemUnitTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ItemUnitTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ItemUnitTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> itemId = const Value.absent(),
            Value<int> itemUnitId = const Value.absent(),
            Value<int> unitFactor = const Value.absent(),
            Value<double> wholeSaleprice = const Value.absent(),
            Value<double> retailPrice = const Value.absent(),
            Value<double> spacialPrice = const Value.absent(),
            Value<double> intialCost = const Value.absent(),
            Value<double> itemDiscount = const Value.absent(),
            Value<String> unitBarcode = const Value.absent(),
            Value<bool> newData = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ItemUnitTableCompanion(
            id: id,
            itemId: itemId,
            itemUnitId: itemUnitId,
            unitFactor: unitFactor,
            wholeSaleprice: wholeSaleprice,
            retailPrice: retailPrice,
            spacialPrice: spacialPrice,
            intialCost: intialCost,
            itemDiscount: itemDiscount,
            unitBarcode: unitBarcode,
            newData: newData,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int id,
            required int itemId,
            required int itemUnitId,
            required int unitFactor,
            required double wholeSaleprice,
            required double retailPrice,
            required double spacialPrice,
            required double intialCost,
            required double itemDiscount,
            required String unitBarcode,
            required bool newData,
            Value<int> rowid = const Value.absent(),
          }) =>
              ItemUnitTableCompanion.insert(
            id: id,
            itemId: itemId,
            itemUnitId: itemUnitId,
            unitFactor: unitFactor,
            wholeSaleprice: wholeSaleprice,
            retailPrice: retailPrice,
            spacialPrice: spacialPrice,
            intialCost: intialCost,
            itemDiscount: itemDiscount,
            unitBarcode: unitBarcode,
            newData: newData,
            rowid: rowid,
          ),
        ));
}

class $$ItemUnitTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ItemUnitTableTable> {
  $$ItemUnitTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get itemId => $state.composableBuilder(
      column: $state.table.itemId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get itemUnitId => $state.composableBuilder(
      column: $state.table.itemUnitId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get unitFactor => $state.composableBuilder(
      column: $state.table.unitFactor,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get wholeSaleprice => $state.composableBuilder(
      column: $state.table.wholeSaleprice,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get retailPrice => $state.composableBuilder(
      column: $state.table.retailPrice,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get spacialPrice => $state.composableBuilder(
      column: $state.table.spacialPrice,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get intialCost => $state.composableBuilder(
      column: $state.table.intialCost,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get itemDiscount => $state.composableBuilder(
      column: $state.table.itemDiscount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get unitBarcode => $state.composableBuilder(
      column: $state.table.unitBarcode,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get newData => $state.composableBuilder(
      column: $state.table.newData,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ItemUnitTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ItemUnitTableTable> {
  $$ItemUnitTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get itemId => $state.composableBuilder(
      column: $state.table.itemId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get itemUnitId => $state.composableBuilder(
      column: $state.table.itemUnitId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get unitFactor => $state.composableBuilder(
      column: $state.table.unitFactor,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get wholeSaleprice => $state.composableBuilder(
      column: $state.table.wholeSaleprice,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get retailPrice => $state.composableBuilder(
      column: $state.table.retailPrice,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get spacialPrice => $state.composableBuilder(
      column: $state.table.spacialPrice,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get intialCost => $state.composableBuilder(
      column: $state.table.intialCost,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get itemDiscount => $state.composableBuilder(
      column: $state.table.itemDiscount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get unitBarcode => $state.composableBuilder(
      column: $state.table.unitBarcode,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get newData => $state.composableBuilder(
      column: $state.table.newData,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$ItemTableTableCreateCompanionBuilder = ItemTableCompanion Function({
  Value<int> id,
  required int itemGroupId,
  required int itemCode,
  required String name,
  required String enName,
  required int type,
  required int itemLimit,
  required Uint8List itemImage,
  required bool isExpire,
  required bool freeQuantityAllow,
  required bool hasTax,
  required bool hasAlternated,
  required bool newData,
  required int notifyBefore,
  required int taxRate,
  required String itemCompany,
  required String orignalCountry,
  required String itemDescription,
  required String note,
});
typedef $$ItemTableTableUpdateCompanionBuilder = ItemTableCompanion Function({
  Value<int> id,
  Value<int> itemGroupId,
  Value<int> itemCode,
  Value<String> name,
  Value<String> enName,
  Value<int> type,
  Value<int> itemLimit,
  Value<Uint8List> itemImage,
  Value<bool> isExpire,
  Value<bool> freeQuantityAllow,
  Value<bool> hasTax,
  Value<bool> hasAlternated,
  Value<bool> newData,
  Value<int> notifyBefore,
  Value<int> taxRate,
  Value<String> itemCompany,
  Value<String> orignalCountry,
  Value<String> itemDescription,
  Value<String> note,
});

class $$ItemTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ItemTableTable,
    ItemModel,
    $$ItemTableTableFilterComposer,
    $$ItemTableTableOrderingComposer,
    $$ItemTableTableCreateCompanionBuilder,
    $$ItemTableTableUpdateCompanionBuilder> {
  $$ItemTableTableTableManager(_$AppDatabase db, $ItemTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ItemTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ItemTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> itemGroupId = const Value.absent(),
            Value<int> itemCode = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> enName = const Value.absent(),
            Value<int> type = const Value.absent(),
            Value<int> itemLimit = const Value.absent(),
            Value<Uint8List> itemImage = const Value.absent(),
            Value<bool> isExpire = const Value.absent(),
            Value<bool> freeQuantityAllow = const Value.absent(),
            Value<bool> hasTax = const Value.absent(),
            Value<bool> hasAlternated = const Value.absent(),
            Value<bool> newData = const Value.absent(),
            Value<int> notifyBefore = const Value.absent(),
            Value<int> taxRate = const Value.absent(),
            Value<String> itemCompany = const Value.absent(),
            Value<String> orignalCountry = const Value.absent(),
            Value<String> itemDescription = const Value.absent(),
            Value<String> note = const Value.absent(),
          }) =>
              ItemTableCompanion(
            id: id,
            itemGroupId: itemGroupId,
            itemCode: itemCode,
            name: name,
            enName: enName,
            type: type,
            itemLimit: itemLimit,
            itemImage: itemImage,
            isExpire: isExpire,
            freeQuantityAllow: freeQuantityAllow,
            hasTax: hasTax,
            hasAlternated: hasAlternated,
            newData: newData,
            notifyBefore: notifyBefore,
            taxRate: taxRate,
            itemCompany: itemCompany,
            orignalCountry: orignalCountry,
            itemDescription: itemDescription,
            note: note,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int itemGroupId,
            required int itemCode,
            required String name,
            required String enName,
            required int type,
            required int itemLimit,
            required Uint8List itemImage,
            required bool isExpire,
            required bool freeQuantityAllow,
            required bool hasTax,
            required bool hasAlternated,
            required bool newData,
            required int notifyBefore,
            required int taxRate,
            required String itemCompany,
            required String orignalCountry,
            required String itemDescription,
            required String note,
          }) =>
              ItemTableCompanion.insert(
            id: id,
            itemGroupId: itemGroupId,
            itemCode: itemCode,
            name: name,
            enName: enName,
            type: type,
            itemLimit: itemLimit,
            itemImage: itemImage,
            isExpire: isExpire,
            freeQuantityAllow: freeQuantityAllow,
            hasTax: hasTax,
            hasAlternated: hasAlternated,
            newData: newData,
            notifyBefore: notifyBefore,
            taxRate: taxRate,
            itemCompany: itemCompany,
            orignalCountry: orignalCountry,
            itemDescription: itemDescription,
            note: note,
          ),
        ));
}

class $$ItemTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ItemTableTable> {
  $$ItemTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get itemGroupId => $state.composableBuilder(
      column: $state.table.itemGroupId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get itemCode => $state.composableBuilder(
      column: $state.table.itemCode,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get enName => $state.composableBuilder(
      column: $state.table.enName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get itemLimit => $state.composableBuilder(
      column: $state.table.itemLimit,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<Uint8List> get itemImage => $state.composableBuilder(
      column: $state.table.itemImage,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isExpire => $state.composableBuilder(
      column: $state.table.isExpire,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get freeQuantityAllow => $state.composableBuilder(
      column: $state.table.freeQuantityAllow,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get hasTax => $state.composableBuilder(
      column: $state.table.hasTax,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get hasAlternated => $state.composableBuilder(
      column: $state.table.hasAlternated,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get newData => $state.composableBuilder(
      column: $state.table.newData,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get notifyBefore => $state.composableBuilder(
      column: $state.table.notifyBefore,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get taxRate => $state.composableBuilder(
      column: $state.table.taxRate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get itemCompany => $state.composableBuilder(
      column: $state.table.itemCompany,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get orignalCountry => $state.composableBuilder(
      column: $state.table.orignalCountry,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get itemDescription => $state.composableBuilder(
      column: $state.table.itemDescription,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get note => $state.composableBuilder(
      column: $state.table.note,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ItemTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ItemTableTable> {
  $$ItemTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get itemGroupId => $state.composableBuilder(
      column: $state.table.itemGroupId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get itemCode => $state.composableBuilder(
      column: $state.table.itemCode,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get enName => $state.composableBuilder(
      column: $state.table.enName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get itemLimit => $state.composableBuilder(
      column: $state.table.itemLimit,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<Uint8List> get itemImage => $state.composableBuilder(
      column: $state.table.itemImage,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isExpire => $state.composableBuilder(
      column: $state.table.isExpire,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get freeQuantityAllow => $state.composableBuilder(
      column: $state.table.freeQuantityAllow,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get hasTax => $state.composableBuilder(
      column: $state.table.hasTax,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get hasAlternated => $state.composableBuilder(
      column: $state.table.hasAlternated,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get newData => $state.composableBuilder(
      column: $state.table.newData,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get notifyBefore => $state.composableBuilder(
      column: $state.table.notifyBefore,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get taxRate => $state.composableBuilder(
      column: $state.table.taxRate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get itemCompany => $state.composableBuilder(
      column: $state.table.itemCompany,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get orignalCountry => $state.composableBuilder(
      column: $state.table.orignalCountry,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get itemDescription => $state.composableBuilder(
      column: $state.table.itemDescription,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get note => $state.composableBuilder(
      column: $state.table.note,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$PaymentTableTableCreateCompanionBuilder = PaymentTableCompanion
    Function({
  Value<int> id,
  required int userId,
  required String methodName,
  required String methodNote,
  required bool newData,
  required bool isDefault,
});
typedef $$PaymentTableTableUpdateCompanionBuilder = PaymentTableCompanion
    Function({
  Value<int> id,
  Value<int> userId,
  Value<String> methodName,
  Value<String> methodNote,
  Value<bool> newData,
  Value<bool> isDefault,
});

class $$PaymentTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PaymentTableTable,
    PaymentModel,
    $$PaymentTableTableFilterComposer,
    $$PaymentTableTableOrderingComposer,
    $$PaymentTableTableCreateCompanionBuilder,
    $$PaymentTableTableUpdateCompanionBuilder> {
  $$PaymentTableTableTableManager(_$AppDatabase db, $PaymentTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$PaymentTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$PaymentTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> userId = const Value.absent(),
            Value<String> methodName = const Value.absent(),
            Value<String> methodNote = const Value.absent(),
            Value<bool> newData = const Value.absent(),
            Value<bool> isDefault = const Value.absent(),
          }) =>
              PaymentTableCompanion(
            id: id,
            userId: userId,
            methodName: methodName,
            methodNote: methodNote,
            newData: newData,
            isDefault: isDefault,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int userId,
            required String methodName,
            required String methodNote,
            required bool newData,
            required bool isDefault,
          }) =>
              PaymentTableCompanion.insert(
            id: id,
            userId: userId,
            methodName: methodName,
            methodNote: methodNote,
            newData: newData,
            isDefault: isDefault,
          ),
        ));
}

class $$PaymentTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $PaymentTableTable> {
  $$PaymentTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get userId => $state.composableBuilder(
      column: $state.table.userId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get methodName => $state.composableBuilder(
      column: $state.table.methodName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get methodNote => $state.composableBuilder(
      column: $state.table.methodNote,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get newData => $state.composableBuilder(
      column: $state.table.newData,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isDefault => $state.composableBuilder(
      column: $state.table.isDefault,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$PaymentTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $PaymentTableTable> {
  $$PaymentTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get userId => $state.composableBuilder(
      column: $state.table.userId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get methodName => $state.composableBuilder(
      column: $state.table.methodName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get methodNote => $state.composableBuilder(
      column: $state.table.methodNote,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get newData => $state.composableBuilder(
      column: $state.table.newData,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isDefault => $state.composableBuilder(
      column: $state.table.isDefault,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$SystemDocTableTableCreateCompanionBuilder = SystemDocTableCompanion
    Function({
  Value<int> id,
  required int docType,
  required String docName,
});
typedef $$SystemDocTableTableUpdateCompanionBuilder = SystemDocTableCompanion
    Function({
  Value<int> id,
  Value<int> docType,
  Value<String> docName,
});

class $$SystemDocTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SystemDocTableTable,
    SystemDocModel,
    $$SystemDocTableTableFilterComposer,
    $$SystemDocTableTableOrderingComposer,
    $$SystemDocTableTableCreateCompanionBuilder,
    $$SystemDocTableTableUpdateCompanionBuilder> {
  $$SystemDocTableTableTableManager(
      _$AppDatabase db, $SystemDocTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$SystemDocTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$SystemDocTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> docType = const Value.absent(),
            Value<String> docName = const Value.absent(),
          }) =>
              SystemDocTableCompanion(
            id: id,
            docType: docType,
            docName: docName,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int docType,
            required String docName,
          }) =>
              SystemDocTableCompanion.insert(
            id: id,
            docType: docType,
            docName: docName,
          ),
        ));
}

class $$SystemDocTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $SystemDocTableTable> {
  $$SystemDocTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get docType => $state.composableBuilder(
      column: $state.table.docType,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get docName => $state.composableBuilder(
      column: $state.table.docName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$SystemDocTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $SystemDocTableTable> {
  $$SystemDocTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get docType => $state.composableBuilder(
      column: $state.table.docType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get docName => $state.composableBuilder(
      column: $state.table.docName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$UserSettingTableTableCreateCompanionBuilder
    = UserSettingTableCompanion Function({
  Value<int> id,
  required int custParent,
  required int custGroup,
  required String generateCode,
});
typedef $$UserSettingTableTableUpdateCompanionBuilder
    = UserSettingTableCompanion Function({
  Value<int> id,
  Value<int> custParent,
  Value<int> custGroup,
  Value<String> generateCode,
});

class $$UserSettingTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UserSettingTableTable,
    UserSettingModel,
    $$UserSettingTableTableFilterComposer,
    $$UserSettingTableTableOrderingComposer,
    $$UserSettingTableTableCreateCompanionBuilder,
    $$UserSettingTableTableUpdateCompanionBuilder> {
  $$UserSettingTableTableTableManager(
      _$AppDatabase db, $UserSettingTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$UserSettingTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$UserSettingTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> custParent = const Value.absent(),
            Value<int> custGroup = const Value.absent(),
            Value<String> generateCode = const Value.absent(),
          }) =>
              UserSettingTableCompanion(
            id: id,
            custParent: custParent,
            custGroup: custGroup,
            generateCode: generateCode,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int custParent,
            required int custGroup,
            required String generateCode,
          }) =>
              UserSettingTableCompanion.insert(
            id: id,
            custParent: custParent,
            custGroup: custGroup,
            generateCode: generateCode,
          ),
        ));
}

class $$UserSettingTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $UserSettingTableTable> {
  $$UserSettingTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get custParent => $state.composableBuilder(
      column: $state.table.custParent,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get custGroup => $state.composableBuilder(
      column: $state.table.custGroup,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get generateCode => $state.composableBuilder(
      column: $state.table.generateCode,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$UserSettingTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $UserSettingTableTable> {
  $$UserSettingTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get custParent => $state.composableBuilder(
      column: $state.table.custParent,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get custGroup => $state.composableBuilder(
      column: $state.table.custGroup,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get generateCode => $state.composableBuilder(
      column: $state.table.generateCode,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$ItemAlterTableTableCreateCompanionBuilder = ItemAlterTableCompanion
    Function({
  Value<int> id,
  required int itemId,
  required int itemAlterId,
  required int itemOrder,
});
typedef $$ItemAlterTableTableUpdateCompanionBuilder = ItemAlterTableCompanion
    Function({
  Value<int> id,
  Value<int> itemId,
  Value<int> itemAlterId,
  Value<int> itemOrder,
});

class $$ItemAlterTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ItemAlterTableTable,
    ItemAlterModel,
    $$ItemAlterTableTableFilterComposer,
    $$ItemAlterTableTableOrderingComposer,
    $$ItemAlterTableTableCreateCompanionBuilder,
    $$ItemAlterTableTableUpdateCompanionBuilder> {
  $$ItemAlterTableTableTableManager(
      _$AppDatabase db, $ItemAlterTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ItemAlterTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ItemAlterTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> itemId = const Value.absent(),
            Value<int> itemAlterId = const Value.absent(),
            Value<int> itemOrder = const Value.absent(),
          }) =>
              ItemAlterTableCompanion(
            id: id,
            itemId: itemId,
            itemAlterId: itemAlterId,
            itemOrder: itemOrder,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int itemId,
            required int itemAlterId,
            required int itemOrder,
          }) =>
              ItemAlterTableCompanion.insert(
            id: id,
            itemId: itemId,
            itemAlterId: itemAlterId,
            itemOrder: itemOrder,
          ),
        ));
}

class $$ItemAlterTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ItemAlterTableTable> {
  $$ItemAlterTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get itemId => $state.composableBuilder(
      column: $state.table.itemId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get itemAlterId => $state.composableBuilder(
      column: $state.table.itemAlterId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get itemOrder => $state.composableBuilder(
      column: $state.table.itemOrder,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ItemAlterTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ItemAlterTableTable> {
  $$ItemAlterTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get itemId => $state.composableBuilder(
      column: $state.table.itemId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get itemAlterId => $state.composableBuilder(
      column: $state.table.itemAlterId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get itemOrder => $state.composableBuilder(
      column: $state.table.itemOrder,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$BarcodeTableTableCreateCompanionBuilder = BarcodeTableCompanion
    Function({
  Value<int> id,
  required int itemId,
  required String itemBarcode,
});
typedef $$BarcodeTableTableUpdateCompanionBuilder = BarcodeTableCompanion
    Function({
  Value<int> id,
  Value<int> itemId,
  Value<String> itemBarcode,
});

class $$BarcodeTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BarcodeTableTable,
    BarcodeModel,
    $$BarcodeTableTableFilterComposer,
    $$BarcodeTableTableOrderingComposer,
    $$BarcodeTableTableCreateCompanionBuilder,
    $$BarcodeTableTableUpdateCompanionBuilder> {
  $$BarcodeTableTableTableManager(_$AppDatabase db, $BarcodeTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$BarcodeTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$BarcodeTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> itemId = const Value.absent(),
            Value<String> itemBarcode = const Value.absent(),
          }) =>
              BarcodeTableCompanion(
            id: id,
            itemId: itemId,
            itemBarcode: itemBarcode,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int itemId,
            required String itemBarcode,
          }) =>
              BarcodeTableCompanion.insert(
            id: id,
            itemId: itemId,
            itemBarcode: itemBarcode,
          ),
        ));
}

class $$BarcodeTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $BarcodeTableTable> {
  $$BarcodeTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get itemId => $state.composableBuilder(
      column: $state.table.itemId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get itemBarcode => $state.composableBuilder(
      column: $state.table.itemBarcode,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$BarcodeTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $BarcodeTableTable> {
  $$BarcodeTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get itemId => $state.composableBuilder(
      column: $state.table.itemId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get itemBarcode => $state.composableBuilder(
      column: $state.table.itemBarcode,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$AccountTableTableCreateCompanionBuilder = AccountTableCompanion
    Function({
  Value<int> id,
  required int accNumber,
  required String accName,
  required int accParent,
  required int accType,
  required int accLevel,
  required String note,
  required int accCatagory,
  required int accCatId,
  required String accPhone,
  required String address,
  required String email,
  required int accLimit,
  required int paymentType,
  required int branchId,
  required bool accStoped,
  required bool newData,
});
typedef $$AccountTableTableUpdateCompanionBuilder = AccountTableCompanion
    Function({
  Value<int> id,
  Value<int> accNumber,
  Value<String> accName,
  Value<int> accParent,
  Value<int> accType,
  Value<int> accLevel,
  Value<String> note,
  Value<int> accCatagory,
  Value<int> accCatId,
  Value<String> accPhone,
  Value<String> address,
  Value<String> email,
  Value<int> accLimit,
  Value<int> paymentType,
  Value<int> branchId,
  Value<bool> accStoped,
  Value<bool> newData,
});

class $$AccountTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AccountTableTable,
    AccountModel,
    $$AccountTableTableFilterComposer,
    $$AccountTableTableOrderingComposer,
    $$AccountTableTableCreateCompanionBuilder,
    $$AccountTableTableUpdateCompanionBuilder> {
  $$AccountTableTableTableManager(_$AppDatabase db, $AccountTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$AccountTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$AccountTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> accNumber = const Value.absent(),
            Value<String> accName = const Value.absent(),
            Value<int> accParent = const Value.absent(),
            Value<int> accType = const Value.absent(),
            Value<int> accLevel = const Value.absent(),
            Value<String> note = const Value.absent(),
            Value<int> accCatagory = const Value.absent(),
            Value<int> accCatId = const Value.absent(),
            Value<String> accPhone = const Value.absent(),
            Value<String> address = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<int> accLimit = const Value.absent(),
            Value<int> paymentType = const Value.absent(),
            Value<int> branchId = const Value.absent(),
            Value<bool> accStoped = const Value.absent(),
            Value<bool> newData = const Value.absent(),
          }) =>
              AccountTableCompanion(
            id: id,
            accNumber: accNumber,
            accName: accName,
            accParent: accParent,
            accType: accType,
            accLevel: accLevel,
            note: note,
            accCatagory: accCatagory,
            accCatId: accCatId,
            accPhone: accPhone,
            address: address,
            email: email,
            accLimit: accLimit,
            paymentType: paymentType,
            branchId: branchId,
            accStoped: accStoped,
            newData: newData,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int accNumber,
            required String accName,
            required int accParent,
            required int accType,
            required int accLevel,
            required String note,
            required int accCatagory,
            required int accCatId,
            required String accPhone,
            required String address,
            required String email,
            required int accLimit,
            required int paymentType,
            required int branchId,
            required bool accStoped,
            required bool newData,
          }) =>
              AccountTableCompanion.insert(
            id: id,
            accNumber: accNumber,
            accName: accName,
            accParent: accParent,
            accType: accType,
            accLevel: accLevel,
            note: note,
            accCatagory: accCatagory,
            accCatId: accCatId,
            accPhone: accPhone,
            address: address,
            email: email,
            accLimit: accLimit,
            paymentType: paymentType,
            branchId: branchId,
            accStoped: accStoped,
            newData: newData,
          ),
        ));
}

class $$AccountTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $AccountTableTable> {
  $$AccountTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get accNumber => $state.composableBuilder(
      column: $state.table.accNumber,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get accName => $state.composableBuilder(
      column: $state.table.accName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get accParent => $state.composableBuilder(
      column: $state.table.accParent,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get accType => $state.composableBuilder(
      column: $state.table.accType,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get accLevel => $state.composableBuilder(
      column: $state.table.accLevel,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get note => $state.composableBuilder(
      column: $state.table.note,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get accCatagory => $state.composableBuilder(
      column: $state.table.accCatagory,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get accCatId => $state.composableBuilder(
      column: $state.table.accCatId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get accPhone => $state.composableBuilder(
      column: $state.table.accPhone,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get address => $state.composableBuilder(
      column: $state.table.address,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get email => $state.composableBuilder(
      column: $state.table.email,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get accLimit => $state.composableBuilder(
      column: $state.table.accLimit,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get paymentType => $state.composableBuilder(
      column: $state.table.paymentType,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get branchId => $state.composableBuilder(
      column: $state.table.branchId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get accStoped => $state.composableBuilder(
      column: $state.table.accStoped,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get newData => $state.composableBuilder(
      column: $state.table.newData,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$AccountTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $AccountTableTable> {
  $$AccountTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get accNumber => $state.composableBuilder(
      column: $state.table.accNumber,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get accName => $state.composableBuilder(
      column: $state.table.accName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get accParent => $state.composableBuilder(
      column: $state.table.accParent,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get accType => $state.composableBuilder(
      column: $state.table.accType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get accLevel => $state.composableBuilder(
      column: $state.table.accLevel,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get note => $state.composableBuilder(
      column: $state.table.note,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get accCatagory => $state.composableBuilder(
      column: $state.table.accCatagory,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get accCatId => $state.composableBuilder(
      column: $state.table.accCatId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get accPhone => $state.composableBuilder(
      column: $state.table.accPhone,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get address => $state.composableBuilder(
      column: $state.table.address,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get email => $state.composableBuilder(
      column: $state.table.email,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get accLimit => $state.composableBuilder(
      column: $state.table.accLimit,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get paymentType => $state.composableBuilder(
      column: $state.table.paymentType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get branchId => $state.composableBuilder(
      column: $state.table.branchId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get accStoped => $state.composableBuilder(
      column: $state.table.accStoped,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get newData => $state.composableBuilder(
      column: $state.table.newData,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UserTableTableTableManager get userTable =>
      $$UserTableTableTableManager(_db, _db.userTable);
  $$CompanyTableTableTableManager get companyTable =>
      $$CompanyTableTableTableManager(_db, _db.companyTable);
  $$BranchTableTableTableManager get branchTable =>
      $$BranchTableTableTableManager(_db, _db.branchTable);
  $$CurencyTableTableTableManager get curencyTable =>
      $$CurencyTableTableTableManager(_db, _db.curencyTable);
  $$UserStoreTableTableTableManager get userStoreTable =>
      $$UserStoreTableTableTableManager(_db, _db.userStoreTable);
  $$UnitTableTableTableManager get unitTable =>
      $$UnitTableTableTableManager(_db, _db.unitTable);
  $$ItemGroupTableTableTableManager get itemGroupTable =>
      $$ItemGroupTableTableTableManager(_db, _db.itemGroupTable);
  $$ItemUnitTableTableTableManager get itemUnitTable =>
      $$ItemUnitTableTableTableManager(_db, _db.itemUnitTable);
  $$ItemTableTableTableManager get itemTable =>
      $$ItemTableTableTableManager(_db, _db.itemTable);
  $$PaymentTableTableTableManager get paymentTable =>
      $$PaymentTableTableTableManager(_db, _db.paymentTable);
  $$SystemDocTableTableTableManager get systemDocTable =>
      $$SystemDocTableTableTableManager(_db, _db.systemDocTable);
  $$UserSettingTableTableTableManager get userSettingTable =>
      $$UserSettingTableTableTableManager(_db, _db.userSettingTable);
  $$ItemAlterTableTableTableManager get itemAlterTable =>
      $$ItemAlterTableTableTableManager(_db, _db.itemAlterTable);
  $$BarcodeTableTableTableManager get barcodeTable =>
      $$BarcodeTableTableTableManager(_db, _db.barcodeTable);
  $$AccountTableTableTableManager get accountTable =>
      $$AccountTableTableTableManager(_db, _db.accountTable);
}
