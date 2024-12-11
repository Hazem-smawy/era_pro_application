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
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES item_group_table (id)'));
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
      'item_image', aliasedName, true,
      type: DriftSqlType.blob, requiredDuringInsert: false);
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
          .read(DriftSqlType.blob, data['${effectivePrefix}item_image']),
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
  final Value<Uint8List?> itemImage;
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
    this.itemImage = const Value.absent(),
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
      Value<Uint8List?>? itemImage,
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
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<int> itemId = GeneratedColumn<int>(
      'item_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES item_table (id)'));
  static const VerificationMeta _itemUnitIdMeta =
      const VerificationMeta('itemUnitId');
  @override
  late final GeneratedColumn<int> itemUnitId = GeneratedColumn<int>(
      'item_unit_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES unit_table (id)'));
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
  Set<GeneratedColumn> get $primaryKey => {id};
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
  });
  ItemUnitTableCompanion.insert({
    this.id = const Value.absent(),
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
  })  : itemId = Value(itemId),
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
      Value<bool>? newData}) {
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
          ..write('newData: $newData')
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
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES item_table (id)'));
  static const VerificationMeta _itemAlterIdMeta =
      const VerificationMeta('itemAlterId');
  @override
  late final GeneratedColumn<int> itemAlterId = GeneratedColumn<int>(
      'item_alter_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES item_table (id)'));
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
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES item_table (id)'));
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
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
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

class $StoreOperationTableTable extends StoreOperationTable
    with TableInfo<$StoreOperationTableTable, StoreOperationModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StoreOperationTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _operationIdMeta =
      const VerificationMeta('operationId');
  @override
  late final GeneratedColumn<int> operationId = GeneratedColumn<int>(
      'operation_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _operationTypeMeta =
      const VerificationMeta('operationType');
  @override
  late final GeneratedColumn<int> operationType = GeneratedColumn<int>(
      'operation_type', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _operationDateMeta =
      const VerificationMeta('operationDate');
  @override
  late final GeneratedColumn<DateTime> operationDate =
      GeneratedColumn<DateTime>('operation_date', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _operationInMeta =
      const VerificationMeta('operationIn');
  @override
  late final GeneratedColumn<bool> operationIn = GeneratedColumn<bool>(
      'operation_in', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("operation_in" IN (0, 1))'));
  static const VerificationMeta _storeIdMeta =
      const VerificationMeta('storeId');
  @override
  late final GeneratedColumn<int> storeId = GeneratedColumn<int>(
      'store_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<int> itemId = GeneratedColumn<int>(
      'item_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES item_table (id)'));
  static const VerificationMeta _unitIdMeta = const VerificationMeta('unitId');
  @override
  late final GeneratedColumn<int> unitId = GeneratedColumn<int>(
      'unit_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES unit_table (id)'));
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _averageCostMeta =
      const VerificationMeta('averageCost');
  @override
  late final GeneratedColumn<double> averageCost = GeneratedColumn<double>(
      'average_cost', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _unitCostMeta =
      const VerificationMeta('unitCost');
  @override
  late final GeneratedColumn<double> unitCost = GeneratedColumn<double>(
      'unit_cost', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _totalCostMeta =
      const VerificationMeta('totalCost');
  @override
  late final GeneratedColumn<double> totalCost = GeneratedColumn<double>(
      'total_cost', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _unitFactorMeta =
      const VerificationMeta('unitFactor');
  @override
  late final GeneratedColumn<int> unitFactor = GeneratedColumn<int>(
      'unit_factor', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _qtyConvertMeta =
      const VerificationMeta('qtyConvert');
  @override
  late final GeneratedColumn<int> qtyConvert = GeneratedColumn<int>(
      'qty_convert', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _expirDateMeta =
      const VerificationMeta('expirDate');
  @override
  late final GeneratedColumn<String> expirDate = GeneratedColumn<String>(
      'expir_date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _addBranchMeta =
      const VerificationMeta('addBranch');
  @override
  late final GeneratedColumn<int> addBranch = GeneratedColumn<int>(
      'add_branch', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        operationId,
        operationType,
        operationDate,
        operationIn,
        storeId,
        itemId,
        unitId,
        quantity,
        averageCost,
        unitCost,
        totalCost,
        unitFactor,
        qtyConvert,
        expirDate,
        addBranch
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'store_operation_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<StoreOperationModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('operation_id')) {
      context.handle(
          _operationIdMeta,
          operationId.isAcceptableOrUnknown(
              data['operation_id']!, _operationIdMeta));
    } else if (isInserting) {
      context.missing(_operationIdMeta);
    }
    if (data.containsKey('operation_type')) {
      context.handle(
          _operationTypeMeta,
          operationType.isAcceptableOrUnknown(
              data['operation_type']!, _operationTypeMeta));
    } else if (isInserting) {
      context.missing(_operationTypeMeta);
    }
    if (data.containsKey('operation_date')) {
      context.handle(
          _operationDateMeta,
          operationDate.isAcceptableOrUnknown(
              data['operation_date']!, _operationDateMeta));
    } else if (isInserting) {
      context.missing(_operationDateMeta);
    }
    if (data.containsKey('operation_in')) {
      context.handle(
          _operationInMeta,
          operationIn.isAcceptableOrUnknown(
              data['operation_in']!, _operationInMeta));
    } else if (isInserting) {
      context.missing(_operationInMeta);
    }
    if (data.containsKey('store_id')) {
      context.handle(_storeIdMeta,
          storeId.isAcceptableOrUnknown(data['store_id']!, _storeIdMeta));
    } else if (isInserting) {
      context.missing(_storeIdMeta);
    }
    if (data.containsKey('item_id')) {
      context.handle(_itemIdMeta,
          itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta));
    } else if (isInserting) {
      context.missing(_itemIdMeta);
    }
    if (data.containsKey('unit_id')) {
      context.handle(_unitIdMeta,
          unitId.isAcceptableOrUnknown(data['unit_id']!, _unitIdMeta));
    } else if (isInserting) {
      context.missing(_unitIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('average_cost')) {
      context.handle(
          _averageCostMeta,
          averageCost.isAcceptableOrUnknown(
              data['average_cost']!, _averageCostMeta));
    } else if (isInserting) {
      context.missing(_averageCostMeta);
    }
    if (data.containsKey('unit_cost')) {
      context.handle(_unitCostMeta,
          unitCost.isAcceptableOrUnknown(data['unit_cost']!, _unitCostMeta));
    } else if (isInserting) {
      context.missing(_unitCostMeta);
    }
    if (data.containsKey('total_cost')) {
      context.handle(_totalCostMeta,
          totalCost.isAcceptableOrUnknown(data['total_cost']!, _totalCostMeta));
    } else if (isInserting) {
      context.missing(_totalCostMeta);
    }
    if (data.containsKey('unit_factor')) {
      context.handle(
          _unitFactorMeta,
          unitFactor.isAcceptableOrUnknown(
              data['unit_factor']!, _unitFactorMeta));
    } else if (isInserting) {
      context.missing(_unitFactorMeta);
    }
    if (data.containsKey('qty_convert')) {
      context.handle(
          _qtyConvertMeta,
          qtyConvert.isAcceptableOrUnknown(
              data['qty_convert']!, _qtyConvertMeta));
    } else if (isInserting) {
      context.missing(_qtyConvertMeta);
    }
    if (data.containsKey('expir_date')) {
      context.handle(_expirDateMeta,
          expirDate.isAcceptableOrUnknown(data['expir_date']!, _expirDateMeta));
    } else if (isInserting) {
      context.missing(_expirDateMeta);
    }
    if (data.containsKey('add_branch')) {
      context.handle(_addBranchMeta,
          addBranch.isAcceptableOrUnknown(data['add_branch']!, _addBranchMeta));
    } else if (isInserting) {
      context.missing(_addBranchMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StoreOperationModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StoreOperationModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      operationId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}operation_id'])!,
      operationType: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}operation_type'])!,
      operationDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}operation_date'])!,
      operationIn: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}operation_in'])!,
      storeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}store_id'])!,
      itemId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}item_id'])!,
      unitId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}unit_id'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      averageCost: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}average_cost'])!,
      unitCost: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}unit_cost'])!,
      totalCost: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total_cost'])!,
      unitFactor: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}unit_factor'])!,
      qtyConvert: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}qty_convert'])!,
      expirDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}expir_date'])!,
      addBranch: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}add_branch'])!,
    );
  }

  @override
  $StoreOperationTableTable createAlias(String alias) {
    return $StoreOperationTableTable(attachedDatabase, alias);
  }
}

class StoreOperationTableCompanion
    extends UpdateCompanion<StoreOperationModel> {
  final Value<int> id;
  final Value<int> operationId;
  final Value<int> operationType;
  final Value<DateTime> operationDate;
  final Value<bool> operationIn;
  final Value<int> storeId;
  final Value<int> itemId;
  final Value<int> unitId;
  final Value<int> quantity;
  final Value<double> averageCost;
  final Value<double> unitCost;
  final Value<double> totalCost;
  final Value<int> unitFactor;
  final Value<int> qtyConvert;
  final Value<String> expirDate;
  final Value<int> addBranch;
  const StoreOperationTableCompanion({
    this.id = const Value.absent(),
    this.operationId = const Value.absent(),
    this.operationType = const Value.absent(),
    this.operationDate = const Value.absent(),
    this.operationIn = const Value.absent(),
    this.storeId = const Value.absent(),
    this.itemId = const Value.absent(),
    this.unitId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.averageCost = const Value.absent(),
    this.unitCost = const Value.absent(),
    this.totalCost = const Value.absent(),
    this.unitFactor = const Value.absent(),
    this.qtyConvert = const Value.absent(),
    this.expirDate = const Value.absent(),
    this.addBranch = const Value.absent(),
  });
  StoreOperationTableCompanion.insert({
    this.id = const Value.absent(),
    required int operationId,
    required int operationType,
    required DateTime operationDate,
    required bool operationIn,
    required int storeId,
    required int itemId,
    required int unitId,
    required int quantity,
    required double averageCost,
    required double unitCost,
    required double totalCost,
    required int unitFactor,
    required int qtyConvert,
    required String expirDate,
    required int addBranch,
  })  : operationId = Value(operationId),
        operationType = Value(operationType),
        operationDate = Value(operationDate),
        operationIn = Value(operationIn),
        storeId = Value(storeId),
        itemId = Value(itemId),
        unitId = Value(unitId),
        quantity = Value(quantity),
        averageCost = Value(averageCost),
        unitCost = Value(unitCost),
        totalCost = Value(totalCost),
        unitFactor = Value(unitFactor),
        qtyConvert = Value(qtyConvert),
        expirDate = Value(expirDate),
        addBranch = Value(addBranch);
  static Insertable<StoreOperationModel> custom({
    Expression<int>? id,
    Expression<int>? operationId,
    Expression<int>? operationType,
    Expression<DateTime>? operationDate,
    Expression<bool>? operationIn,
    Expression<int>? storeId,
    Expression<int>? itemId,
    Expression<int>? unitId,
    Expression<int>? quantity,
    Expression<double>? averageCost,
    Expression<double>? unitCost,
    Expression<double>? totalCost,
    Expression<int>? unitFactor,
    Expression<int>? qtyConvert,
    Expression<String>? expirDate,
    Expression<int>? addBranch,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (operationId != null) 'operation_id': operationId,
      if (operationType != null) 'operation_type': operationType,
      if (operationDate != null) 'operation_date': operationDate,
      if (operationIn != null) 'operation_in': operationIn,
      if (storeId != null) 'store_id': storeId,
      if (itemId != null) 'item_id': itemId,
      if (unitId != null) 'unit_id': unitId,
      if (quantity != null) 'quantity': quantity,
      if (averageCost != null) 'average_cost': averageCost,
      if (unitCost != null) 'unit_cost': unitCost,
      if (totalCost != null) 'total_cost': totalCost,
      if (unitFactor != null) 'unit_factor': unitFactor,
      if (qtyConvert != null) 'qty_convert': qtyConvert,
      if (expirDate != null) 'expir_date': expirDate,
      if (addBranch != null) 'add_branch': addBranch,
    });
  }

  StoreOperationTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? operationId,
      Value<int>? operationType,
      Value<DateTime>? operationDate,
      Value<bool>? operationIn,
      Value<int>? storeId,
      Value<int>? itemId,
      Value<int>? unitId,
      Value<int>? quantity,
      Value<double>? averageCost,
      Value<double>? unitCost,
      Value<double>? totalCost,
      Value<int>? unitFactor,
      Value<int>? qtyConvert,
      Value<String>? expirDate,
      Value<int>? addBranch}) {
    return StoreOperationTableCompanion(
      id: id ?? this.id,
      operationId: operationId ?? this.operationId,
      operationType: operationType ?? this.operationType,
      operationDate: operationDate ?? this.operationDate,
      operationIn: operationIn ?? this.operationIn,
      storeId: storeId ?? this.storeId,
      itemId: itemId ?? this.itemId,
      unitId: unitId ?? this.unitId,
      quantity: quantity ?? this.quantity,
      averageCost: averageCost ?? this.averageCost,
      unitCost: unitCost ?? this.unitCost,
      totalCost: totalCost ?? this.totalCost,
      unitFactor: unitFactor ?? this.unitFactor,
      qtyConvert: qtyConvert ?? this.qtyConvert,
      expirDate: expirDate ?? this.expirDate,
      addBranch: addBranch ?? this.addBranch,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (operationId.present) {
      map['operation_id'] = Variable<int>(operationId.value);
    }
    if (operationType.present) {
      map['operation_type'] = Variable<int>(operationType.value);
    }
    if (operationDate.present) {
      map['operation_date'] = Variable<DateTime>(operationDate.value);
    }
    if (operationIn.present) {
      map['operation_in'] = Variable<bool>(operationIn.value);
    }
    if (storeId.present) {
      map['store_id'] = Variable<int>(storeId.value);
    }
    if (itemId.present) {
      map['item_id'] = Variable<int>(itemId.value);
    }
    if (unitId.present) {
      map['unit_id'] = Variable<int>(unitId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (averageCost.present) {
      map['average_cost'] = Variable<double>(averageCost.value);
    }
    if (unitCost.present) {
      map['unit_cost'] = Variable<double>(unitCost.value);
    }
    if (totalCost.present) {
      map['total_cost'] = Variable<double>(totalCost.value);
    }
    if (unitFactor.present) {
      map['unit_factor'] = Variable<int>(unitFactor.value);
    }
    if (qtyConvert.present) {
      map['qty_convert'] = Variable<int>(qtyConvert.value);
    }
    if (expirDate.present) {
      map['expir_date'] = Variable<String>(expirDate.value);
    }
    if (addBranch.present) {
      map['add_branch'] = Variable<int>(addBranch.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StoreOperationTableCompanion(')
          ..write('id: $id, ')
          ..write('operationId: $operationId, ')
          ..write('operationType: $operationType, ')
          ..write('operationDate: $operationDate, ')
          ..write('operationIn: $operationIn, ')
          ..write('storeId: $storeId, ')
          ..write('itemId: $itemId, ')
          ..write('unitId: $unitId, ')
          ..write('quantity: $quantity, ')
          ..write('averageCost: $averageCost, ')
          ..write('unitCost: $unitCost, ')
          ..write('totalCost: $totalCost, ')
          ..write('unitFactor: $unitFactor, ')
          ..write('qtyConvert: $qtyConvert, ')
          ..write('expirDate: $expirDate, ')
          ..write('addBranch: $addBranch')
          ..write(')'))
        .toString();
  }
}

class $BillTableTable extends BillTable
    with TableInfo<$BillTableTable, BillModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BillTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _branchIdMeta =
      const VerificationMeta('branchId');
  @override
  late final GeneratedColumn<int> branchId = GeneratedColumn<int>(
      'branch_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _billNumberMeta =
      const VerificationMeta('billNumber');
  @override
  late final GeneratedColumn<int> billNumber = GeneratedColumn<int>(
      'bill_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _billTypeMeta =
      const VerificationMeta('billType');
  @override
  late final GeneratedColumn<int> billType = GeneratedColumn<int>(
      'bill_type', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _billDateMeta =
      const VerificationMeta('billDate');
  @override
  late final GeneratedColumn<DateTime> billDate = GeneratedColumn<DateTime>(
      'bill_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _refNumberMeta =
      const VerificationMeta('refNumber');
  @override
  late final GeneratedColumn<String> refNumber = GeneratedColumn<String>(
      'ref_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _customerNumberMeta =
      const VerificationMeta('customerNumber');
  @override
  late final GeneratedColumn<int> customerNumber = GeneratedColumn<int>(
      'customer_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _currencyIdMeta =
      const VerificationMeta('currencyId');
  @override
  late final GeneratedColumn<int> currencyId = GeneratedColumn<int>(
      'currency_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _currencyValueMeta =
      const VerificationMeta('currencyValue');
  @override
  late final GeneratedColumn<double> currencyValue = GeneratedColumn<double>(
      'currency_value', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _fundNumberMeta =
      const VerificationMeta('fundNumber');
  @override
  late final GeneratedColumn<int> fundNumber = GeneratedColumn<int>(
      'fund_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _paymentMethedMeta =
      const VerificationMeta('paymentMethed');
  @override
  late final GeneratedColumn<int> paymentMethed = GeneratedColumn<int>(
      'payment_methed', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _storeIdMeta =
      const VerificationMeta('storeId');
  @override
  late final GeneratedColumn<int> storeId = GeneratedColumn<int>(
      'store_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _storeCurValueMeta =
      const VerificationMeta('storeCurValue');
  @override
  late final GeneratedColumn<double> storeCurValue = GeneratedColumn<double>(
      'store_cur_value', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _billNoteMeta =
      const VerificationMeta('billNote');
  @override
  late final GeneratedColumn<String> billNote = GeneratedColumn<String>(
      'bill_note', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _itemCalcMethodMeta =
      const VerificationMeta('itemCalcMethod');
  @override
  late final GeneratedColumn<int> itemCalcMethod = GeneratedColumn<int>(
      'item_calc_method', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dueDateMeta =
      const VerificationMeta('dueDate');
  @override
  late final GeneratedColumn<DateTime> dueDate = GeneratedColumn<DateTime>(
      'due_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _salesPersonMeta =
      const VerificationMeta('salesPerson');
  @override
  late final GeneratedColumn<int> salesPerson = GeneratedColumn<int>(
      'sales_person', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _hasVatMeta = const VerificationMeta('hasVat');
  @override
  late final GeneratedColumn<bool> hasVat = GeneratedColumn<bool>(
      'has_vat', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("has_vat" IN (0, 1))'));
  static const VerificationMeta _hasSalesTaxMeta =
      const VerificationMeta('hasSalesTax');
  @override
  late final GeneratedColumn<bool> hasSalesTax = GeneratedColumn<bool>(
      'has_sales_tax', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("has_sales_tax" IN (0, 1))'));
  static const VerificationMeta _salesTaxRateMeta =
      const VerificationMeta('salesTaxRate');
  @override
  late final GeneratedColumn<double> salesTaxRate = GeneratedColumn<double>(
      'sales_tax_rate', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _numOfitemsMeta =
      const VerificationMeta('numOfitems');
  @override
  late final GeneratedColumn<int> numOfitems = GeneratedColumn<int>(
      'num_ofitems', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _totalBillMeta =
      const VerificationMeta('totalBill');
  @override
  late final GeneratedColumn<double> totalBill = GeneratedColumn<double>(
      'total_bill', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _itemsDiscountMeta =
      const VerificationMeta('itemsDiscount');
  @override
  late final GeneratedColumn<double> itemsDiscount = GeneratedColumn<double>(
      'items_discount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _billDiscountMeta =
      const VerificationMeta('billDiscount');
  @override
  late final GeneratedColumn<double> billDiscount = GeneratedColumn<double>(
      'bill_discount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _netBillMeta =
      const VerificationMeta('netBill');
  @override
  late final GeneratedColumn<double> netBill = GeneratedColumn<double>(
      'net_bill', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _totalVatMeta =
      const VerificationMeta('totalVat');
  @override
  late final GeneratedColumn<double> totalVat = GeneratedColumn<double>(
      'total_vat', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _billFinalCostMeta =
      const VerificationMeta('billFinalCost');
  @override
  late final GeneratedColumn<double> billFinalCost = GeneratedColumn<double>(
      'bill_final_cost', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _freeQtyCostMeta =
      const VerificationMeta('freeQtyCost');
  @override
  late final GeneratedColumn<double> freeQtyCost = GeneratedColumn<double>(
      'free_qty_cost', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _totalAvragCostMeta =
      const VerificationMeta('totalAvragCost');
  @override
  late final GeneratedColumn<double> totalAvragCost = GeneratedColumn<double>(
      'total_avrag_cost', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _paidAmountMeta =
      const VerificationMeta('paidAmount');
  @override
  late final GeneratedColumn<double> paidAmount = GeneratedColumn<double>(
      'paid_amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        branchId,
        billNumber,
        billType,
        billDate,
        refNumber,
        customerNumber,
        currencyId,
        currencyValue,
        fundNumber,
        paymentMethed,
        storeId,
        storeCurValue,
        billNote,
        itemCalcMethod,
        dueDate,
        salesPerson,
        hasVat,
        hasSalesTax,
        salesTaxRate,
        numOfitems,
        totalBill,
        itemsDiscount,
        billDiscount,
        netBill,
        totalVat,
        billFinalCost,
        freeQtyCost,
        totalAvragCost,
        paidAmount
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bill_table';
  @override
  VerificationContext validateIntegrity(Insertable<BillModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('branch_id')) {
      context.handle(_branchIdMeta,
          branchId.isAcceptableOrUnknown(data['branch_id']!, _branchIdMeta));
    } else if (isInserting) {
      context.missing(_branchIdMeta);
    }
    if (data.containsKey('bill_number')) {
      context.handle(
          _billNumberMeta,
          billNumber.isAcceptableOrUnknown(
              data['bill_number']!, _billNumberMeta));
    } else if (isInserting) {
      context.missing(_billNumberMeta);
    }
    if (data.containsKey('bill_type')) {
      context.handle(_billTypeMeta,
          billType.isAcceptableOrUnknown(data['bill_type']!, _billTypeMeta));
    } else if (isInserting) {
      context.missing(_billTypeMeta);
    }
    if (data.containsKey('bill_date')) {
      context.handle(_billDateMeta,
          billDate.isAcceptableOrUnknown(data['bill_date']!, _billDateMeta));
    } else if (isInserting) {
      context.missing(_billDateMeta);
    }
    if (data.containsKey('ref_number')) {
      context.handle(_refNumberMeta,
          refNumber.isAcceptableOrUnknown(data['ref_number']!, _refNumberMeta));
    } else if (isInserting) {
      context.missing(_refNumberMeta);
    }
    if (data.containsKey('customer_number')) {
      context.handle(
          _customerNumberMeta,
          customerNumber.isAcceptableOrUnknown(
              data['customer_number']!, _customerNumberMeta));
    } else if (isInserting) {
      context.missing(_customerNumberMeta);
    }
    if (data.containsKey('currency_id')) {
      context.handle(
          _currencyIdMeta,
          currencyId.isAcceptableOrUnknown(
              data['currency_id']!, _currencyIdMeta));
    } else if (isInserting) {
      context.missing(_currencyIdMeta);
    }
    if (data.containsKey('currency_value')) {
      context.handle(
          _currencyValueMeta,
          currencyValue.isAcceptableOrUnknown(
              data['currency_value']!, _currencyValueMeta));
    } else if (isInserting) {
      context.missing(_currencyValueMeta);
    }
    if (data.containsKey('fund_number')) {
      context.handle(
          _fundNumberMeta,
          fundNumber.isAcceptableOrUnknown(
              data['fund_number']!, _fundNumberMeta));
    } else if (isInserting) {
      context.missing(_fundNumberMeta);
    }
    if (data.containsKey('payment_methed')) {
      context.handle(
          _paymentMethedMeta,
          paymentMethed.isAcceptableOrUnknown(
              data['payment_methed']!, _paymentMethedMeta));
    } else if (isInserting) {
      context.missing(_paymentMethedMeta);
    }
    if (data.containsKey('store_id')) {
      context.handle(_storeIdMeta,
          storeId.isAcceptableOrUnknown(data['store_id']!, _storeIdMeta));
    } else if (isInserting) {
      context.missing(_storeIdMeta);
    }
    if (data.containsKey('store_cur_value')) {
      context.handle(
          _storeCurValueMeta,
          storeCurValue.isAcceptableOrUnknown(
              data['store_cur_value']!, _storeCurValueMeta));
    } else if (isInserting) {
      context.missing(_storeCurValueMeta);
    }
    if (data.containsKey('bill_note')) {
      context.handle(_billNoteMeta,
          billNote.isAcceptableOrUnknown(data['bill_note']!, _billNoteMeta));
    } else if (isInserting) {
      context.missing(_billNoteMeta);
    }
    if (data.containsKey('item_calc_method')) {
      context.handle(
          _itemCalcMethodMeta,
          itemCalcMethod.isAcceptableOrUnknown(
              data['item_calc_method']!, _itemCalcMethodMeta));
    } else if (isInserting) {
      context.missing(_itemCalcMethodMeta);
    }
    if (data.containsKey('due_date')) {
      context.handle(_dueDateMeta,
          dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta));
    } else if (isInserting) {
      context.missing(_dueDateMeta);
    }
    if (data.containsKey('sales_person')) {
      context.handle(
          _salesPersonMeta,
          salesPerson.isAcceptableOrUnknown(
              data['sales_person']!, _salesPersonMeta));
    } else if (isInserting) {
      context.missing(_salesPersonMeta);
    }
    if (data.containsKey('has_vat')) {
      context.handle(_hasVatMeta,
          hasVat.isAcceptableOrUnknown(data['has_vat']!, _hasVatMeta));
    } else if (isInserting) {
      context.missing(_hasVatMeta);
    }
    if (data.containsKey('has_sales_tax')) {
      context.handle(
          _hasSalesTaxMeta,
          hasSalesTax.isAcceptableOrUnknown(
              data['has_sales_tax']!, _hasSalesTaxMeta));
    } else if (isInserting) {
      context.missing(_hasSalesTaxMeta);
    }
    if (data.containsKey('sales_tax_rate')) {
      context.handle(
          _salesTaxRateMeta,
          salesTaxRate.isAcceptableOrUnknown(
              data['sales_tax_rate']!, _salesTaxRateMeta));
    } else if (isInserting) {
      context.missing(_salesTaxRateMeta);
    }
    if (data.containsKey('num_ofitems')) {
      context.handle(
          _numOfitemsMeta,
          numOfitems.isAcceptableOrUnknown(
              data['num_ofitems']!, _numOfitemsMeta));
    } else if (isInserting) {
      context.missing(_numOfitemsMeta);
    }
    if (data.containsKey('total_bill')) {
      context.handle(_totalBillMeta,
          totalBill.isAcceptableOrUnknown(data['total_bill']!, _totalBillMeta));
    } else if (isInserting) {
      context.missing(_totalBillMeta);
    }
    if (data.containsKey('items_discount')) {
      context.handle(
          _itemsDiscountMeta,
          itemsDiscount.isAcceptableOrUnknown(
              data['items_discount']!, _itemsDiscountMeta));
    } else if (isInserting) {
      context.missing(_itemsDiscountMeta);
    }
    if (data.containsKey('bill_discount')) {
      context.handle(
          _billDiscountMeta,
          billDiscount.isAcceptableOrUnknown(
              data['bill_discount']!, _billDiscountMeta));
    } else if (isInserting) {
      context.missing(_billDiscountMeta);
    }
    if (data.containsKey('net_bill')) {
      context.handle(_netBillMeta,
          netBill.isAcceptableOrUnknown(data['net_bill']!, _netBillMeta));
    } else if (isInserting) {
      context.missing(_netBillMeta);
    }
    if (data.containsKey('total_vat')) {
      context.handle(_totalVatMeta,
          totalVat.isAcceptableOrUnknown(data['total_vat']!, _totalVatMeta));
    } else if (isInserting) {
      context.missing(_totalVatMeta);
    }
    if (data.containsKey('bill_final_cost')) {
      context.handle(
          _billFinalCostMeta,
          billFinalCost.isAcceptableOrUnknown(
              data['bill_final_cost']!, _billFinalCostMeta));
    } else if (isInserting) {
      context.missing(_billFinalCostMeta);
    }
    if (data.containsKey('free_qty_cost')) {
      context.handle(
          _freeQtyCostMeta,
          freeQtyCost.isAcceptableOrUnknown(
              data['free_qty_cost']!, _freeQtyCostMeta));
    } else if (isInserting) {
      context.missing(_freeQtyCostMeta);
    }
    if (data.containsKey('total_avrag_cost')) {
      context.handle(
          _totalAvragCostMeta,
          totalAvragCost.isAcceptableOrUnknown(
              data['total_avrag_cost']!, _totalAvragCostMeta));
    } else if (isInserting) {
      context.missing(_totalAvragCostMeta);
    }
    if (data.containsKey('paid_amount')) {
      context.handle(
          _paidAmountMeta,
          paidAmount.isAcceptableOrUnknown(
              data['paid_amount']!, _paidAmountMeta));
    } else if (isInserting) {
      context.missing(_paidAmountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BillModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BillModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      branchId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}branch_id'])!,
      billNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}bill_number'])!,
      billType: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}bill_type'])!,
      billDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}bill_date'])!,
      refNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ref_number'])!,
      customerNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}customer_number'])!,
      currencyId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}currency_id'])!,
      currencyValue: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}currency_value'])!,
      fundNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}fund_number'])!,
      paymentMethed: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}payment_methed'])!,
      storeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}store_id'])!,
      storeCurValue: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}store_cur_value'])!,
      billNote: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}bill_note'])!,
      itemCalcMethod: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}item_calc_method'])!,
      dueDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}due_date'])!,
      salesPerson: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sales_person'])!,
      hasVat: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}has_vat'])!,
      hasSalesTax: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}has_sales_tax'])!,
      salesTaxRate: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}sales_tax_rate'])!,
      numOfitems: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}num_ofitems'])!,
      totalBill: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total_bill'])!,
      itemsDiscount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}items_discount'])!,
      billDiscount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}bill_discount'])!,
      netBill: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}net_bill'])!,
      totalVat: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total_vat'])!,
      billFinalCost: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}bill_final_cost'])!,
      freeQtyCost: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}free_qty_cost'])!,
      totalAvragCost: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}total_avrag_cost'])!,
      paidAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}paid_amount'])!,
    );
  }

  @override
  $BillTableTable createAlias(String alias) {
    return $BillTableTable(attachedDatabase, alias);
  }
}

class BillTableCompanion extends UpdateCompanion<BillModel> {
  final Value<int> id;
  final Value<int> branchId;
  final Value<int> billNumber;
  final Value<int> billType;
  final Value<DateTime> billDate;
  final Value<String> refNumber;
  final Value<int> customerNumber;
  final Value<int> currencyId;
  final Value<double> currencyValue;
  final Value<int> fundNumber;
  final Value<int> paymentMethed;
  final Value<int> storeId;
  final Value<double> storeCurValue;
  final Value<String> billNote;
  final Value<int> itemCalcMethod;
  final Value<DateTime> dueDate;
  final Value<int> salesPerson;
  final Value<bool> hasVat;
  final Value<bool> hasSalesTax;
  final Value<double> salesTaxRate;
  final Value<int> numOfitems;
  final Value<double> totalBill;
  final Value<double> itemsDiscount;
  final Value<double> billDiscount;
  final Value<double> netBill;
  final Value<double> totalVat;
  final Value<double> billFinalCost;
  final Value<double> freeQtyCost;
  final Value<double> totalAvragCost;
  final Value<double> paidAmount;
  const BillTableCompanion({
    this.id = const Value.absent(),
    this.branchId = const Value.absent(),
    this.billNumber = const Value.absent(),
    this.billType = const Value.absent(),
    this.billDate = const Value.absent(),
    this.refNumber = const Value.absent(),
    this.customerNumber = const Value.absent(),
    this.currencyId = const Value.absent(),
    this.currencyValue = const Value.absent(),
    this.fundNumber = const Value.absent(),
    this.paymentMethed = const Value.absent(),
    this.storeId = const Value.absent(),
    this.storeCurValue = const Value.absent(),
    this.billNote = const Value.absent(),
    this.itemCalcMethod = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.salesPerson = const Value.absent(),
    this.hasVat = const Value.absent(),
    this.hasSalesTax = const Value.absent(),
    this.salesTaxRate = const Value.absent(),
    this.numOfitems = const Value.absent(),
    this.totalBill = const Value.absent(),
    this.itemsDiscount = const Value.absent(),
    this.billDiscount = const Value.absent(),
    this.netBill = const Value.absent(),
    this.totalVat = const Value.absent(),
    this.billFinalCost = const Value.absent(),
    this.freeQtyCost = const Value.absent(),
    this.totalAvragCost = const Value.absent(),
    this.paidAmount = const Value.absent(),
  });
  BillTableCompanion.insert({
    this.id = const Value.absent(),
    required int branchId,
    required int billNumber,
    required int billType,
    required DateTime billDate,
    required String refNumber,
    required int customerNumber,
    required int currencyId,
    required double currencyValue,
    required int fundNumber,
    required int paymentMethed,
    required int storeId,
    required double storeCurValue,
    required String billNote,
    required int itemCalcMethod,
    required DateTime dueDate,
    required int salesPerson,
    required bool hasVat,
    required bool hasSalesTax,
    required double salesTaxRate,
    required int numOfitems,
    required double totalBill,
    required double itemsDiscount,
    required double billDiscount,
    required double netBill,
    required double totalVat,
    required double billFinalCost,
    required double freeQtyCost,
    required double totalAvragCost,
    required double paidAmount,
  })  : branchId = Value(branchId),
        billNumber = Value(billNumber),
        billType = Value(billType),
        billDate = Value(billDate),
        refNumber = Value(refNumber),
        customerNumber = Value(customerNumber),
        currencyId = Value(currencyId),
        currencyValue = Value(currencyValue),
        fundNumber = Value(fundNumber),
        paymentMethed = Value(paymentMethed),
        storeId = Value(storeId),
        storeCurValue = Value(storeCurValue),
        billNote = Value(billNote),
        itemCalcMethod = Value(itemCalcMethod),
        dueDate = Value(dueDate),
        salesPerson = Value(salesPerson),
        hasVat = Value(hasVat),
        hasSalesTax = Value(hasSalesTax),
        salesTaxRate = Value(salesTaxRate),
        numOfitems = Value(numOfitems),
        totalBill = Value(totalBill),
        itemsDiscount = Value(itemsDiscount),
        billDiscount = Value(billDiscount),
        netBill = Value(netBill),
        totalVat = Value(totalVat),
        billFinalCost = Value(billFinalCost),
        freeQtyCost = Value(freeQtyCost),
        totalAvragCost = Value(totalAvragCost),
        paidAmount = Value(paidAmount);
  static Insertable<BillModel> custom({
    Expression<int>? id,
    Expression<int>? branchId,
    Expression<int>? billNumber,
    Expression<int>? billType,
    Expression<DateTime>? billDate,
    Expression<String>? refNumber,
    Expression<int>? customerNumber,
    Expression<int>? currencyId,
    Expression<double>? currencyValue,
    Expression<int>? fundNumber,
    Expression<int>? paymentMethed,
    Expression<int>? storeId,
    Expression<double>? storeCurValue,
    Expression<String>? billNote,
    Expression<int>? itemCalcMethod,
    Expression<DateTime>? dueDate,
    Expression<int>? salesPerson,
    Expression<bool>? hasVat,
    Expression<bool>? hasSalesTax,
    Expression<double>? salesTaxRate,
    Expression<int>? numOfitems,
    Expression<double>? totalBill,
    Expression<double>? itemsDiscount,
    Expression<double>? billDiscount,
    Expression<double>? netBill,
    Expression<double>? totalVat,
    Expression<double>? billFinalCost,
    Expression<double>? freeQtyCost,
    Expression<double>? totalAvragCost,
    Expression<double>? paidAmount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (branchId != null) 'branch_id': branchId,
      if (billNumber != null) 'bill_number': billNumber,
      if (billType != null) 'bill_type': billType,
      if (billDate != null) 'bill_date': billDate,
      if (refNumber != null) 'ref_number': refNumber,
      if (customerNumber != null) 'customer_number': customerNumber,
      if (currencyId != null) 'currency_id': currencyId,
      if (currencyValue != null) 'currency_value': currencyValue,
      if (fundNumber != null) 'fund_number': fundNumber,
      if (paymentMethed != null) 'payment_methed': paymentMethed,
      if (storeId != null) 'store_id': storeId,
      if (storeCurValue != null) 'store_cur_value': storeCurValue,
      if (billNote != null) 'bill_note': billNote,
      if (itemCalcMethod != null) 'item_calc_method': itemCalcMethod,
      if (dueDate != null) 'due_date': dueDate,
      if (salesPerson != null) 'sales_person': salesPerson,
      if (hasVat != null) 'has_vat': hasVat,
      if (hasSalesTax != null) 'has_sales_tax': hasSalesTax,
      if (salesTaxRate != null) 'sales_tax_rate': salesTaxRate,
      if (numOfitems != null) 'num_ofitems': numOfitems,
      if (totalBill != null) 'total_bill': totalBill,
      if (itemsDiscount != null) 'items_discount': itemsDiscount,
      if (billDiscount != null) 'bill_discount': billDiscount,
      if (netBill != null) 'net_bill': netBill,
      if (totalVat != null) 'total_vat': totalVat,
      if (billFinalCost != null) 'bill_final_cost': billFinalCost,
      if (freeQtyCost != null) 'free_qty_cost': freeQtyCost,
      if (totalAvragCost != null) 'total_avrag_cost': totalAvragCost,
      if (paidAmount != null) 'paid_amount': paidAmount,
    });
  }

  BillTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? branchId,
      Value<int>? billNumber,
      Value<int>? billType,
      Value<DateTime>? billDate,
      Value<String>? refNumber,
      Value<int>? customerNumber,
      Value<int>? currencyId,
      Value<double>? currencyValue,
      Value<int>? fundNumber,
      Value<int>? paymentMethed,
      Value<int>? storeId,
      Value<double>? storeCurValue,
      Value<String>? billNote,
      Value<int>? itemCalcMethod,
      Value<DateTime>? dueDate,
      Value<int>? salesPerson,
      Value<bool>? hasVat,
      Value<bool>? hasSalesTax,
      Value<double>? salesTaxRate,
      Value<int>? numOfitems,
      Value<double>? totalBill,
      Value<double>? itemsDiscount,
      Value<double>? billDiscount,
      Value<double>? netBill,
      Value<double>? totalVat,
      Value<double>? billFinalCost,
      Value<double>? freeQtyCost,
      Value<double>? totalAvragCost,
      Value<double>? paidAmount}) {
    return BillTableCompanion(
      id: id ?? this.id,
      branchId: branchId ?? this.branchId,
      billNumber: billNumber ?? this.billNumber,
      billType: billType ?? this.billType,
      billDate: billDate ?? this.billDate,
      refNumber: refNumber ?? this.refNumber,
      customerNumber: customerNumber ?? this.customerNumber,
      currencyId: currencyId ?? this.currencyId,
      currencyValue: currencyValue ?? this.currencyValue,
      fundNumber: fundNumber ?? this.fundNumber,
      paymentMethed: paymentMethed ?? this.paymentMethed,
      storeId: storeId ?? this.storeId,
      storeCurValue: storeCurValue ?? this.storeCurValue,
      billNote: billNote ?? this.billNote,
      itemCalcMethod: itemCalcMethod ?? this.itemCalcMethod,
      dueDate: dueDate ?? this.dueDate,
      salesPerson: salesPerson ?? this.salesPerson,
      hasVat: hasVat ?? this.hasVat,
      hasSalesTax: hasSalesTax ?? this.hasSalesTax,
      salesTaxRate: salesTaxRate ?? this.salesTaxRate,
      numOfitems: numOfitems ?? this.numOfitems,
      totalBill: totalBill ?? this.totalBill,
      itemsDiscount: itemsDiscount ?? this.itemsDiscount,
      billDiscount: billDiscount ?? this.billDiscount,
      netBill: netBill ?? this.netBill,
      totalVat: totalVat ?? this.totalVat,
      billFinalCost: billFinalCost ?? this.billFinalCost,
      freeQtyCost: freeQtyCost ?? this.freeQtyCost,
      totalAvragCost: totalAvragCost ?? this.totalAvragCost,
      paidAmount: paidAmount ?? this.paidAmount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (branchId.present) {
      map['branch_id'] = Variable<int>(branchId.value);
    }
    if (billNumber.present) {
      map['bill_number'] = Variable<int>(billNumber.value);
    }
    if (billType.present) {
      map['bill_type'] = Variable<int>(billType.value);
    }
    if (billDate.present) {
      map['bill_date'] = Variable<DateTime>(billDate.value);
    }
    if (refNumber.present) {
      map['ref_number'] = Variable<String>(refNumber.value);
    }
    if (customerNumber.present) {
      map['customer_number'] = Variable<int>(customerNumber.value);
    }
    if (currencyId.present) {
      map['currency_id'] = Variable<int>(currencyId.value);
    }
    if (currencyValue.present) {
      map['currency_value'] = Variable<double>(currencyValue.value);
    }
    if (fundNumber.present) {
      map['fund_number'] = Variable<int>(fundNumber.value);
    }
    if (paymentMethed.present) {
      map['payment_methed'] = Variable<int>(paymentMethed.value);
    }
    if (storeId.present) {
      map['store_id'] = Variable<int>(storeId.value);
    }
    if (storeCurValue.present) {
      map['store_cur_value'] = Variable<double>(storeCurValue.value);
    }
    if (billNote.present) {
      map['bill_note'] = Variable<String>(billNote.value);
    }
    if (itemCalcMethod.present) {
      map['item_calc_method'] = Variable<int>(itemCalcMethod.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (salesPerson.present) {
      map['sales_person'] = Variable<int>(salesPerson.value);
    }
    if (hasVat.present) {
      map['has_vat'] = Variable<bool>(hasVat.value);
    }
    if (hasSalesTax.present) {
      map['has_sales_tax'] = Variable<bool>(hasSalesTax.value);
    }
    if (salesTaxRate.present) {
      map['sales_tax_rate'] = Variable<double>(salesTaxRate.value);
    }
    if (numOfitems.present) {
      map['num_ofitems'] = Variable<int>(numOfitems.value);
    }
    if (totalBill.present) {
      map['total_bill'] = Variable<double>(totalBill.value);
    }
    if (itemsDiscount.present) {
      map['items_discount'] = Variable<double>(itemsDiscount.value);
    }
    if (billDiscount.present) {
      map['bill_discount'] = Variable<double>(billDiscount.value);
    }
    if (netBill.present) {
      map['net_bill'] = Variable<double>(netBill.value);
    }
    if (totalVat.present) {
      map['total_vat'] = Variable<double>(totalVat.value);
    }
    if (billFinalCost.present) {
      map['bill_final_cost'] = Variable<double>(billFinalCost.value);
    }
    if (freeQtyCost.present) {
      map['free_qty_cost'] = Variable<double>(freeQtyCost.value);
    }
    if (totalAvragCost.present) {
      map['total_avrag_cost'] = Variable<double>(totalAvragCost.value);
    }
    if (paidAmount.present) {
      map['paid_amount'] = Variable<double>(paidAmount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BillTableCompanion(')
          ..write('id: $id, ')
          ..write('branchId: $branchId, ')
          ..write('billNumber: $billNumber, ')
          ..write('billType: $billType, ')
          ..write('billDate: $billDate, ')
          ..write('refNumber: $refNumber, ')
          ..write('customerNumber: $customerNumber, ')
          ..write('currencyId: $currencyId, ')
          ..write('currencyValue: $currencyValue, ')
          ..write('fundNumber: $fundNumber, ')
          ..write('paymentMethed: $paymentMethed, ')
          ..write('storeId: $storeId, ')
          ..write('storeCurValue: $storeCurValue, ')
          ..write('billNote: $billNote, ')
          ..write('itemCalcMethod: $itemCalcMethod, ')
          ..write('dueDate: $dueDate, ')
          ..write('salesPerson: $salesPerson, ')
          ..write('hasVat: $hasVat, ')
          ..write('hasSalesTax: $hasSalesTax, ')
          ..write('salesTaxRate: $salesTaxRate, ')
          ..write('numOfitems: $numOfitems, ')
          ..write('totalBill: $totalBill, ')
          ..write('itemsDiscount: $itemsDiscount, ')
          ..write('billDiscount: $billDiscount, ')
          ..write('netBill: $netBill, ')
          ..write('totalVat: $totalVat, ')
          ..write('billFinalCost: $billFinalCost, ')
          ..write('freeQtyCost: $freeQtyCost, ')
          ..write('totalAvragCost: $totalAvragCost, ')
          ..write('paidAmount: $paidAmount')
          ..write(')'))
        .toString();
  }
}

class $BillDetailsTableTable extends BillDetailsTable
    with TableInfo<$BillDetailsTableTable, BillDetailsModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BillDetailsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _billIDMeta = const VerificationMeta('billID');
  @override
  late final GeneratedColumn<int> billID = GeneratedColumn<int>(
      'bill_i_d', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<int> itemId = GeneratedColumn<int>(
      'item_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _itemUnitIDMeta =
      const VerificationMeta('itemUnitID');
  @override
  late final GeneratedColumn<int> itemUnitID = GeneratedColumn<int>(
      'item_unit_i_d', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _unitFactorMeta =
      const VerificationMeta('unitFactor');
  @override
  late final GeneratedColumn<int> unitFactor = GeneratedColumn<int>(
      'unit_factor', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _freeQtyMeta =
      const VerificationMeta('freeQty');
  @override
  late final GeneratedColumn<int> freeQty = GeneratedColumn<int>(
      'free_qty', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _avrageCostMeta =
      const VerificationMeta('avrageCost');
  @override
  late final GeneratedColumn<double> avrageCost = GeneratedColumn<double>(
      'avrage_cost', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _sellPriceMeta =
      const VerificationMeta('sellPrice');
  @override
  late final GeneratedColumn<double> sellPrice = GeneratedColumn<double>(
      'sell_price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _totalSellPriceMeta =
      const VerificationMeta('totalSellPrice');
  @override
  late final GeneratedColumn<double> totalSellPrice = GeneratedColumn<double>(
      'total_sell_price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _discountPreMeta =
      const VerificationMeta('discountPre');
  @override
  late final GeneratedColumn<double> discountPre = GeneratedColumn<double>(
      'discount_pre', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _netSellPriceMeta =
      const VerificationMeta('netSellPrice');
  @override
  late final GeneratedColumn<double> netSellPrice = GeneratedColumn<double>(
      'net_sell_price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _expirDateMeta =
      const VerificationMeta('expirDate');
  @override
  late final GeneratedColumn<String> expirDate = GeneratedColumn<String>(
      'expir_date', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _taxRateMeta =
      const VerificationMeta('taxRate');
  @override
  late final GeneratedColumn<double> taxRate = GeneratedColumn<double>(
      'tax_rate', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _itemNoteMeta =
      const VerificationMeta('itemNote');
  @override
  late final GeneratedColumn<String> itemNote = GeneratedColumn<String>(
      'item_note', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _freeQtyCostMeta =
      const VerificationMeta('freeQtyCost');
  @override
  late final GeneratedColumn<double> freeQtyCost = GeneratedColumn<double>(
      'free_qty_cost', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        billID,
        itemId,
        itemUnitID,
        unitFactor,
        quantity,
        freeQty,
        avrageCost,
        sellPrice,
        totalSellPrice,
        discountPre,
        netSellPrice,
        expirDate,
        taxRate,
        itemNote,
        freeQtyCost
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bill_details_table';
  @override
  VerificationContext validateIntegrity(Insertable<BillDetailsModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('bill_i_d')) {
      context.handle(_billIDMeta,
          billID.isAcceptableOrUnknown(data['bill_i_d']!, _billIDMeta));
    } else if (isInserting) {
      context.missing(_billIDMeta);
    }
    if (data.containsKey('item_id')) {
      context.handle(_itemIdMeta,
          itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta));
    } else if (isInserting) {
      context.missing(_itemIdMeta);
    }
    if (data.containsKey('item_unit_i_d')) {
      context.handle(
          _itemUnitIDMeta,
          itemUnitID.isAcceptableOrUnknown(
              data['item_unit_i_d']!, _itemUnitIDMeta));
    } else if (isInserting) {
      context.missing(_itemUnitIDMeta);
    }
    if (data.containsKey('unit_factor')) {
      context.handle(
          _unitFactorMeta,
          unitFactor.isAcceptableOrUnknown(
              data['unit_factor']!, _unitFactorMeta));
    } else if (isInserting) {
      context.missing(_unitFactorMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('free_qty')) {
      context.handle(_freeQtyMeta,
          freeQty.isAcceptableOrUnknown(data['free_qty']!, _freeQtyMeta));
    } else if (isInserting) {
      context.missing(_freeQtyMeta);
    }
    if (data.containsKey('avrage_cost')) {
      context.handle(
          _avrageCostMeta,
          avrageCost.isAcceptableOrUnknown(
              data['avrage_cost']!, _avrageCostMeta));
    } else if (isInserting) {
      context.missing(_avrageCostMeta);
    }
    if (data.containsKey('sell_price')) {
      context.handle(_sellPriceMeta,
          sellPrice.isAcceptableOrUnknown(data['sell_price']!, _sellPriceMeta));
    } else if (isInserting) {
      context.missing(_sellPriceMeta);
    }
    if (data.containsKey('total_sell_price')) {
      context.handle(
          _totalSellPriceMeta,
          totalSellPrice.isAcceptableOrUnknown(
              data['total_sell_price']!, _totalSellPriceMeta));
    } else if (isInserting) {
      context.missing(_totalSellPriceMeta);
    }
    if (data.containsKey('discount_pre')) {
      context.handle(
          _discountPreMeta,
          discountPre.isAcceptableOrUnknown(
              data['discount_pre']!, _discountPreMeta));
    } else if (isInserting) {
      context.missing(_discountPreMeta);
    }
    if (data.containsKey('net_sell_price')) {
      context.handle(
          _netSellPriceMeta,
          netSellPrice.isAcceptableOrUnknown(
              data['net_sell_price']!, _netSellPriceMeta));
    } else if (isInserting) {
      context.missing(_netSellPriceMeta);
    }
    if (data.containsKey('expir_date')) {
      context.handle(_expirDateMeta,
          expirDate.isAcceptableOrUnknown(data['expir_date']!, _expirDateMeta));
    }
    if (data.containsKey('tax_rate')) {
      context.handle(_taxRateMeta,
          taxRate.isAcceptableOrUnknown(data['tax_rate']!, _taxRateMeta));
    } else if (isInserting) {
      context.missing(_taxRateMeta);
    }
    if (data.containsKey('item_note')) {
      context.handle(_itemNoteMeta,
          itemNote.isAcceptableOrUnknown(data['item_note']!, _itemNoteMeta));
    } else if (isInserting) {
      context.missing(_itemNoteMeta);
    }
    if (data.containsKey('free_qty_cost')) {
      context.handle(
          _freeQtyCostMeta,
          freeQtyCost.isAcceptableOrUnknown(
              data['free_qty_cost']!, _freeQtyCostMeta));
    } else if (isInserting) {
      context.missing(_freeQtyCostMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BillDetailsModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BillDetailsModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      billID: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}bill_i_d'])!,
      itemId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}item_id'])!,
      itemUnitID: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}item_unit_i_d'])!,
      unitFactor: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}unit_factor'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      freeQty: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}free_qty'])!,
      avrageCost: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}avrage_cost'])!,
      sellPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}sell_price'])!,
      totalSellPrice: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}total_sell_price'])!,
      discountPre: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}discount_pre'])!,
      netSellPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}net_sell_price'])!,
      expirDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}expir_date']),
      taxRate: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}tax_rate'])!,
      itemNote: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_note'])!,
      freeQtyCost: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}free_qty_cost'])!,
    );
  }

  @override
  $BillDetailsTableTable createAlias(String alias) {
    return $BillDetailsTableTable(attachedDatabase, alias);
  }
}

class BillDetailsTableCompanion extends UpdateCompanion<BillDetailsModel> {
  final Value<int> id;
  final Value<int> billID;
  final Value<int> itemId;
  final Value<int> itemUnitID;
  final Value<int> unitFactor;
  final Value<int> quantity;
  final Value<int> freeQty;
  final Value<double> avrageCost;
  final Value<double> sellPrice;
  final Value<double> totalSellPrice;
  final Value<double> discountPre;
  final Value<double> netSellPrice;
  final Value<String?> expirDate;
  final Value<double> taxRate;
  final Value<String> itemNote;
  final Value<double> freeQtyCost;
  const BillDetailsTableCompanion({
    this.id = const Value.absent(),
    this.billID = const Value.absent(),
    this.itemId = const Value.absent(),
    this.itemUnitID = const Value.absent(),
    this.unitFactor = const Value.absent(),
    this.quantity = const Value.absent(),
    this.freeQty = const Value.absent(),
    this.avrageCost = const Value.absent(),
    this.sellPrice = const Value.absent(),
    this.totalSellPrice = const Value.absent(),
    this.discountPre = const Value.absent(),
    this.netSellPrice = const Value.absent(),
    this.expirDate = const Value.absent(),
    this.taxRate = const Value.absent(),
    this.itemNote = const Value.absent(),
    this.freeQtyCost = const Value.absent(),
  });
  BillDetailsTableCompanion.insert({
    this.id = const Value.absent(),
    required int billID,
    required int itemId,
    required int itemUnitID,
    required int unitFactor,
    required int quantity,
    required int freeQty,
    required double avrageCost,
    required double sellPrice,
    required double totalSellPrice,
    required double discountPre,
    required double netSellPrice,
    this.expirDate = const Value.absent(),
    required double taxRate,
    required String itemNote,
    required double freeQtyCost,
  })  : billID = Value(billID),
        itemId = Value(itemId),
        itemUnitID = Value(itemUnitID),
        unitFactor = Value(unitFactor),
        quantity = Value(quantity),
        freeQty = Value(freeQty),
        avrageCost = Value(avrageCost),
        sellPrice = Value(sellPrice),
        totalSellPrice = Value(totalSellPrice),
        discountPre = Value(discountPre),
        netSellPrice = Value(netSellPrice),
        taxRate = Value(taxRate),
        itemNote = Value(itemNote),
        freeQtyCost = Value(freeQtyCost);
  static Insertable<BillDetailsModel> custom({
    Expression<int>? id,
    Expression<int>? billID,
    Expression<int>? itemId,
    Expression<int>? itemUnitID,
    Expression<int>? unitFactor,
    Expression<int>? quantity,
    Expression<int>? freeQty,
    Expression<double>? avrageCost,
    Expression<double>? sellPrice,
    Expression<double>? totalSellPrice,
    Expression<double>? discountPre,
    Expression<double>? netSellPrice,
    Expression<String>? expirDate,
    Expression<double>? taxRate,
    Expression<String>? itemNote,
    Expression<double>? freeQtyCost,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (billID != null) 'bill_i_d': billID,
      if (itemId != null) 'item_id': itemId,
      if (itemUnitID != null) 'item_unit_i_d': itemUnitID,
      if (unitFactor != null) 'unit_factor': unitFactor,
      if (quantity != null) 'quantity': quantity,
      if (freeQty != null) 'free_qty': freeQty,
      if (avrageCost != null) 'avrage_cost': avrageCost,
      if (sellPrice != null) 'sell_price': sellPrice,
      if (totalSellPrice != null) 'total_sell_price': totalSellPrice,
      if (discountPre != null) 'discount_pre': discountPre,
      if (netSellPrice != null) 'net_sell_price': netSellPrice,
      if (expirDate != null) 'expir_date': expirDate,
      if (taxRate != null) 'tax_rate': taxRate,
      if (itemNote != null) 'item_note': itemNote,
      if (freeQtyCost != null) 'free_qty_cost': freeQtyCost,
    });
  }

  BillDetailsTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? billID,
      Value<int>? itemId,
      Value<int>? itemUnitID,
      Value<int>? unitFactor,
      Value<int>? quantity,
      Value<int>? freeQty,
      Value<double>? avrageCost,
      Value<double>? sellPrice,
      Value<double>? totalSellPrice,
      Value<double>? discountPre,
      Value<double>? netSellPrice,
      Value<String?>? expirDate,
      Value<double>? taxRate,
      Value<String>? itemNote,
      Value<double>? freeQtyCost}) {
    return BillDetailsTableCompanion(
      id: id ?? this.id,
      billID: billID ?? this.billID,
      itemId: itemId ?? this.itemId,
      itemUnitID: itemUnitID ?? this.itemUnitID,
      unitFactor: unitFactor ?? this.unitFactor,
      quantity: quantity ?? this.quantity,
      freeQty: freeQty ?? this.freeQty,
      avrageCost: avrageCost ?? this.avrageCost,
      sellPrice: sellPrice ?? this.sellPrice,
      totalSellPrice: totalSellPrice ?? this.totalSellPrice,
      discountPre: discountPre ?? this.discountPre,
      netSellPrice: netSellPrice ?? this.netSellPrice,
      expirDate: expirDate ?? this.expirDate,
      taxRate: taxRate ?? this.taxRate,
      itemNote: itemNote ?? this.itemNote,
      freeQtyCost: freeQtyCost ?? this.freeQtyCost,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (billID.present) {
      map['bill_i_d'] = Variable<int>(billID.value);
    }
    if (itemId.present) {
      map['item_id'] = Variable<int>(itemId.value);
    }
    if (itemUnitID.present) {
      map['item_unit_i_d'] = Variable<int>(itemUnitID.value);
    }
    if (unitFactor.present) {
      map['unit_factor'] = Variable<int>(unitFactor.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (freeQty.present) {
      map['free_qty'] = Variable<int>(freeQty.value);
    }
    if (avrageCost.present) {
      map['avrage_cost'] = Variable<double>(avrageCost.value);
    }
    if (sellPrice.present) {
      map['sell_price'] = Variable<double>(sellPrice.value);
    }
    if (totalSellPrice.present) {
      map['total_sell_price'] = Variable<double>(totalSellPrice.value);
    }
    if (discountPre.present) {
      map['discount_pre'] = Variable<double>(discountPre.value);
    }
    if (netSellPrice.present) {
      map['net_sell_price'] = Variable<double>(netSellPrice.value);
    }
    if (expirDate.present) {
      map['expir_date'] = Variable<String>(expirDate.value);
    }
    if (taxRate.present) {
      map['tax_rate'] = Variable<double>(taxRate.value);
    }
    if (itemNote.present) {
      map['item_note'] = Variable<String>(itemNote.value);
    }
    if (freeQtyCost.present) {
      map['free_qty_cost'] = Variable<double>(freeQtyCost.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BillDetailsTableCompanion(')
          ..write('id: $id, ')
          ..write('billID: $billID, ')
          ..write('itemId: $itemId, ')
          ..write('itemUnitID: $itemUnitID, ')
          ..write('unitFactor: $unitFactor, ')
          ..write('quantity: $quantity, ')
          ..write('freeQty: $freeQty, ')
          ..write('avrageCost: $avrageCost, ')
          ..write('sellPrice: $sellPrice, ')
          ..write('totalSellPrice: $totalSellPrice, ')
          ..write('discountPre: $discountPre, ')
          ..write('netSellPrice: $netSellPrice, ')
          ..write('expirDate: $expirDate, ')
          ..write('taxRate: $taxRate, ')
          ..write('itemNote: $itemNote, ')
          ..write('freeQtyCost: $freeQtyCost')
          ..write(')'))
        .toString();
  }
}

class $AccountOperationTableTable extends AccountOperationTable
    with TableInfo<$AccountOperationTableTable, AccountOperationModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccountOperationTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _operationDateMeta =
      const VerificationMeta('operationDate');
  @override
  late final GeneratedColumn<DateTime> operationDate =
      GeneratedColumn<DateTime>('operation_date', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _operationTypeMeta =
      const VerificationMeta('operationType');
  @override
  late final GeneratedColumn<int> operationType = GeneratedColumn<int>(
      'operation_type', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _operationIdMeta =
      const VerificationMeta('operationId');
  @override
  late final GeneratedColumn<int> operationId = GeneratedColumn<int>(
      'operation_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _operationRefMeta =
      const VerificationMeta('operationRef');
  @override
  late final GeneratedColumn<String> operationRef = GeneratedColumn<String>(
      'operation_ref', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _accountNumberMeta =
      const VerificationMeta('accountNumber');
  @override
  late final GeneratedColumn<int> accountNumber = GeneratedColumn<int>(
      'account_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _operationDebitMeta =
      const VerificationMeta('operationDebit');
  @override
  late final GeneratedColumn<double> operationDebit = GeneratedColumn<double>(
      'operation_debit', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _operationCreditMeta =
      const VerificationMeta('operationCredit');
  @override
  late final GeneratedColumn<double> operationCredit = GeneratedColumn<double>(
      'operation_credit', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _currencyIdMeta =
      const VerificationMeta('currencyId');
  @override
  late final GeneratedColumn<int> currencyId = GeneratedColumn<int>(
      'currency_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _currencyValueMeta =
      const VerificationMeta('currencyValue');
  @override
  late final GeneratedColumn<double> currencyValue = GeneratedColumn<double>(
      'currency_value', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _operationStatementMeta =
      const VerificationMeta('operationStatement');
  @override
  late final GeneratedColumn<String> operationStatement =
      GeneratedColumn<String>('operation_statement', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        operationDate,
        operationType,
        operationId,
        operationRef,
        accountNumber,
        operationDebit,
        operationCredit,
        currencyId,
        currencyValue,
        operationStatement
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'account_operation_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<AccountOperationModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('operation_date')) {
      context.handle(
          _operationDateMeta,
          operationDate.isAcceptableOrUnknown(
              data['operation_date']!, _operationDateMeta));
    } else if (isInserting) {
      context.missing(_operationDateMeta);
    }
    if (data.containsKey('operation_type')) {
      context.handle(
          _operationTypeMeta,
          operationType.isAcceptableOrUnknown(
              data['operation_type']!, _operationTypeMeta));
    } else if (isInserting) {
      context.missing(_operationTypeMeta);
    }
    if (data.containsKey('operation_id')) {
      context.handle(
          _operationIdMeta,
          operationId.isAcceptableOrUnknown(
              data['operation_id']!, _operationIdMeta));
    } else if (isInserting) {
      context.missing(_operationIdMeta);
    }
    if (data.containsKey('operation_ref')) {
      context.handle(
          _operationRefMeta,
          operationRef.isAcceptableOrUnknown(
              data['operation_ref']!, _operationRefMeta));
    } else if (isInserting) {
      context.missing(_operationRefMeta);
    }
    if (data.containsKey('account_number')) {
      context.handle(
          _accountNumberMeta,
          accountNumber.isAcceptableOrUnknown(
              data['account_number']!, _accountNumberMeta));
    } else if (isInserting) {
      context.missing(_accountNumberMeta);
    }
    if (data.containsKey('operation_debit')) {
      context.handle(
          _operationDebitMeta,
          operationDebit.isAcceptableOrUnknown(
              data['operation_debit']!, _operationDebitMeta));
    } else if (isInserting) {
      context.missing(_operationDebitMeta);
    }
    if (data.containsKey('operation_credit')) {
      context.handle(
          _operationCreditMeta,
          operationCredit.isAcceptableOrUnknown(
              data['operation_credit']!, _operationCreditMeta));
    } else if (isInserting) {
      context.missing(_operationCreditMeta);
    }
    if (data.containsKey('currency_id')) {
      context.handle(
          _currencyIdMeta,
          currencyId.isAcceptableOrUnknown(
              data['currency_id']!, _currencyIdMeta));
    } else if (isInserting) {
      context.missing(_currencyIdMeta);
    }
    if (data.containsKey('currency_value')) {
      context.handle(
          _currencyValueMeta,
          currencyValue.isAcceptableOrUnknown(
              data['currency_value']!, _currencyValueMeta));
    } else if (isInserting) {
      context.missing(_currencyValueMeta);
    }
    if (data.containsKey('operation_statement')) {
      context.handle(
          _operationStatementMeta,
          operationStatement.isAcceptableOrUnknown(
              data['operation_statement']!, _operationStatementMeta));
    } else if (isInserting) {
      context.missing(_operationStatementMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AccountOperationModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AccountOperationModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      operationDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}operation_date'])!,
      operationType: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}operation_type'])!,
      operationId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}operation_id'])!,
      operationRef: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}operation_ref'])!,
      accountNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}account_number'])!,
      operationDebit: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}operation_debit'])!,
      operationCredit: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}operation_credit'])!,
      currencyId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}currency_id'])!,
      currencyValue: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}currency_value'])!,
      operationStatement: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}operation_statement'])!,
    );
  }

  @override
  $AccountOperationTableTable createAlias(String alias) {
    return $AccountOperationTableTable(attachedDatabase, alias);
  }
}

class AccountOperationTableCompanion
    extends UpdateCompanion<AccountOperationModel> {
  final Value<int> id;
  final Value<DateTime> operationDate;
  final Value<int> operationType;
  final Value<int> operationId;
  final Value<String> operationRef;
  final Value<int> accountNumber;
  final Value<double> operationDebit;
  final Value<double> operationCredit;
  final Value<int> currencyId;
  final Value<double> currencyValue;
  final Value<String> operationStatement;
  const AccountOperationTableCompanion({
    this.id = const Value.absent(),
    this.operationDate = const Value.absent(),
    this.operationType = const Value.absent(),
    this.operationId = const Value.absent(),
    this.operationRef = const Value.absent(),
    this.accountNumber = const Value.absent(),
    this.operationDebit = const Value.absent(),
    this.operationCredit = const Value.absent(),
    this.currencyId = const Value.absent(),
    this.currencyValue = const Value.absent(),
    this.operationStatement = const Value.absent(),
  });
  AccountOperationTableCompanion.insert({
    this.id = const Value.absent(),
    required DateTime operationDate,
    required int operationType,
    required int operationId,
    required String operationRef,
    required int accountNumber,
    required double operationDebit,
    required double operationCredit,
    required int currencyId,
    required double currencyValue,
    required String operationStatement,
  })  : operationDate = Value(operationDate),
        operationType = Value(operationType),
        operationId = Value(operationId),
        operationRef = Value(operationRef),
        accountNumber = Value(accountNumber),
        operationDebit = Value(operationDebit),
        operationCredit = Value(operationCredit),
        currencyId = Value(currencyId),
        currencyValue = Value(currencyValue),
        operationStatement = Value(operationStatement);
  static Insertable<AccountOperationModel> custom({
    Expression<int>? id,
    Expression<DateTime>? operationDate,
    Expression<int>? operationType,
    Expression<int>? operationId,
    Expression<String>? operationRef,
    Expression<int>? accountNumber,
    Expression<double>? operationDebit,
    Expression<double>? operationCredit,
    Expression<int>? currencyId,
    Expression<double>? currencyValue,
    Expression<String>? operationStatement,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (operationDate != null) 'operation_date': operationDate,
      if (operationType != null) 'operation_type': operationType,
      if (operationId != null) 'operation_id': operationId,
      if (operationRef != null) 'operation_ref': operationRef,
      if (accountNumber != null) 'account_number': accountNumber,
      if (operationDebit != null) 'operation_debit': operationDebit,
      if (operationCredit != null) 'operation_credit': operationCredit,
      if (currencyId != null) 'currency_id': currencyId,
      if (currencyValue != null) 'currency_value': currencyValue,
      if (operationStatement != null) 'operation_statement': operationStatement,
    });
  }

  AccountOperationTableCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? operationDate,
      Value<int>? operationType,
      Value<int>? operationId,
      Value<String>? operationRef,
      Value<int>? accountNumber,
      Value<double>? operationDebit,
      Value<double>? operationCredit,
      Value<int>? currencyId,
      Value<double>? currencyValue,
      Value<String>? operationStatement}) {
    return AccountOperationTableCompanion(
      id: id ?? this.id,
      operationDate: operationDate ?? this.operationDate,
      operationType: operationType ?? this.operationType,
      operationId: operationId ?? this.operationId,
      operationRef: operationRef ?? this.operationRef,
      accountNumber: accountNumber ?? this.accountNumber,
      operationDebit: operationDebit ?? this.operationDebit,
      operationCredit: operationCredit ?? this.operationCredit,
      currencyId: currencyId ?? this.currencyId,
      currencyValue: currencyValue ?? this.currencyValue,
      operationStatement: operationStatement ?? this.operationStatement,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (operationDate.present) {
      map['operation_date'] = Variable<DateTime>(operationDate.value);
    }
    if (operationType.present) {
      map['operation_type'] = Variable<int>(operationType.value);
    }
    if (operationId.present) {
      map['operation_id'] = Variable<int>(operationId.value);
    }
    if (operationRef.present) {
      map['operation_ref'] = Variable<String>(operationRef.value);
    }
    if (accountNumber.present) {
      map['account_number'] = Variable<int>(accountNumber.value);
    }
    if (operationDebit.present) {
      map['operation_debit'] = Variable<double>(operationDebit.value);
    }
    if (operationCredit.present) {
      map['operation_credit'] = Variable<double>(operationCredit.value);
    }
    if (currencyId.present) {
      map['currency_id'] = Variable<int>(currencyId.value);
    }
    if (currencyValue.present) {
      map['currency_value'] = Variable<double>(currencyValue.value);
    }
    if (operationStatement.present) {
      map['operation_statement'] = Variable<String>(operationStatement.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountOperationTableCompanion(')
          ..write('id: $id, ')
          ..write('operationDate: $operationDate, ')
          ..write('operationType: $operationType, ')
          ..write('operationId: $operationId, ')
          ..write('operationRef: $operationRef, ')
          ..write('accountNumber: $accountNumber, ')
          ..write('operationDebit: $operationDebit, ')
          ..write('operationCredit: $operationCredit, ')
          ..write('currencyId: $currencyId, ')
          ..write('currencyValue: $currencyValue, ')
          ..write('operationStatement: $operationStatement')
          ..write(')'))
        .toString();
  }
}

class $RefAccountTableTable extends RefAccountTable
    with TableInfo<$RefAccountTableTable, RefAccountModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RefAccountTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _accTagMeta = const VerificationMeta('accTag');
  @override
  late final GeneratedColumn<int> accTag = GeneratedColumn<int>(
      'acc_tag', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _accNameMeta =
      const VerificationMeta('accName');
  @override
  late final GeneratedColumn<String> accName = GeneratedColumn<String>(
      'acc_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _accNumberMeta =
      const VerificationMeta('accNumber');
  @override
  late final GeneratedColumn<int> accNumber = GeneratedColumn<int>(
      'acc_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, accTag, accName, accNumber];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ref_account_table';
  @override
  VerificationContext validateIntegrity(Insertable<RefAccountModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('acc_tag')) {
      context.handle(_accTagMeta,
          accTag.isAcceptableOrUnknown(data['acc_tag']!, _accTagMeta));
    } else if (isInserting) {
      context.missing(_accTagMeta);
    }
    if (data.containsKey('acc_name')) {
      context.handle(_accNameMeta,
          accName.isAcceptableOrUnknown(data['acc_name']!, _accNameMeta));
    } else if (isInserting) {
      context.missing(_accNameMeta);
    }
    if (data.containsKey('acc_number')) {
      context.handle(_accNumberMeta,
          accNumber.isAcceptableOrUnknown(data['acc_number']!, _accNumberMeta));
    } else if (isInserting) {
      context.missing(_accNumberMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RefAccountModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RefAccountModel(
      attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}acc_tag'])!,
      attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}acc_name'])!,
      attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}acc_number'])!,
    );
  }

  @override
  $RefAccountTableTable createAlias(String alias) {
    return $RefAccountTableTable(attachedDatabase, alias);
  }
}

class RefAccountTableCompanion extends UpdateCompanion<RefAccountModel> {
  final Value<int> id;
  final Value<int> accTag;
  final Value<String> accName;
  final Value<int> accNumber;
  const RefAccountTableCompanion({
    this.id = const Value.absent(),
    this.accTag = const Value.absent(),
    this.accName = const Value.absent(),
    this.accNumber = const Value.absent(),
  });
  RefAccountTableCompanion.insert({
    this.id = const Value.absent(),
    required int accTag,
    required String accName,
    required int accNumber,
  })  : accTag = Value(accTag),
        accName = Value(accName),
        accNumber = Value(accNumber);
  static Insertable<RefAccountModel> custom({
    Expression<int>? id,
    Expression<int>? accTag,
    Expression<String>? accName,
    Expression<int>? accNumber,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (accTag != null) 'acc_tag': accTag,
      if (accName != null) 'acc_name': accName,
      if (accNumber != null) 'acc_number': accNumber,
    });
  }

  RefAccountTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? accTag,
      Value<String>? accName,
      Value<int>? accNumber}) {
    return RefAccountTableCompanion(
      id: id ?? this.id,
      accTag: accTag ?? this.accTag,
      accName: accName ?? this.accName,
      accNumber: accNumber ?? this.accNumber,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (accTag.present) {
      map['acc_tag'] = Variable<int>(accTag.value);
    }
    if (accName.present) {
      map['acc_name'] = Variable<String>(accName.value);
    }
    if (accNumber.present) {
      map['acc_number'] = Variable<int>(accNumber.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RefAccountTableCompanion(')
          ..write('id: $id, ')
          ..write('accTag: $accTag, ')
          ..write('accName: $accName, ')
          ..write('accNumber: $accNumber')
          ..write(')'))
        .toString();
  }
}

class $MidAccountTableTable extends MidAccountTable
    with TableInfo<$MidAccountTableTable, MidAccountModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MidAccountTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _accTagMeta = const VerificationMeta('accTag');
  @override
  late final GeneratedColumn<int> accTag = GeneratedColumn<int>(
      'acc_tag', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _accNameMeta =
      const VerificationMeta('accName');
  @override
  late final GeneratedColumn<String> accName = GeneratedColumn<String>(
      'acc_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _accNumberMeta =
      const VerificationMeta('accNumber');
  @override
  late final GeneratedColumn<int> accNumber = GeneratedColumn<int>(
      'acc_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _branchIdMeta =
      const VerificationMeta('branchId');
  @override
  late final GeneratedColumn<int> branchId = GeneratedColumn<int>(
      'branch_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, accTag, accName, accNumber, branchId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'mid_account_table';
  @override
  VerificationContext validateIntegrity(Insertable<MidAccountModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('acc_tag')) {
      context.handle(_accTagMeta,
          accTag.isAcceptableOrUnknown(data['acc_tag']!, _accTagMeta));
    } else if (isInserting) {
      context.missing(_accTagMeta);
    }
    if (data.containsKey('acc_name')) {
      context.handle(_accNameMeta,
          accName.isAcceptableOrUnknown(data['acc_name']!, _accNameMeta));
    } else if (isInserting) {
      context.missing(_accNameMeta);
    }
    if (data.containsKey('acc_number')) {
      context.handle(_accNumberMeta,
          accNumber.isAcceptableOrUnknown(data['acc_number']!, _accNumberMeta));
    } else if (isInserting) {
      context.missing(_accNumberMeta);
    }
    if (data.containsKey('branch_id')) {
      context.handle(_branchIdMeta,
          branchId.isAcceptableOrUnknown(data['branch_id']!, _branchIdMeta));
    } else if (isInserting) {
      context.missing(_branchIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MidAccountModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MidAccountModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      accTag: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}acc_tag'])!,
      accName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}acc_name'])!,
      accNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}acc_number'])!,
      branchId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}branch_id'])!,
    );
  }

  @override
  $MidAccountTableTable createAlias(String alias) {
    return $MidAccountTableTable(attachedDatabase, alias);
  }
}

class MidAccountTableCompanion extends UpdateCompanion<MidAccountModel> {
  final Value<int> id;
  final Value<int> accTag;
  final Value<String> accName;
  final Value<int> accNumber;
  final Value<int> branchId;
  const MidAccountTableCompanion({
    this.id = const Value.absent(),
    this.accTag = const Value.absent(),
    this.accName = const Value.absent(),
    this.accNumber = const Value.absent(),
    this.branchId = const Value.absent(),
  });
  MidAccountTableCompanion.insert({
    this.id = const Value.absent(),
    required int accTag,
    required String accName,
    required int accNumber,
    required int branchId,
  })  : accTag = Value(accTag),
        accName = Value(accName),
        accNumber = Value(accNumber),
        branchId = Value(branchId);
  static Insertable<MidAccountModel> custom({
    Expression<int>? id,
    Expression<int>? accTag,
    Expression<String>? accName,
    Expression<int>? accNumber,
    Expression<int>? branchId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (accTag != null) 'acc_tag': accTag,
      if (accName != null) 'acc_name': accName,
      if (accNumber != null) 'acc_number': accNumber,
      if (branchId != null) 'branch_id': branchId,
    });
  }

  MidAccountTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? accTag,
      Value<String>? accName,
      Value<int>? accNumber,
      Value<int>? branchId}) {
    return MidAccountTableCompanion(
      id: id ?? this.id,
      accTag: accTag ?? this.accTag,
      accName: accName ?? this.accName,
      accNumber: accNumber ?? this.accNumber,
      branchId: branchId ?? this.branchId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (accTag.present) {
      map['acc_tag'] = Variable<int>(accTag.value);
    }
    if (accName.present) {
      map['acc_name'] = Variable<String>(accName.value);
    }
    if (accNumber.present) {
      map['acc_number'] = Variable<int>(accNumber.value);
    }
    if (branchId.present) {
      map['branch_id'] = Variable<int>(branchId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MidAccountTableCompanion(')
          ..write('id: $id, ')
          ..write('accTag: $accTag, ')
          ..write('accName: $accName, ')
          ..write('accNumber: $accNumber, ')
          ..write('branchId: $branchId')
          ..write(')'))
        .toString();
  }
}

class $ExchangesTableTable extends ExchangesTable
    with TableInfo<$ExchangesTableTable, ExchangeModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExchangesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _sandTypeMeta =
      const VerificationMeta('sandType');
  @override
  late final GeneratedColumn<int> sandType = GeneratedColumn<int>(
      'sand_type', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isCashMeta = const VerificationMeta('isCash');
  @override
  late final GeneratedColumn<bool> isCash = GeneratedColumn<bool>(
      'is_cash', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_cash" IN (0, 1))'));
  static const VerificationMeta _branchIdMeta =
      const VerificationMeta('branchId');
  @override
  late final GeneratedColumn<int> branchId = GeneratedColumn<int>(
      'branch_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _sandNumberMeta =
      const VerificationMeta('sandNumber');
  @override
  late final GeneratedColumn<int> sandNumber = GeneratedColumn<int>(
      'sand_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _sandDateMeta =
      const VerificationMeta('sandDate');
  @override
  late final GeneratedColumn<DateTime> sandDate = GeneratedColumn<DateTime>(
      'sand_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _fundNumberMeta =
      const VerificationMeta('fundNumber');
  @override
  late final GeneratedColumn<int> fundNumber = GeneratedColumn<int>(
      'fund_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _currencyIdMeta =
      const VerificationMeta('currencyId');
  @override
  late final GeneratedColumn<int> currencyId = GeneratedColumn<int>(
      'currency_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _currencyValueMeta =
      const VerificationMeta('currencyValue');
  @override
  late final GeneratedColumn<double> currencyValue = GeneratedColumn<double>(
      'currency_value', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _reciepentNameMeta =
      const VerificationMeta('reciepentName');
  @override
  late final GeneratedColumn<String> reciepentName = GeneratedColumn<String>(
      'reciepent_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _totalAmountMeta =
      const VerificationMeta('totalAmount');
  @override
  late final GeneratedColumn<double> totalAmount = GeneratedColumn<double>(
      'total_amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _sandNoteMeta =
      const VerificationMeta('sandNote');
  @override
  late final GeneratedColumn<String> sandNote = GeneratedColumn<String>(
      'sand_note', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _refNumberMeta =
      const VerificationMeta('refNumber');
  @override
  late final GeneratedColumn<String> refNumber = GeneratedColumn<String>(
      'ref_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        sandType,
        isCash,
        branchId,
        sandNumber,
        sandDate,
        fundNumber,
        currencyId,
        currencyValue,
        reciepentName,
        totalAmount,
        sandNote,
        refNumber
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exchanges_table';
  @override
  VerificationContext validateIntegrity(Insertable<ExchangeModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('sand_type')) {
      context.handle(_sandTypeMeta,
          sandType.isAcceptableOrUnknown(data['sand_type']!, _sandTypeMeta));
    } else if (isInserting) {
      context.missing(_sandTypeMeta);
    }
    if (data.containsKey('is_cash')) {
      context.handle(_isCashMeta,
          isCash.isAcceptableOrUnknown(data['is_cash']!, _isCashMeta));
    } else if (isInserting) {
      context.missing(_isCashMeta);
    }
    if (data.containsKey('branch_id')) {
      context.handle(_branchIdMeta,
          branchId.isAcceptableOrUnknown(data['branch_id']!, _branchIdMeta));
    } else if (isInserting) {
      context.missing(_branchIdMeta);
    }
    if (data.containsKey('sand_number')) {
      context.handle(
          _sandNumberMeta,
          sandNumber.isAcceptableOrUnknown(
              data['sand_number']!, _sandNumberMeta));
    } else if (isInserting) {
      context.missing(_sandNumberMeta);
    }
    if (data.containsKey('sand_date')) {
      context.handle(_sandDateMeta,
          sandDate.isAcceptableOrUnknown(data['sand_date']!, _sandDateMeta));
    } else if (isInserting) {
      context.missing(_sandDateMeta);
    }
    if (data.containsKey('fund_number')) {
      context.handle(
          _fundNumberMeta,
          fundNumber.isAcceptableOrUnknown(
              data['fund_number']!, _fundNumberMeta));
    } else if (isInserting) {
      context.missing(_fundNumberMeta);
    }
    if (data.containsKey('currency_id')) {
      context.handle(
          _currencyIdMeta,
          currencyId.isAcceptableOrUnknown(
              data['currency_id']!, _currencyIdMeta));
    } else if (isInserting) {
      context.missing(_currencyIdMeta);
    }
    if (data.containsKey('currency_value')) {
      context.handle(
          _currencyValueMeta,
          currencyValue.isAcceptableOrUnknown(
              data['currency_value']!, _currencyValueMeta));
    } else if (isInserting) {
      context.missing(_currencyValueMeta);
    }
    if (data.containsKey('reciepent_name')) {
      context.handle(
          _reciepentNameMeta,
          reciepentName.isAcceptableOrUnknown(
              data['reciepent_name']!, _reciepentNameMeta));
    } else if (isInserting) {
      context.missing(_reciepentNameMeta);
    }
    if (data.containsKey('total_amount')) {
      context.handle(
          _totalAmountMeta,
          totalAmount.isAcceptableOrUnknown(
              data['total_amount']!, _totalAmountMeta));
    } else if (isInserting) {
      context.missing(_totalAmountMeta);
    }
    if (data.containsKey('sand_note')) {
      context.handle(_sandNoteMeta,
          sandNote.isAcceptableOrUnknown(data['sand_note']!, _sandNoteMeta));
    } else if (isInserting) {
      context.missing(_sandNoteMeta);
    }
    if (data.containsKey('ref_number')) {
      context.handle(_refNumberMeta,
          refNumber.isAcceptableOrUnknown(data['ref_number']!, _refNumberMeta));
    } else if (isInserting) {
      context.missing(_refNumberMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExchangeModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExchangeModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      sandType: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sand_type'])!,
      isCash: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_cash'])!,
      branchId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}branch_id'])!,
      sandNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sand_number'])!,
      sandDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}sand_date'])!,
      fundNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}fund_number'])!,
      currencyId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}currency_id'])!,
      currencyValue: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}currency_value'])!,
      reciepentName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reciepent_name'])!,
      totalAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total_amount'])!,
      sandNote: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sand_note'])!,
      refNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ref_number'])!,
    );
  }

  @override
  $ExchangesTableTable createAlias(String alias) {
    return $ExchangesTableTable(attachedDatabase, alias);
  }
}

class ExchangesTableCompanion extends UpdateCompanion<ExchangeModel> {
  final Value<int> id;
  final Value<int> sandType;
  final Value<bool> isCash;
  final Value<int> branchId;
  final Value<int> sandNumber;
  final Value<DateTime> sandDate;
  final Value<int> fundNumber;
  final Value<int> currencyId;
  final Value<double> currencyValue;
  final Value<String> reciepentName;
  final Value<double> totalAmount;
  final Value<String> sandNote;
  final Value<String> refNumber;
  const ExchangesTableCompanion({
    this.id = const Value.absent(),
    this.sandType = const Value.absent(),
    this.isCash = const Value.absent(),
    this.branchId = const Value.absent(),
    this.sandNumber = const Value.absent(),
    this.sandDate = const Value.absent(),
    this.fundNumber = const Value.absent(),
    this.currencyId = const Value.absent(),
    this.currencyValue = const Value.absent(),
    this.reciepentName = const Value.absent(),
    this.totalAmount = const Value.absent(),
    this.sandNote = const Value.absent(),
    this.refNumber = const Value.absent(),
  });
  ExchangesTableCompanion.insert({
    this.id = const Value.absent(),
    required int sandType,
    required bool isCash,
    required int branchId,
    required int sandNumber,
    required DateTime sandDate,
    required int fundNumber,
    required int currencyId,
    required double currencyValue,
    required String reciepentName,
    required double totalAmount,
    required String sandNote,
    required String refNumber,
  })  : sandType = Value(sandType),
        isCash = Value(isCash),
        branchId = Value(branchId),
        sandNumber = Value(sandNumber),
        sandDate = Value(sandDate),
        fundNumber = Value(fundNumber),
        currencyId = Value(currencyId),
        currencyValue = Value(currencyValue),
        reciepentName = Value(reciepentName),
        totalAmount = Value(totalAmount),
        sandNote = Value(sandNote),
        refNumber = Value(refNumber);
  static Insertable<ExchangeModel> custom({
    Expression<int>? id,
    Expression<int>? sandType,
    Expression<bool>? isCash,
    Expression<int>? branchId,
    Expression<int>? sandNumber,
    Expression<DateTime>? sandDate,
    Expression<int>? fundNumber,
    Expression<int>? currencyId,
    Expression<double>? currencyValue,
    Expression<String>? reciepentName,
    Expression<double>? totalAmount,
    Expression<String>? sandNote,
    Expression<String>? refNumber,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sandType != null) 'sand_type': sandType,
      if (isCash != null) 'is_cash': isCash,
      if (branchId != null) 'branch_id': branchId,
      if (sandNumber != null) 'sand_number': sandNumber,
      if (sandDate != null) 'sand_date': sandDate,
      if (fundNumber != null) 'fund_number': fundNumber,
      if (currencyId != null) 'currency_id': currencyId,
      if (currencyValue != null) 'currency_value': currencyValue,
      if (reciepentName != null) 'reciepent_name': reciepentName,
      if (totalAmount != null) 'total_amount': totalAmount,
      if (sandNote != null) 'sand_note': sandNote,
      if (refNumber != null) 'ref_number': refNumber,
    });
  }

  ExchangesTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? sandType,
      Value<bool>? isCash,
      Value<int>? branchId,
      Value<int>? sandNumber,
      Value<DateTime>? sandDate,
      Value<int>? fundNumber,
      Value<int>? currencyId,
      Value<double>? currencyValue,
      Value<String>? reciepentName,
      Value<double>? totalAmount,
      Value<String>? sandNote,
      Value<String>? refNumber}) {
    return ExchangesTableCompanion(
      id: id ?? this.id,
      sandType: sandType ?? this.sandType,
      isCash: isCash ?? this.isCash,
      branchId: branchId ?? this.branchId,
      sandNumber: sandNumber ?? this.sandNumber,
      sandDate: sandDate ?? this.sandDate,
      fundNumber: fundNumber ?? this.fundNumber,
      currencyId: currencyId ?? this.currencyId,
      currencyValue: currencyValue ?? this.currencyValue,
      reciepentName: reciepentName ?? this.reciepentName,
      totalAmount: totalAmount ?? this.totalAmount,
      sandNote: sandNote ?? this.sandNote,
      refNumber: refNumber ?? this.refNumber,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sandType.present) {
      map['sand_type'] = Variable<int>(sandType.value);
    }
    if (isCash.present) {
      map['is_cash'] = Variable<bool>(isCash.value);
    }
    if (branchId.present) {
      map['branch_id'] = Variable<int>(branchId.value);
    }
    if (sandNumber.present) {
      map['sand_number'] = Variable<int>(sandNumber.value);
    }
    if (sandDate.present) {
      map['sand_date'] = Variable<DateTime>(sandDate.value);
    }
    if (fundNumber.present) {
      map['fund_number'] = Variable<int>(fundNumber.value);
    }
    if (currencyId.present) {
      map['currency_id'] = Variable<int>(currencyId.value);
    }
    if (currencyValue.present) {
      map['currency_value'] = Variable<double>(currencyValue.value);
    }
    if (reciepentName.present) {
      map['reciepent_name'] = Variable<String>(reciepentName.value);
    }
    if (totalAmount.present) {
      map['total_amount'] = Variable<double>(totalAmount.value);
    }
    if (sandNote.present) {
      map['sand_note'] = Variable<String>(sandNote.value);
    }
    if (refNumber.present) {
      map['ref_number'] = Variable<String>(refNumber.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExchangesTableCompanion(')
          ..write('id: $id, ')
          ..write('sandType: $sandType, ')
          ..write('isCash: $isCash, ')
          ..write('branchId: $branchId, ')
          ..write('sandNumber: $sandNumber, ')
          ..write('sandDate: $sandDate, ')
          ..write('fundNumber: $fundNumber, ')
          ..write('currencyId: $currencyId, ')
          ..write('currencyValue: $currencyValue, ')
          ..write('reciepentName: $reciepentName, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('sandNote: $sandNote, ')
          ..write('refNumber: $refNumber')
          ..write(')'))
        .toString();
  }
}

class $SandDetailsTableTable extends SandDetailsTable
    with TableInfo<$SandDetailsTableTable, SandDetailEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SandDetailsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _sandIdMeta = const VerificationMeta('sandId');
  @override
  late final GeneratedColumn<int> sandId = GeneratedColumn<int>(
      'sand_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES exchanges_table (id)'));
  static const VerificationMeta _accNumberMeta =
      const VerificationMeta('accNumber');
  @override
  late final GeneratedColumn<int> accNumber = GeneratedColumn<int>(
      'acc_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _currencyIdMeta =
      const VerificationMeta('currencyId');
  @override
  late final GeneratedColumn<int> currencyId = GeneratedColumn<int>(
      'currency_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _currencyValueMeta =
      const VerificationMeta('currencyValue');
  @override
  late final GeneratedColumn<double> currencyValue = GeneratedColumn<double>(
      'currency_value', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, sandId, accNumber, amount, currencyId, currencyValue];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sand_details_table';
  @override
  VerificationContext validateIntegrity(Insertable<SandDetailEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('sand_id')) {
      context.handle(_sandIdMeta,
          sandId.isAcceptableOrUnknown(data['sand_id']!, _sandIdMeta));
    } else if (isInserting) {
      context.missing(_sandIdMeta);
    }
    if (data.containsKey('acc_number')) {
      context.handle(_accNumberMeta,
          accNumber.isAcceptableOrUnknown(data['acc_number']!, _accNumberMeta));
    } else if (isInserting) {
      context.missing(_accNumberMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('currency_id')) {
      context.handle(
          _currencyIdMeta,
          currencyId.isAcceptableOrUnknown(
              data['currency_id']!, _currencyIdMeta));
    } else if (isInserting) {
      context.missing(_currencyIdMeta);
    }
    if (data.containsKey('currency_value')) {
      context.handle(
          _currencyValueMeta,
          currencyValue.isAcceptableOrUnknown(
              data['currency_value']!, _currencyValueMeta));
    } else if (isInserting) {
      context.missing(_currencyValueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SandDetailEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SandDetailEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      sandId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sand_id'])!,
      accNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}acc_number'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      currencyId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}currency_id'])!,
      currencyValue: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}currency_value'])!,
    );
  }

  @override
  $SandDetailsTableTable createAlias(String alias) {
    return $SandDetailsTableTable(attachedDatabase, alias);
  }
}

class SandDetailsTableCompanion extends UpdateCompanion<SandDetailEntity> {
  final Value<int> id;
  final Value<int> sandId;
  final Value<int> accNumber;
  final Value<double> amount;
  final Value<int> currencyId;
  final Value<double> currencyValue;
  const SandDetailsTableCompanion({
    this.id = const Value.absent(),
    this.sandId = const Value.absent(),
    this.accNumber = const Value.absent(),
    this.amount = const Value.absent(),
    this.currencyId = const Value.absent(),
    this.currencyValue = const Value.absent(),
  });
  SandDetailsTableCompanion.insert({
    this.id = const Value.absent(),
    required int sandId,
    required int accNumber,
    required double amount,
    required int currencyId,
    required double currencyValue,
  })  : sandId = Value(sandId),
        accNumber = Value(accNumber),
        amount = Value(amount),
        currencyId = Value(currencyId),
        currencyValue = Value(currencyValue);
  static Insertable<SandDetailEntity> custom({
    Expression<int>? id,
    Expression<int>? sandId,
    Expression<int>? accNumber,
    Expression<double>? amount,
    Expression<int>? currencyId,
    Expression<double>? currencyValue,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sandId != null) 'sand_id': sandId,
      if (accNumber != null) 'acc_number': accNumber,
      if (amount != null) 'amount': amount,
      if (currencyId != null) 'currency_id': currencyId,
      if (currencyValue != null) 'currency_value': currencyValue,
    });
  }

  SandDetailsTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? sandId,
      Value<int>? accNumber,
      Value<double>? amount,
      Value<int>? currencyId,
      Value<double>? currencyValue}) {
    return SandDetailsTableCompanion(
      id: id ?? this.id,
      sandId: sandId ?? this.sandId,
      accNumber: accNumber ?? this.accNumber,
      amount: amount ?? this.amount,
      currencyId: currencyId ?? this.currencyId,
      currencyValue: currencyValue ?? this.currencyValue,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sandId.present) {
      map['sand_id'] = Variable<int>(sandId.value);
    }
    if (accNumber.present) {
      map['acc_number'] = Variable<int>(accNumber.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (currencyId.present) {
      map['currency_id'] = Variable<int>(currencyId.value);
    }
    if (currencyValue.present) {
      map['currency_value'] = Variable<double>(currencyValue.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SandDetailsTableCompanion(')
          ..write('id: $id, ')
          ..write('sandId: $sandId, ')
          ..write('accNumber: $accNumber, ')
          ..write('amount: $amount, ')
          ..write('currencyId: $currencyId, ')
          ..write('currencyValue: $currencyValue')
          ..write(')'))
        .toString();
  }
}

class $CheckOperationsTableTable extends CheckOperationsTable
    with TableInfo<$CheckOperationsTableTable, CheckOperationEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CheckOperationsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _sandIdMeta = const VerificationMeta('sandId');
  @override
  late final GeneratedColumn<int> sandId = GeneratedColumn<int>(
      'sand_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES exchanges_table (id)'));
  static const VerificationMeta _operationNumberMeta =
      const VerificationMeta('operationNumber');
  @override
  late final GeneratedColumn<String> operationNumber = GeneratedColumn<String>(
      'operation_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _operationDateMeta =
      const VerificationMeta('operationDate');
  @override
  late final GeneratedColumn<DateTime> operationDate =
      GeneratedColumn<DateTime>('operation_date', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _paymentMethedMeta =
      const VerificationMeta('paymentMethed');
  @override
  late final GeneratedColumn<int> paymentMethed = GeneratedColumn<int>(
      'payment_methed', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _operationStateMeta =
      const VerificationMeta('operationState');
  @override
  late final GeneratedColumn<bool> operationState = GeneratedColumn<bool>(
      'operation_state', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("operation_state" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        sandId,
        operationNumber,
        operationDate,
        paymentMethed,
        operationState
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'check_operations_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<CheckOperationEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('sand_id')) {
      context.handle(_sandIdMeta,
          sandId.isAcceptableOrUnknown(data['sand_id']!, _sandIdMeta));
    } else if (isInserting) {
      context.missing(_sandIdMeta);
    }
    if (data.containsKey('operation_number')) {
      context.handle(
          _operationNumberMeta,
          operationNumber.isAcceptableOrUnknown(
              data['operation_number']!, _operationNumberMeta));
    } else if (isInserting) {
      context.missing(_operationNumberMeta);
    }
    if (data.containsKey('operation_date')) {
      context.handle(
          _operationDateMeta,
          operationDate.isAcceptableOrUnknown(
              data['operation_date']!, _operationDateMeta));
    } else if (isInserting) {
      context.missing(_operationDateMeta);
    }
    if (data.containsKey('payment_methed')) {
      context.handle(
          _paymentMethedMeta,
          paymentMethed.isAcceptableOrUnknown(
              data['payment_methed']!, _paymentMethedMeta));
    } else if (isInserting) {
      context.missing(_paymentMethedMeta);
    }
    if (data.containsKey('operation_state')) {
      context.handle(
          _operationStateMeta,
          operationState.isAcceptableOrUnknown(
              data['operation_state']!, _operationStateMeta));
    } else if (isInserting) {
      context.missing(_operationStateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CheckOperationEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CheckOperationEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      sandId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sand_id'])!,
      operationNumber: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}operation_number'])!,
      operationDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}operation_date'])!,
      paymentMethed: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}payment_methed'])!,
      operationState: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}operation_state'])!,
    );
  }

  @override
  $CheckOperationsTableTable createAlias(String alias) {
    return $CheckOperationsTableTable(attachedDatabase, alias);
  }
}

class CheckOperationsTableCompanion
    extends UpdateCompanion<CheckOperationEntity> {
  final Value<int> id;
  final Value<int> sandId;
  final Value<String> operationNumber;
  final Value<DateTime> operationDate;
  final Value<int> paymentMethed;
  final Value<bool> operationState;
  const CheckOperationsTableCompanion({
    this.id = const Value.absent(),
    this.sandId = const Value.absent(),
    this.operationNumber = const Value.absent(),
    this.operationDate = const Value.absent(),
    this.paymentMethed = const Value.absent(),
    this.operationState = const Value.absent(),
  });
  CheckOperationsTableCompanion.insert({
    this.id = const Value.absent(),
    required int sandId,
    required String operationNumber,
    required DateTime operationDate,
    required int paymentMethed,
    required bool operationState,
  })  : sandId = Value(sandId),
        operationNumber = Value(operationNumber),
        operationDate = Value(operationDate),
        paymentMethed = Value(paymentMethed),
        operationState = Value(operationState);
  static Insertable<CheckOperationEntity> custom({
    Expression<int>? id,
    Expression<int>? sandId,
    Expression<String>? operationNumber,
    Expression<DateTime>? operationDate,
    Expression<int>? paymentMethed,
    Expression<bool>? operationState,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sandId != null) 'sand_id': sandId,
      if (operationNumber != null) 'operation_number': operationNumber,
      if (operationDate != null) 'operation_date': operationDate,
      if (paymentMethed != null) 'payment_methed': paymentMethed,
      if (operationState != null) 'operation_state': operationState,
    });
  }

  CheckOperationsTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? sandId,
      Value<String>? operationNumber,
      Value<DateTime>? operationDate,
      Value<int>? paymentMethed,
      Value<bool>? operationState}) {
    return CheckOperationsTableCompanion(
      id: id ?? this.id,
      sandId: sandId ?? this.sandId,
      operationNumber: operationNumber ?? this.operationNumber,
      operationDate: operationDate ?? this.operationDate,
      paymentMethed: paymentMethed ?? this.paymentMethed,
      operationState: operationState ?? this.operationState,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sandId.present) {
      map['sand_id'] = Variable<int>(sandId.value);
    }
    if (operationNumber.present) {
      map['operation_number'] = Variable<String>(operationNumber.value);
    }
    if (operationDate.present) {
      map['operation_date'] = Variable<DateTime>(operationDate.value);
    }
    if (paymentMethed.present) {
      map['payment_methed'] = Variable<int>(paymentMethed.value);
    }
    if (operationState.present) {
      map['operation_state'] = Variable<bool>(operationState.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CheckOperationsTableCompanion(')
          ..write('id: $id, ')
          ..write('sandId: $sandId, ')
          ..write('operationNumber: $operationNumber, ')
          ..write('operationDate: $operationDate, ')
          ..write('paymentMethed: $paymentMethed, ')
          ..write('operationState: $operationState')
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
  late final $ItemTableTable itemTable = $ItemTableTable(this);
  late final $ItemUnitTableTable itemUnitTable = $ItemUnitTableTable(this);
  late final $PaymentTableTable paymentTable = $PaymentTableTable(this);
  late final $SystemDocTableTable systemDocTable = $SystemDocTableTable(this);
  late final $UserSettingTableTable userSettingTable =
      $UserSettingTableTable(this);
  late final $ItemAlterTableTable itemAlterTable = $ItemAlterTableTable(this);
  late final $BarcodeTableTable barcodeTable = $BarcodeTableTable(this);
  late final $AccountTableTable accountTable = $AccountTableTable(this);
  late final $StoreOperationTableTable storeOperationTable =
      $StoreOperationTableTable(this);
  late final $BillTableTable billTable = $BillTableTable(this);
  late final $BillDetailsTableTable billDetailsTable =
      $BillDetailsTableTable(this);
  late final $AccountOperationTableTable accountOperationTable =
      $AccountOperationTableTable(this);
  late final $RefAccountTableTable refAccountTable =
      $RefAccountTableTable(this);
  late final $MidAccountTableTable midAccountTable =
      $MidAccountTableTable(this);
  late final $ExchangesTableTable exchangesTable = $ExchangesTableTable(this);
  late final $SandDetailsTableTable sandDetailsTable =
      $SandDetailsTableTable(this);
  late final $CheckOperationsTableTable checkOperationsTable =
      $CheckOperationsTableTable(this);
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
        itemTable,
        itemUnitTable,
        paymentTable,
        systemDocTable,
        userSettingTable,
        itemAlterTable,
        barcodeTable,
        accountTable,
        storeOperationTable,
        billTable,
        billDetailsTable,
        accountOperationTable,
        refAccountTable,
        midAccountTable,
        exchangesTable,
        sandDetailsTable,
        checkOperationsTable
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

  ComposableFilter itemUnitTableRefs(
      ComposableFilter Function($$ItemUnitTableTableFilterComposer f) f) {
    final $$ItemUnitTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.itemUnitTable,
        getReferencedColumn: (t) => t.itemUnitId,
        builder: (joinBuilder, parentComposers) =>
            $$ItemUnitTableTableFilterComposer(ComposerState($state.db,
                $state.db.itemUnitTable, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter storeOperationTableRefs(
      ComposableFilter Function($$StoreOperationTableTableFilterComposer f) f) {
    final $$StoreOperationTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.storeOperationTable,
            getReferencedColumn: (t) => t.unitId,
            builder: (joinBuilder, parentComposers) =>
                $$StoreOperationTableTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.storeOperationTable,
                    joinBuilder,
                    parentComposers)));
    return f(composer);
  }
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

  ComposableFilter itemTableRefs(
      ComposableFilter Function($$ItemTableTableFilterComposer f) f) {
    final $$ItemTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.itemTable,
        getReferencedColumn: (t) => t.itemGroupId,
        builder: (joinBuilder, parentComposers) =>
            $$ItemTableTableFilterComposer(ComposerState(
                $state.db, $state.db.itemTable, joinBuilder, parentComposers)));
    return f(composer);
  }
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

typedef $$ItemTableTableCreateCompanionBuilder = ItemTableCompanion Function({
  Value<int> id,
  required int itemGroupId,
  required int itemCode,
  required String name,
  required String enName,
  required int type,
  required int itemLimit,
  Value<Uint8List?> itemImage,
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
  Value<Uint8List?> itemImage,
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
            Value<Uint8List?> itemImage = const Value.absent(),
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
            Value<Uint8List?> itemImage = const Value.absent(),
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

  $$ItemGroupTableTableFilterComposer get itemGroupId {
    final $$ItemGroupTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.itemGroupId,
        referencedTable: $state.db.itemGroupTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ItemGroupTableTableFilterComposer(ComposerState($state.db,
                $state.db.itemGroupTable, joinBuilder, parentComposers)));
    return composer;
  }

  ComposableFilter itemUnitTableRefs(
      ComposableFilter Function($$ItemUnitTableTableFilterComposer f) f) {
    final $$ItemUnitTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.itemUnitTable,
        getReferencedColumn: (t) => t.itemId,
        builder: (joinBuilder, parentComposers) =>
            $$ItemUnitTableTableFilterComposer(ComposerState($state.db,
                $state.db.itemUnitTable, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter UniqueItemId(
      ComposableFilter Function($$ItemAlterTableTableFilterComposer f) f) {
    final $$ItemAlterTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.itemAlterTable,
        getReferencedColumn: (t) => t.itemId,
        builder: (joinBuilder, parentComposers) =>
            $$ItemAlterTableTableFilterComposer(ComposerState($state.db,
                $state.db.itemAlterTable, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter UniqueItemAlterId(
      ComposableFilter Function($$ItemAlterTableTableFilterComposer f) f) {
    final $$ItemAlterTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.itemAlterTable,
        getReferencedColumn: (t) => t.itemAlterId,
        builder: (joinBuilder, parentComposers) =>
            $$ItemAlterTableTableFilterComposer(ComposerState($state.db,
                $state.db.itemAlterTable, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter barcodeTableRefs(
      ComposableFilter Function($$BarcodeTableTableFilterComposer f) f) {
    final $$BarcodeTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.barcodeTable,
        getReferencedColumn: (t) => t.itemId,
        builder: (joinBuilder, parentComposers) =>
            $$BarcodeTableTableFilterComposer(ComposerState($state.db,
                $state.db.barcodeTable, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter storeOperationTableRefs(
      ComposableFilter Function($$StoreOperationTableTableFilterComposer f) f) {
    final $$StoreOperationTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.storeOperationTable,
            getReferencedColumn: (t) => t.itemId,
            builder: (joinBuilder, parentComposers) =>
                $$StoreOperationTableTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.storeOperationTable,
                    joinBuilder,
                    parentComposers)));
    return f(composer);
  }
}

class $$ItemTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ItemTableTable> {
  $$ItemTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
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

  $$ItemGroupTableTableOrderingComposer get itemGroupId {
    final $$ItemGroupTableTableOrderingComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.itemGroupId,
            referencedTable: $state.db.itemGroupTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$ItemGroupTableTableOrderingComposer(ComposerState($state.db,
                    $state.db.itemGroupTable, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$ItemUnitTableTableCreateCompanionBuilder = ItemUnitTableCompanion
    Function({
  Value<int> id,
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
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
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

  $$ItemTableTableFilterComposer get itemId {
    final $$ItemTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.itemId,
        referencedTable: $state.db.itemTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ItemTableTableFilterComposer(ComposerState(
                $state.db, $state.db.itemTable, joinBuilder, parentComposers)));
    return composer;
  }

  $$UnitTableTableFilterComposer get itemUnitId {
    final $$UnitTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.itemUnitId,
        referencedTable: $state.db.unitTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$UnitTableTableFilterComposer(ComposerState(
                $state.db, $state.db.unitTable, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$ItemUnitTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ItemUnitTableTable> {
  $$ItemUnitTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
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

  $$ItemTableTableOrderingComposer get itemId {
    final $$ItemTableTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.itemId,
        referencedTable: $state.db.itemTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ItemTableTableOrderingComposer(ComposerState(
                $state.db, $state.db.itemTable, joinBuilder, parentComposers)));
    return composer;
  }

  $$UnitTableTableOrderingComposer get itemUnitId {
    final $$UnitTableTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.itemUnitId,
        referencedTable: $state.db.unitTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$UnitTableTableOrderingComposer(ComposerState(
                $state.db, $state.db.unitTable, joinBuilder, parentComposers)));
    return composer;
  }
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

  ColumnFilters<int> get itemOrder => $state.composableBuilder(
      column: $state.table.itemOrder,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$ItemTableTableFilterComposer get itemId {
    final $$ItemTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.itemId,
        referencedTable: $state.db.itemTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ItemTableTableFilterComposer(ComposerState(
                $state.db, $state.db.itemTable, joinBuilder, parentComposers)));
    return composer;
  }

  $$ItemTableTableFilterComposer get itemAlterId {
    final $$ItemTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.itemAlterId,
        referencedTable: $state.db.itemTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ItemTableTableFilterComposer(ComposerState(
                $state.db, $state.db.itemTable, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$ItemAlterTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ItemAlterTableTable> {
  $$ItemAlterTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get itemOrder => $state.composableBuilder(
      column: $state.table.itemOrder,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$ItemTableTableOrderingComposer get itemId {
    final $$ItemTableTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.itemId,
        referencedTable: $state.db.itemTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ItemTableTableOrderingComposer(ComposerState(
                $state.db, $state.db.itemTable, joinBuilder, parentComposers)));
    return composer;
  }

  $$ItemTableTableOrderingComposer get itemAlterId {
    final $$ItemTableTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.itemAlterId,
        referencedTable: $state.db.itemTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ItemTableTableOrderingComposer(ComposerState(
                $state.db, $state.db.itemTable, joinBuilder, parentComposers)));
    return composer;
  }
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

  ColumnFilters<String> get itemBarcode => $state.composableBuilder(
      column: $state.table.itemBarcode,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$ItemTableTableFilterComposer get itemId {
    final $$ItemTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.itemId,
        referencedTable: $state.db.itemTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ItemTableTableFilterComposer(ComposerState(
                $state.db, $state.db.itemTable, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$BarcodeTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $BarcodeTableTable> {
  $$BarcodeTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get itemBarcode => $state.composableBuilder(
      column: $state.table.itemBarcode,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$ItemTableTableOrderingComposer get itemId {
    final $$ItemTableTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.itemId,
        referencedTable: $state.db.itemTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ItemTableTableOrderingComposer(ComposerState(
                $state.db, $state.db.itemTable, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$AccountTableTableCreateCompanionBuilder = AccountTableCompanion
    Function({
  Value<int> id,
  required int accNumber,
  required String accName,
  required int accParent,
  required int accType,
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

typedef $$StoreOperationTableTableCreateCompanionBuilder
    = StoreOperationTableCompanion Function({
  Value<int> id,
  required int operationId,
  required int operationType,
  required DateTime operationDate,
  required bool operationIn,
  required int storeId,
  required int itemId,
  required int unitId,
  required int quantity,
  required double averageCost,
  required double unitCost,
  required double totalCost,
  required int unitFactor,
  required int qtyConvert,
  required String expirDate,
  required int addBranch,
});
typedef $$StoreOperationTableTableUpdateCompanionBuilder
    = StoreOperationTableCompanion Function({
  Value<int> id,
  Value<int> operationId,
  Value<int> operationType,
  Value<DateTime> operationDate,
  Value<bool> operationIn,
  Value<int> storeId,
  Value<int> itemId,
  Value<int> unitId,
  Value<int> quantity,
  Value<double> averageCost,
  Value<double> unitCost,
  Value<double> totalCost,
  Value<int> unitFactor,
  Value<int> qtyConvert,
  Value<String> expirDate,
  Value<int> addBranch,
});

class $$StoreOperationTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $StoreOperationTableTable,
    StoreOperationModel,
    $$StoreOperationTableTableFilterComposer,
    $$StoreOperationTableTableOrderingComposer,
    $$StoreOperationTableTableCreateCompanionBuilder,
    $$StoreOperationTableTableUpdateCompanionBuilder> {
  $$StoreOperationTableTableTableManager(
      _$AppDatabase db, $StoreOperationTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$StoreOperationTableTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$StoreOperationTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> operationId = const Value.absent(),
            Value<int> operationType = const Value.absent(),
            Value<DateTime> operationDate = const Value.absent(),
            Value<bool> operationIn = const Value.absent(),
            Value<int> storeId = const Value.absent(),
            Value<int> itemId = const Value.absent(),
            Value<int> unitId = const Value.absent(),
            Value<int> quantity = const Value.absent(),
            Value<double> averageCost = const Value.absent(),
            Value<double> unitCost = const Value.absent(),
            Value<double> totalCost = const Value.absent(),
            Value<int> unitFactor = const Value.absent(),
            Value<int> qtyConvert = const Value.absent(),
            Value<String> expirDate = const Value.absent(),
            Value<int> addBranch = const Value.absent(),
          }) =>
              StoreOperationTableCompanion(
            id: id,
            operationId: operationId,
            operationType: operationType,
            operationDate: operationDate,
            operationIn: operationIn,
            storeId: storeId,
            itemId: itemId,
            unitId: unitId,
            quantity: quantity,
            averageCost: averageCost,
            unitCost: unitCost,
            totalCost: totalCost,
            unitFactor: unitFactor,
            qtyConvert: qtyConvert,
            expirDate: expirDate,
            addBranch: addBranch,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int operationId,
            required int operationType,
            required DateTime operationDate,
            required bool operationIn,
            required int storeId,
            required int itemId,
            required int unitId,
            required int quantity,
            required double averageCost,
            required double unitCost,
            required double totalCost,
            required int unitFactor,
            required int qtyConvert,
            required String expirDate,
            required int addBranch,
          }) =>
              StoreOperationTableCompanion.insert(
            id: id,
            operationId: operationId,
            operationType: operationType,
            operationDate: operationDate,
            operationIn: operationIn,
            storeId: storeId,
            itemId: itemId,
            unitId: unitId,
            quantity: quantity,
            averageCost: averageCost,
            unitCost: unitCost,
            totalCost: totalCost,
            unitFactor: unitFactor,
            qtyConvert: qtyConvert,
            expirDate: expirDate,
            addBranch: addBranch,
          ),
        ));
}

class $$StoreOperationTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $StoreOperationTableTable> {
  $$StoreOperationTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get operationId => $state.composableBuilder(
      column: $state.table.operationId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get operationType => $state.composableBuilder(
      column: $state.table.operationType,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get operationDate => $state.composableBuilder(
      column: $state.table.operationDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get operationIn => $state.composableBuilder(
      column: $state.table.operationIn,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get storeId => $state.composableBuilder(
      column: $state.table.storeId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get quantity => $state.composableBuilder(
      column: $state.table.quantity,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get averageCost => $state.composableBuilder(
      column: $state.table.averageCost,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get unitCost => $state.composableBuilder(
      column: $state.table.unitCost,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get totalCost => $state.composableBuilder(
      column: $state.table.totalCost,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get unitFactor => $state.composableBuilder(
      column: $state.table.unitFactor,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get qtyConvert => $state.composableBuilder(
      column: $state.table.qtyConvert,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get expirDate => $state.composableBuilder(
      column: $state.table.expirDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get addBranch => $state.composableBuilder(
      column: $state.table.addBranch,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$ItemTableTableFilterComposer get itemId {
    final $$ItemTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.itemId,
        referencedTable: $state.db.itemTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ItemTableTableFilterComposer(ComposerState(
                $state.db, $state.db.itemTable, joinBuilder, parentComposers)));
    return composer;
  }

  $$UnitTableTableFilterComposer get unitId {
    final $$UnitTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.unitId,
        referencedTable: $state.db.unitTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$UnitTableTableFilterComposer(ComposerState(
                $state.db, $state.db.unitTable, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$StoreOperationTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $StoreOperationTableTable> {
  $$StoreOperationTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get operationId => $state.composableBuilder(
      column: $state.table.operationId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get operationType => $state.composableBuilder(
      column: $state.table.operationType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get operationDate => $state.composableBuilder(
      column: $state.table.operationDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get operationIn => $state.composableBuilder(
      column: $state.table.operationIn,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get storeId => $state.composableBuilder(
      column: $state.table.storeId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get quantity => $state.composableBuilder(
      column: $state.table.quantity,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get averageCost => $state.composableBuilder(
      column: $state.table.averageCost,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get unitCost => $state.composableBuilder(
      column: $state.table.unitCost,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get totalCost => $state.composableBuilder(
      column: $state.table.totalCost,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get unitFactor => $state.composableBuilder(
      column: $state.table.unitFactor,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get qtyConvert => $state.composableBuilder(
      column: $state.table.qtyConvert,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get expirDate => $state.composableBuilder(
      column: $state.table.expirDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get addBranch => $state.composableBuilder(
      column: $state.table.addBranch,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$ItemTableTableOrderingComposer get itemId {
    final $$ItemTableTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.itemId,
        referencedTable: $state.db.itemTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ItemTableTableOrderingComposer(ComposerState(
                $state.db, $state.db.itemTable, joinBuilder, parentComposers)));
    return composer;
  }

  $$UnitTableTableOrderingComposer get unitId {
    final $$UnitTableTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.unitId,
        referencedTable: $state.db.unitTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$UnitTableTableOrderingComposer(ComposerState(
                $state.db, $state.db.unitTable, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$BillTableTableCreateCompanionBuilder = BillTableCompanion Function({
  Value<int> id,
  required int branchId,
  required int billNumber,
  required int billType,
  required DateTime billDate,
  required String refNumber,
  required int customerNumber,
  required int currencyId,
  required double currencyValue,
  required int fundNumber,
  required int paymentMethed,
  required int storeId,
  required double storeCurValue,
  required String billNote,
  required int itemCalcMethod,
  required DateTime dueDate,
  required int salesPerson,
  required bool hasVat,
  required bool hasSalesTax,
  required double salesTaxRate,
  required int numOfitems,
  required double totalBill,
  required double itemsDiscount,
  required double billDiscount,
  required double netBill,
  required double totalVat,
  required double billFinalCost,
  required double freeQtyCost,
  required double totalAvragCost,
  required double paidAmount,
});
typedef $$BillTableTableUpdateCompanionBuilder = BillTableCompanion Function({
  Value<int> id,
  Value<int> branchId,
  Value<int> billNumber,
  Value<int> billType,
  Value<DateTime> billDate,
  Value<String> refNumber,
  Value<int> customerNumber,
  Value<int> currencyId,
  Value<double> currencyValue,
  Value<int> fundNumber,
  Value<int> paymentMethed,
  Value<int> storeId,
  Value<double> storeCurValue,
  Value<String> billNote,
  Value<int> itemCalcMethod,
  Value<DateTime> dueDate,
  Value<int> salesPerson,
  Value<bool> hasVat,
  Value<bool> hasSalesTax,
  Value<double> salesTaxRate,
  Value<int> numOfitems,
  Value<double> totalBill,
  Value<double> itemsDiscount,
  Value<double> billDiscount,
  Value<double> netBill,
  Value<double> totalVat,
  Value<double> billFinalCost,
  Value<double> freeQtyCost,
  Value<double> totalAvragCost,
  Value<double> paidAmount,
});

class $$BillTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BillTableTable,
    BillModel,
    $$BillTableTableFilterComposer,
    $$BillTableTableOrderingComposer,
    $$BillTableTableCreateCompanionBuilder,
    $$BillTableTableUpdateCompanionBuilder> {
  $$BillTableTableTableManager(_$AppDatabase db, $BillTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$BillTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$BillTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> branchId = const Value.absent(),
            Value<int> billNumber = const Value.absent(),
            Value<int> billType = const Value.absent(),
            Value<DateTime> billDate = const Value.absent(),
            Value<String> refNumber = const Value.absent(),
            Value<int> customerNumber = const Value.absent(),
            Value<int> currencyId = const Value.absent(),
            Value<double> currencyValue = const Value.absent(),
            Value<int> fundNumber = const Value.absent(),
            Value<int> paymentMethed = const Value.absent(),
            Value<int> storeId = const Value.absent(),
            Value<double> storeCurValue = const Value.absent(),
            Value<String> billNote = const Value.absent(),
            Value<int> itemCalcMethod = const Value.absent(),
            Value<DateTime> dueDate = const Value.absent(),
            Value<int> salesPerson = const Value.absent(),
            Value<bool> hasVat = const Value.absent(),
            Value<bool> hasSalesTax = const Value.absent(),
            Value<double> salesTaxRate = const Value.absent(),
            Value<int> numOfitems = const Value.absent(),
            Value<double> totalBill = const Value.absent(),
            Value<double> itemsDiscount = const Value.absent(),
            Value<double> billDiscount = const Value.absent(),
            Value<double> netBill = const Value.absent(),
            Value<double> totalVat = const Value.absent(),
            Value<double> billFinalCost = const Value.absent(),
            Value<double> freeQtyCost = const Value.absent(),
            Value<double> totalAvragCost = const Value.absent(),
            Value<double> paidAmount = const Value.absent(),
          }) =>
              BillTableCompanion(
            id: id,
            branchId: branchId,
            billNumber: billNumber,
            billType: billType,
            billDate: billDate,
            refNumber: refNumber,
            customerNumber: customerNumber,
            currencyId: currencyId,
            currencyValue: currencyValue,
            fundNumber: fundNumber,
            paymentMethed: paymentMethed,
            storeId: storeId,
            storeCurValue: storeCurValue,
            billNote: billNote,
            itemCalcMethod: itemCalcMethod,
            dueDate: dueDate,
            salesPerson: salesPerson,
            hasVat: hasVat,
            hasSalesTax: hasSalesTax,
            salesTaxRate: salesTaxRate,
            numOfitems: numOfitems,
            totalBill: totalBill,
            itemsDiscount: itemsDiscount,
            billDiscount: billDiscount,
            netBill: netBill,
            totalVat: totalVat,
            billFinalCost: billFinalCost,
            freeQtyCost: freeQtyCost,
            totalAvragCost: totalAvragCost,
            paidAmount: paidAmount,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int branchId,
            required int billNumber,
            required int billType,
            required DateTime billDate,
            required String refNumber,
            required int customerNumber,
            required int currencyId,
            required double currencyValue,
            required int fundNumber,
            required int paymentMethed,
            required int storeId,
            required double storeCurValue,
            required String billNote,
            required int itemCalcMethod,
            required DateTime dueDate,
            required int salesPerson,
            required bool hasVat,
            required bool hasSalesTax,
            required double salesTaxRate,
            required int numOfitems,
            required double totalBill,
            required double itemsDiscount,
            required double billDiscount,
            required double netBill,
            required double totalVat,
            required double billFinalCost,
            required double freeQtyCost,
            required double totalAvragCost,
            required double paidAmount,
          }) =>
              BillTableCompanion.insert(
            id: id,
            branchId: branchId,
            billNumber: billNumber,
            billType: billType,
            billDate: billDate,
            refNumber: refNumber,
            customerNumber: customerNumber,
            currencyId: currencyId,
            currencyValue: currencyValue,
            fundNumber: fundNumber,
            paymentMethed: paymentMethed,
            storeId: storeId,
            storeCurValue: storeCurValue,
            billNote: billNote,
            itemCalcMethod: itemCalcMethod,
            dueDate: dueDate,
            salesPerson: salesPerson,
            hasVat: hasVat,
            hasSalesTax: hasSalesTax,
            salesTaxRate: salesTaxRate,
            numOfitems: numOfitems,
            totalBill: totalBill,
            itemsDiscount: itemsDiscount,
            billDiscount: billDiscount,
            netBill: netBill,
            totalVat: totalVat,
            billFinalCost: billFinalCost,
            freeQtyCost: freeQtyCost,
            totalAvragCost: totalAvragCost,
            paidAmount: paidAmount,
          ),
        ));
}

class $$BillTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $BillTableTable> {
  $$BillTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get branchId => $state.composableBuilder(
      column: $state.table.branchId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get billNumber => $state.composableBuilder(
      column: $state.table.billNumber,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get billType => $state.composableBuilder(
      column: $state.table.billType,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get billDate => $state.composableBuilder(
      column: $state.table.billDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get refNumber => $state.composableBuilder(
      column: $state.table.refNumber,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get customerNumber => $state.composableBuilder(
      column: $state.table.customerNumber,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get currencyId => $state.composableBuilder(
      column: $state.table.currencyId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get currencyValue => $state.composableBuilder(
      column: $state.table.currencyValue,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get fundNumber => $state.composableBuilder(
      column: $state.table.fundNumber,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get paymentMethed => $state.composableBuilder(
      column: $state.table.paymentMethed,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get storeId => $state.composableBuilder(
      column: $state.table.storeId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get storeCurValue => $state.composableBuilder(
      column: $state.table.storeCurValue,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get billNote => $state.composableBuilder(
      column: $state.table.billNote,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get itemCalcMethod => $state.composableBuilder(
      column: $state.table.itemCalcMethod,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get dueDate => $state.composableBuilder(
      column: $state.table.dueDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get salesPerson => $state.composableBuilder(
      column: $state.table.salesPerson,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get hasVat => $state.composableBuilder(
      column: $state.table.hasVat,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get hasSalesTax => $state.composableBuilder(
      column: $state.table.hasSalesTax,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get salesTaxRate => $state.composableBuilder(
      column: $state.table.salesTaxRate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get numOfitems => $state.composableBuilder(
      column: $state.table.numOfitems,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get totalBill => $state.composableBuilder(
      column: $state.table.totalBill,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get itemsDiscount => $state.composableBuilder(
      column: $state.table.itemsDiscount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get billDiscount => $state.composableBuilder(
      column: $state.table.billDiscount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get netBill => $state.composableBuilder(
      column: $state.table.netBill,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get totalVat => $state.composableBuilder(
      column: $state.table.totalVat,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get billFinalCost => $state.composableBuilder(
      column: $state.table.billFinalCost,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get freeQtyCost => $state.composableBuilder(
      column: $state.table.freeQtyCost,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get totalAvragCost => $state.composableBuilder(
      column: $state.table.totalAvragCost,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get paidAmount => $state.composableBuilder(
      column: $state.table.paidAmount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$BillTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $BillTableTable> {
  $$BillTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get branchId => $state.composableBuilder(
      column: $state.table.branchId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get billNumber => $state.composableBuilder(
      column: $state.table.billNumber,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get billType => $state.composableBuilder(
      column: $state.table.billType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get billDate => $state.composableBuilder(
      column: $state.table.billDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get refNumber => $state.composableBuilder(
      column: $state.table.refNumber,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get customerNumber => $state.composableBuilder(
      column: $state.table.customerNumber,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get currencyId => $state.composableBuilder(
      column: $state.table.currencyId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get currencyValue => $state.composableBuilder(
      column: $state.table.currencyValue,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get fundNumber => $state.composableBuilder(
      column: $state.table.fundNumber,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get paymentMethed => $state.composableBuilder(
      column: $state.table.paymentMethed,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get storeId => $state.composableBuilder(
      column: $state.table.storeId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get storeCurValue => $state.composableBuilder(
      column: $state.table.storeCurValue,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get billNote => $state.composableBuilder(
      column: $state.table.billNote,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get itemCalcMethod => $state.composableBuilder(
      column: $state.table.itemCalcMethod,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get dueDate => $state.composableBuilder(
      column: $state.table.dueDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get salesPerson => $state.composableBuilder(
      column: $state.table.salesPerson,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get hasVat => $state.composableBuilder(
      column: $state.table.hasVat,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get hasSalesTax => $state.composableBuilder(
      column: $state.table.hasSalesTax,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get salesTaxRate => $state.composableBuilder(
      column: $state.table.salesTaxRate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get numOfitems => $state.composableBuilder(
      column: $state.table.numOfitems,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get totalBill => $state.composableBuilder(
      column: $state.table.totalBill,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get itemsDiscount => $state.composableBuilder(
      column: $state.table.itemsDiscount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get billDiscount => $state.composableBuilder(
      column: $state.table.billDiscount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get netBill => $state.composableBuilder(
      column: $state.table.netBill,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get totalVat => $state.composableBuilder(
      column: $state.table.totalVat,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get billFinalCost => $state.composableBuilder(
      column: $state.table.billFinalCost,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get freeQtyCost => $state.composableBuilder(
      column: $state.table.freeQtyCost,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get totalAvragCost => $state.composableBuilder(
      column: $state.table.totalAvragCost,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get paidAmount => $state.composableBuilder(
      column: $state.table.paidAmount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$BillDetailsTableTableCreateCompanionBuilder
    = BillDetailsTableCompanion Function({
  Value<int> id,
  required int billID,
  required int itemId,
  required int itemUnitID,
  required int unitFactor,
  required int quantity,
  required int freeQty,
  required double avrageCost,
  required double sellPrice,
  required double totalSellPrice,
  required double discountPre,
  required double netSellPrice,
  Value<String?> expirDate,
  required double taxRate,
  required String itemNote,
  required double freeQtyCost,
});
typedef $$BillDetailsTableTableUpdateCompanionBuilder
    = BillDetailsTableCompanion Function({
  Value<int> id,
  Value<int> billID,
  Value<int> itemId,
  Value<int> itemUnitID,
  Value<int> unitFactor,
  Value<int> quantity,
  Value<int> freeQty,
  Value<double> avrageCost,
  Value<double> sellPrice,
  Value<double> totalSellPrice,
  Value<double> discountPre,
  Value<double> netSellPrice,
  Value<String?> expirDate,
  Value<double> taxRate,
  Value<String> itemNote,
  Value<double> freeQtyCost,
});

class $$BillDetailsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BillDetailsTableTable,
    BillDetailsModel,
    $$BillDetailsTableTableFilterComposer,
    $$BillDetailsTableTableOrderingComposer,
    $$BillDetailsTableTableCreateCompanionBuilder,
    $$BillDetailsTableTableUpdateCompanionBuilder> {
  $$BillDetailsTableTableTableManager(
      _$AppDatabase db, $BillDetailsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$BillDetailsTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$BillDetailsTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> billID = const Value.absent(),
            Value<int> itemId = const Value.absent(),
            Value<int> itemUnitID = const Value.absent(),
            Value<int> unitFactor = const Value.absent(),
            Value<int> quantity = const Value.absent(),
            Value<int> freeQty = const Value.absent(),
            Value<double> avrageCost = const Value.absent(),
            Value<double> sellPrice = const Value.absent(),
            Value<double> totalSellPrice = const Value.absent(),
            Value<double> discountPre = const Value.absent(),
            Value<double> netSellPrice = const Value.absent(),
            Value<String?> expirDate = const Value.absent(),
            Value<double> taxRate = const Value.absent(),
            Value<String> itemNote = const Value.absent(),
            Value<double> freeQtyCost = const Value.absent(),
          }) =>
              BillDetailsTableCompanion(
            id: id,
            billID: billID,
            itemId: itemId,
            itemUnitID: itemUnitID,
            unitFactor: unitFactor,
            quantity: quantity,
            freeQty: freeQty,
            avrageCost: avrageCost,
            sellPrice: sellPrice,
            totalSellPrice: totalSellPrice,
            discountPre: discountPre,
            netSellPrice: netSellPrice,
            expirDate: expirDate,
            taxRate: taxRate,
            itemNote: itemNote,
            freeQtyCost: freeQtyCost,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int billID,
            required int itemId,
            required int itemUnitID,
            required int unitFactor,
            required int quantity,
            required int freeQty,
            required double avrageCost,
            required double sellPrice,
            required double totalSellPrice,
            required double discountPre,
            required double netSellPrice,
            Value<String?> expirDate = const Value.absent(),
            required double taxRate,
            required String itemNote,
            required double freeQtyCost,
          }) =>
              BillDetailsTableCompanion.insert(
            id: id,
            billID: billID,
            itemId: itemId,
            itemUnitID: itemUnitID,
            unitFactor: unitFactor,
            quantity: quantity,
            freeQty: freeQty,
            avrageCost: avrageCost,
            sellPrice: sellPrice,
            totalSellPrice: totalSellPrice,
            discountPre: discountPre,
            netSellPrice: netSellPrice,
            expirDate: expirDate,
            taxRate: taxRate,
            itemNote: itemNote,
            freeQtyCost: freeQtyCost,
          ),
        ));
}

class $$BillDetailsTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $BillDetailsTableTable> {
  $$BillDetailsTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get billID => $state.composableBuilder(
      column: $state.table.billID,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get itemId => $state.composableBuilder(
      column: $state.table.itemId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get itemUnitID => $state.composableBuilder(
      column: $state.table.itemUnitID,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get unitFactor => $state.composableBuilder(
      column: $state.table.unitFactor,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get quantity => $state.composableBuilder(
      column: $state.table.quantity,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get freeQty => $state.composableBuilder(
      column: $state.table.freeQty,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get avrageCost => $state.composableBuilder(
      column: $state.table.avrageCost,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get sellPrice => $state.composableBuilder(
      column: $state.table.sellPrice,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get totalSellPrice => $state.composableBuilder(
      column: $state.table.totalSellPrice,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get discountPre => $state.composableBuilder(
      column: $state.table.discountPre,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get netSellPrice => $state.composableBuilder(
      column: $state.table.netSellPrice,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get expirDate => $state.composableBuilder(
      column: $state.table.expirDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get taxRate => $state.composableBuilder(
      column: $state.table.taxRate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get itemNote => $state.composableBuilder(
      column: $state.table.itemNote,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get freeQtyCost => $state.composableBuilder(
      column: $state.table.freeQtyCost,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$BillDetailsTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $BillDetailsTableTable> {
  $$BillDetailsTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get billID => $state.composableBuilder(
      column: $state.table.billID,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get itemId => $state.composableBuilder(
      column: $state.table.itemId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get itemUnitID => $state.composableBuilder(
      column: $state.table.itemUnitID,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get unitFactor => $state.composableBuilder(
      column: $state.table.unitFactor,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get quantity => $state.composableBuilder(
      column: $state.table.quantity,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get freeQty => $state.composableBuilder(
      column: $state.table.freeQty,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get avrageCost => $state.composableBuilder(
      column: $state.table.avrageCost,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get sellPrice => $state.composableBuilder(
      column: $state.table.sellPrice,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get totalSellPrice => $state.composableBuilder(
      column: $state.table.totalSellPrice,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get discountPre => $state.composableBuilder(
      column: $state.table.discountPre,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get netSellPrice => $state.composableBuilder(
      column: $state.table.netSellPrice,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get expirDate => $state.composableBuilder(
      column: $state.table.expirDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get taxRate => $state.composableBuilder(
      column: $state.table.taxRate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get itemNote => $state.composableBuilder(
      column: $state.table.itemNote,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get freeQtyCost => $state.composableBuilder(
      column: $state.table.freeQtyCost,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$AccountOperationTableTableCreateCompanionBuilder
    = AccountOperationTableCompanion Function({
  Value<int> id,
  required DateTime operationDate,
  required int operationType,
  required int operationId,
  required String operationRef,
  required int accountNumber,
  required double operationDebit,
  required double operationCredit,
  required int currencyId,
  required double currencyValue,
  required String operationStatement,
});
typedef $$AccountOperationTableTableUpdateCompanionBuilder
    = AccountOperationTableCompanion Function({
  Value<int> id,
  Value<DateTime> operationDate,
  Value<int> operationType,
  Value<int> operationId,
  Value<String> operationRef,
  Value<int> accountNumber,
  Value<double> operationDebit,
  Value<double> operationCredit,
  Value<int> currencyId,
  Value<double> currencyValue,
  Value<String> operationStatement,
});

class $$AccountOperationTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AccountOperationTableTable,
    AccountOperationModel,
    $$AccountOperationTableTableFilterComposer,
    $$AccountOperationTableTableOrderingComposer,
    $$AccountOperationTableTableCreateCompanionBuilder,
    $$AccountOperationTableTableUpdateCompanionBuilder> {
  $$AccountOperationTableTableTableManager(
      _$AppDatabase db, $AccountOperationTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$AccountOperationTableTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$AccountOperationTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> operationDate = const Value.absent(),
            Value<int> operationType = const Value.absent(),
            Value<int> operationId = const Value.absent(),
            Value<String> operationRef = const Value.absent(),
            Value<int> accountNumber = const Value.absent(),
            Value<double> operationDebit = const Value.absent(),
            Value<double> operationCredit = const Value.absent(),
            Value<int> currencyId = const Value.absent(),
            Value<double> currencyValue = const Value.absent(),
            Value<String> operationStatement = const Value.absent(),
          }) =>
              AccountOperationTableCompanion(
            id: id,
            operationDate: operationDate,
            operationType: operationType,
            operationId: operationId,
            operationRef: operationRef,
            accountNumber: accountNumber,
            operationDebit: operationDebit,
            operationCredit: operationCredit,
            currencyId: currencyId,
            currencyValue: currencyValue,
            operationStatement: operationStatement,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required DateTime operationDate,
            required int operationType,
            required int operationId,
            required String operationRef,
            required int accountNumber,
            required double operationDebit,
            required double operationCredit,
            required int currencyId,
            required double currencyValue,
            required String operationStatement,
          }) =>
              AccountOperationTableCompanion.insert(
            id: id,
            operationDate: operationDate,
            operationType: operationType,
            operationId: operationId,
            operationRef: operationRef,
            accountNumber: accountNumber,
            operationDebit: operationDebit,
            operationCredit: operationCredit,
            currencyId: currencyId,
            currencyValue: currencyValue,
            operationStatement: operationStatement,
          ),
        ));
}

class $$AccountOperationTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $AccountOperationTableTable> {
  $$AccountOperationTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get operationDate => $state.composableBuilder(
      column: $state.table.operationDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get operationType => $state.composableBuilder(
      column: $state.table.operationType,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get operationId => $state.composableBuilder(
      column: $state.table.operationId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get operationRef => $state.composableBuilder(
      column: $state.table.operationRef,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get accountNumber => $state.composableBuilder(
      column: $state.table.accountNumber,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get operationDebit => $state.composableBuilder(
      column: $state.table.operationDebit,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get operationCredit => $state.composableBuilder(
      column: $state.table.operationCredit,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get currencyId => $state.composableBuilder(
      column: $state.table.currencyId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get currencyValue => $state.composableBuilder(
      column: $state.table.currencyValue,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get operationStatement => $state.composableBuilder(
      column: $state.table.operationStatement,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$AccountOperationTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $AccountOperationTableTable> {
  $$AccountOperationTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get operationDate => $state.composableBuilder(
      column: $state.table.operationDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get operationType => $state.composableBuilder(
      column: $state.table.operationType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get operationId => $state.composableBuilder(
      column: $state.table.operationId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get operationRef => $state.composableBuilder(
      column: $state.table.operationRef,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get accountNumber => $state.composableBuilder(
      column: $state.table.accountNumber,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get operationDebit => $state.composableBuilder(
      column: $state.table.operationDebit,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get operationCredit => $state.composableBuilder(
      column: $state.table.operationCredit,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get currencyId => $state.composableBuilder(
      column: $state.table.currencyId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get currencyValue => $state.composableBuilder(
      column: $state.table.currencyValue,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get operationStatement => $state.composableBuilder(
      column: $state.table.operationStatement,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$RefAccountTableTableCreateCompanionBuilder = RefAccountTableCompanion
    Function({
  Value<int> id,
  required int accTag,
  required String accName,
  required int accNumber,
});
typedef $$RefAccountTableTableUpdateCompanionBuilder = RefAccountTableCompanion
    Function({
  Value<int> id,
  Value<int> accTag,
  Value<String> accName,
  Value<int> accNumber,
});

class $$RefAccountTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RefAccountTableTable,
    RefAccountModel,
    $$RefAccountTableTableFilterComposer,
    $$RefAccountTableTableOrderingComposer,
    $$RefAccountTableTableCreateCompanionBuilder,
    $$RefAccountTableTableUpdateCompanionBuilder> {
  $$RefAccountTableTableTableManager(
      _$AppDatabase db, $RefAccountTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$RefAccountTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$RefAccountTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> accTag = const Value.absent(),
            Value<String> accName = const Value.absent(),
            Value<int> accNumber = const Value.absent(),
          }) =>
              RefAccountTableCompanion(
            id: id,
            accTag: accTag,
            accName: accName,
            accNumber: accNumber,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int accTag,
            required String accName,
            required int accNumber,
          }) =>
              RefAccountTableCompanion.insert(
            id: id,
            accTag: accTag,
            accName: accName,
            accNumber: accNumber,
          ),
        ));
}

class $$RefAccountTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $RefAccountTableTable> {
  $$RefAccountTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get accTag => $state.composableBuilder(
      column: $state.table.accTag,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get accName => $state.composableBuilder(
      column: $state.table.accName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get accNumber => $state.composableBuilder(
      column: $state.table.accNumber,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$RefAccountTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $RefAccountTableTable> {
  $$RefAccountTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get accTag => $state.composableBuilder(
      column: $state.table.accTag,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get accName => $state.composableBuilder(
      column: $state.table.accName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get accNumber => $state.composableBuilder(
      column: $state.table.accNumber,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$MidAccountTableTableCreateCompanionBuilder = MidAccountTableCompanion
    Function({
  Value<int> id,
  required int accTag,
  required String accName,
  required int accNumber,
  required int branchId,
});
typedef $$MidAccountTableTableUpdateCompanionBuilder = MidAccountTableCompanion
    Function({
  Value<int> id,
  Value<int> accTag,
  Value<String> accName,
  Value<int> accNumber,
  Value<int> branchId,
});

class $$MidAccountTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MidAccountTableTable,
    MidAccountModel,
    $$MidAccountTableTableFilterComposer,
    $$MidAccountTableTableOrderingComposer,
    $$MidAccountTableTableCreateCompanionBuilder,
    $$MidAccountTableTableUpdateCompanionBuilder> {
  $$MidAccountTableTableTableManager(
      _$AppDatabase db, $MidAccountTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$MidAccountTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$MidAccountTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> accTag = const Value.absent(),
            Value<String> accName = const Value.absent(),
            Value<int> accNumber = const Value.absent(),
            Value<int> branchId = const Value.absent(),
          }) =>
              MidAccountTableCompanion(
            id: id,
            accTag: accTag,
            accName: accName,
            accNumber: accNumber,
            branchId: branchId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int accTag,
            required String accName,
            required int accNumber,
            required int branchId,
          }) =>
              MidAccountTableCompanion.insert(
            id: id,
            accTag: accTag,
            accName: accName,
            accNumber: accNumber,
            branchId: branchId,
          ),
        ));
}

class $$MidAccountTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $MidAccountTableTable> {
  $$MidAccountTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get accTag => $state.composableBuilder(
      column: $state.table.accTag,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get accName => $state.composableBuilder(
      column: $state.table.accName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get accNumber => $state.composableBuilder(
      column: $state.table.accNumber,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get branchId => $state.composableBuilder(
      column: $state.table.branchId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$MidAccountTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $MidAccountTableTable> {
  $$MidAccountTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get accTag => $state.composableBuilder(
      column: $state.table.accTag,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get accName => $state.composableBuilder(
      column: $state.table.accName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get accNumber => $state.composableBuilder(
      column: $state.table.accNumber,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get branchId => $state.composableBuilder(
      column: $state.table.branchId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$ExchangesTableTableCreateCompanionBuilder = ExchangesTableCompanion
    Function({
  Value<int> id,
  required int sandType,
  required bool isCash,
  required int branchId,
  required int sandNumber,
  required DateTime sandDate,
  required int fundNumber,
  required int currencyId,
  required double currencyValue,
  required String reciepentName,
  required double totalAmount,
  required String sandNote,
  required String refNumber,
});
typedef $$ExchangesTableTableUpdateCompanionBuilder = ExchangesTableCompanion
    Function({
  Value<int> id,
  Value<int> sandType,
  Value<bool> isCash,
  Value<int> branchId,
  Value<int> sandNumber,
  Value<DateTime> sandDate,
  Value<int> fundNumber,
  Value<int> currencyId,
  Value<double> currencyValue,
  Value<String> reciepentName,
  Value<double> totalAmount,
  Value<String> sandNote,
  Value<String> refNumber,
});

class $$ExchangesTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ExchangesTableTable,
    ExchangeModel,
    $$ExchangesTableTableFilterComposer,
    $$ExchangesTableTableOrderingComposer,
    $$ExchangesTableTableCreateCompanionBuilder,
    $$ExchangesTableTableUpdateCompanionBuilder> {
  $$ExchangesTableTableTableManager(
      _$AppDatabase db, $ExchangesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ExchangesTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ExchangesTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> sandType = const Value.absent(),
            Value<bool> isCash = const Value.absent(),
            Value<int> branchId = const Value.absent(),
            Value<int> sandNumber = const Value.absent(),
            Value<DateTime> sandDate = const Value.absent(),
            Value<int> fundNumber = const Value.absent(),
            Value<int> currencyId = const Value.absent(),
            Value<double> currencyValue = const Value.absent(),
            Value<String> reciepentName = const Value.absent(),
            Value<double> totalAmount = const Value.absent(),
            Value<String> sandNote = const Value.absent(),
            Value<String> refNumber = const Value.absent(),
          }) =>
              ExchangesTableCompanion(
            id: id,
            sandType: sandType,
            isCash: isCash,
            branchId: branchId,
            sandNumber: sandNumber,
            sandDate: sandDate,
            fundNumber: fundNumber,
            currencyId: currencyId,
            currencyValue: currencyValue,
            reciepentName: reciepentName,
            totalAmount: totalAmount,
            sandNote: sandNote,
            refNumber: refNumber,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int sandType,
            required bool isCash,
            required int branchId,
            required int sandNumber,
            required DateTime sandDate,
            required int fundNumber,
            required int currencyId,
            required double currencyValue,
            required String reciepentName,
            required double totalAmount,
            required String sandNote,
            required String refNumber,
          }) =>
              ExchangesTableCompanion.insert(
            id: id,
            sandType: sandType,
            isCash: isCash,
            branchId: branchId,
            sandNumber: sandNumber,
            sandDate: sandDate,
            fundNumber: fundNumber,
            currencyId: currencyId,
            currencyValue: currencyValue,
            reciepentName: reciepentName,
            totalAmount: totalAmount,
            sandNote: sandNote,
            refNumber: refNumber,
          ),
        ));
}

class $$ExchangesTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ExchangesTableTable> {
  $$ExchangesTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get sandType => $state.composableBuilder(
      column: $state.table.sandType,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isCash => $state.composableBuilder(
      column: $state.table.isCash,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get branchId => $state.composableBuilder(
      column: $state.table.branchId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get sandNumber => $state.composableBuilder(
      column: $state.table.sandNumber,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get sandDate => $state.composableBuilder(
      column: $state.table.sandDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get fundNumber => $state.composableBuilder(
      column: $state.table.fundNumber,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get currencyId => $state.composableBuilder(
      column: $state.table.currencyId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get currencyValue => $state.composableBuilder(
      column: $state.table.currencyValue,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get reciepentName => $state.composableBuilder(
      column: $state.table.reciepentName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get totalAmount => $state.composableBuilder(
      column: $state.table.totalAmount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get sandNote => $state.composableBuilder(
      column: $state.table.sandNote,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get refNumber => $state.composableBuilder(
      column: $state.table.refNumber,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter sandDetailsTableRefs(
      ComposableFilter Function($$SandDetailsTableTableFilterComposer f) f) {
    final $$SandDetailsTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.sandDetailsTable,
            getReferencedColumn: (t) => t.sandId,
            builder: (joinBuilder, parentComposers) =>
                $$SandDetailsTableTableFilterComposer(ComposerState($state.db,
                    $state.db.sandDetailsTable, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter checkOperationsTableRefs(
      ComposableFilter Function($$CheckOperationsTableTableFilterComposer f)
          f) {
    final $$CheckOperationsTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.checkOperationsTable,
            getReferencedColumn: (t) => t.sandId,
            builder: (joinBuilder, parentComposers) =>
                $$CheckOperationsTableTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.checkOperationsTable,
                    joinBuilder,
                    parentComposers)));
    return f(composer);
  }
}

class $$ExchangesTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ExchangesTableTable> {
  $$ExchangesTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get sandType => $state.composableBuilder(
      column: $state.table.sandType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isCash => $state.composableBuilder(
      column: $state.table.isCash,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get branchId => $state.composableBuilder(
      column: $state.table.branchId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get sandNumber => $state.composableBuilder(
      column: $state.table.sandNumber,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get sandDate => $state.composableBuilder(
      column: $state.table.sandDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get fundNumber => $state.composableBuilder(
      column: $state.table.fundNumber,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get currencyId => $state.composableBuilder(
      column: $state.table.currencyId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get currencyValue => $state.composableBuilder(
      column: $state.table.currencyValue,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get reciepentName => $state.composableBuilder(
      column: $state.table.reciepentName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get totalAmount => $state.composableBuilder(
      column: $state.table.totalAmount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get sandNote => $state.composableBuilder(
      column: $state.table.sandNote,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get refNumber => $state.composableBuilder(
      column: $state.table.refNumber,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$SandDetailsTableTableCreateCompanionBuilder
    = SandDetailsTableCompanion Function({
  Value<int> id,
  required int sandId,
  required int accNumber,
  required double amount,
  required int currencyId,
  required double currencyValue,
});
typedef $$SandDetailsTableTableUpdateCompanionBuilder
    = SandDetailsTableCompanion Function({
  Value<int> id,
  Value<int> sandId,
  Value<int> accNumber,
  Value<double> amount,
  Value<int> currencyId,
  Value<double> currencyValue,
});

class $$SandDetailsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SandDetailsTableTable,
    SandDetailEntity,
    $$SandDetailsTableTableFilterComposer,
    $$SandDetailsTableTableOrderingComposer,
    $$SandDetailsTableTableCreateCompanionBuilder,
    $$SandDetailsTableTableUpdateCompanionBuilder> {
  $$SandDetailsTableTableTableManager(
      _$AppDatabase db, $SandDetailsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$SandDetailsTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$SandDetailsTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> sandId = const Value.absent(),
            Value<int> accNumber = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<int> currencyId = const Value.absent(),
            Value<double> currencyValue = const Value.absent(),
          }) =>
              SandDetailsTableCompanion(
            id: id,
            sandId: sandId,
            accNumber: accNumber,
            amount: amount,
            currencyId: currencyId,
            currencyValue: currencyValue,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int sandId,
            required int accNumber,
            required double amount,
            required int currencyId,
            required double currencyValue,
          }) =>
              SandDetailsTableCompanion.insert(
            id: id,
            sandId: sandId,
            accNumber: accNumber,
            amount: amount,
            currencyId: currencyId,
            currencyValue: currencyValue,
          ),
        ));
}

class $$SandDetailsTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $SandDetailsTableTable> {
  $$SandDetailsTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get accNumber => $state.composableBuilder(
      column: $state.table.accNumber,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get amount => $state.composableBuilder(
      column: $state.table.amount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get currencyId => $state.composableBuilder(
      column: $state.table.currencyId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get currencyValue => $state.composableBuilder(
      column: $state.table.currencyValue,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$ExchangesTableTableFilterComposer get sandId {
    final $$ExchangesTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.sandId,
        referencedTable: $state.db.exchangesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ExchangesTableTableFilterComposer(ComposerState($state.db,
                $state.db.exchangesTable, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$SandDetailsTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $SandDetailsTableTable> {
  $$SandDetailsTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get accNumber => $state.composableBuilder(
      column: $state.table.accNumber,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get amount => $state.composableBuilder(
      column: $state.table.amount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get currencyId => $state.composableBuilder(
      column: $state.table.currencyId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get currencyValue => $state.composableBuilder(
      column: $state.table.currencyValue,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$ExchangesTableTableOrderingComposer get sandId {
    final $$ExchangesTableTableOrderingComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.sandId,
            referencedTable: $state.db.exchangesTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$ExchangesTableTableOrderingComposer(ComposerState($state.db,
                    $state.db.exchangesTable, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$CheckOperationsTableTableCreateCompanionBuilder
    = CheckOperationsTableCompanion Function({
  Value<int> id,
  required int sandId,
  required String operationNumber,
  required DateTime operationDate,
  required int paymentMethed,
  required bool operationState,
});
typedef $$CheckOperationsTableTableUpdateCompanionBuilder
    = CheckOperationsTableCompanion Function({
  Value<int> id,
  Value<int> sandId,
  Value<String> operationNumber,
  Value<DateTime> operationDate,
  Value<int> paymentMethed,
  Value<bool> operationState,
});

class $$CheckOperationsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CheckOperationsTableTable,
    CheckOperationEntity,
    $$CheckOperationsTableTableFilterComposer,
    $$CheckOperationsTableTableOrderingComposer,
    $$CheckOperationsTableTableCreateCompanionBuilder,
    $$CheckOperationsTableTableUpdateCompanionBuilder> {
  $$CheckOperationsTableTableTableManager(
      _$AppDatabase db, $CheckOperationsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$CheckOperationsTableTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$CheckOperationsTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> sandId = const Value.absent(),
            Value<String> operationNumber = const Value.absent(),
            Value<DateTime> operationDate = const Value.absent(),
            Value<int> paymentMethed = const Value.absent(),
            Value<bool> operationState = const Value.absent(),
          }) =>
              CheckOperationsTableCompanion(
            id: id,
            sandId: sandId,
            operationNumber: operationNumber,
            operationDate: operationDate,
            paymentMethed: paymentMethed,
            operationState: operationState,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int sandId,
            required String operationNumber,
            required DateTime operationDate,
            required int paymentMethed,
            required bool operationState,
          }) =>
              CheckOperationsTableCompanion.insert(
            id: id,
            sandId: sandId,
            operationNumber: operationNumber,
            operationDate: operationDate,
            paymentMethed: paymentMethed,
            operationState: operationState,
          ),
        ));
}

class $$CheckOperationsTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $CheckOperationsTableTable> {
  $$CheckOperationsTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get operationNumber => $state.composableBuilder(
      column: $state.table.operationNumber,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get operationDate => $state.composableBuilder(
      column: $state.table.operationDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get paymentMethed => $state.composableBuilder(
      column: $state.table.paymentMethed,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get operationState => $state.composableBuilder(
      column: $state.table.operationState,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$ExchangesTableTableFilterComposer get sandId {
    final $$ExchangesTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.sandId,
        referencedTable: $state.db.exchangesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ExchangesTableTableFilterComposer(ComposerState($state.db,
                $state.db.exchangesTable, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$CheckOperationsTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $CheckOperationsTableTable> {
  $$CheckOperationsTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get operationNumber => $state.composableBuilder(
      column: $state.table.operationNumber,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get operationDate => $state.composableBuilder(
      column: $state.table.operationDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get paymentMethed => $state.composableBuilder(
      column: $state.table.paymentMethed,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get operationState => $state.composableBuilder(
      column: $state.table.operationState,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$ExchangesTableTableOrderingComposer get sandId {
    final $$ExchangesTableTableOrderingComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.sandId,
            referencedTable: $state.db.exchangesTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$ExchangesTableTableOrderingComposer(ComposerState($state.db,
                    $state.db.exchangesTable, joinBuilder, parentComposers)));
    return composer;
  }
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
  $$ItemTableTableTableManager get itemTable =>
      $$ItemTableTableTableManager(_db, _db.itemTable);
  $$ItemUnitTableTableTableManager get itemUnitTable =>
      $$ItemUnitTableTableTableManager(_db, _db.itemUnitTable);
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
  $$StoreOperationTableTableTableManager get storeOperationTable =>
      $$StoreOperationTableTableTableManager(_db, _db.storeOperationTable);
  $$BillTableTableTableManager get billTable =>
      $$BillTableTableTableManager(_db, _db.billTable);
  $$BillDetailsTableTableTableManager get billDetailsTable =>
      $$BillDetailsTableTableTableManager(_db, _db.billDetailsTable);
  $$AccountOperationTableTableTableManager get accountOperationTable =>
      $$AccountOperationTableTableTableManager(_db, _db.accountOperationTable);
  $$RefAccountTableTableTableManager get refAccountTable =>
      $$RefAccountTableTableTableManager(_db, _db.refAccountTable);
  $$MidAccountTableTableTableManager get midAccountTable =>
      $$MidAccountTableTableTableManager(_db, _db.midAccountTable);
  $$ExchangesTableTableTableManager get exchangesTable =>
      $$ExchangesTableTableTableManager(_db, _db.exchangesTable);
  $$SandDetailsTableTableTableManager get sandDetailsTable =>
      $$SandDetailsTableTableTableManager(_db, _db.sandDetailsTable);
  $$CheckOperationsTableTableTableManager get checkOperationsTable =>
      $$CheckOperationsTableTableTableManager(_db, _db.checkOperationsTable);
}
