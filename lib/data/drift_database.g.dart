// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Transaction extends DataClass implements Insertable<Transaction> {
  final int id;
  final String type;
  final DateTime transactionDateTime;
  final double amount;
  final String transactionMode;
  final bool recurring;
  final String category;
  final String? recurringDuration;
  final String transactionNote;
  final int? warranty;
  final String? warrantyDurationType;
  final String? filePath;
  Transaction(
      {required this.id,
      required this.type,
      required this.transactionDateTime,
      required this.amount,
      required this.transactionMode,
      required this.recurring,
      required this.category,
      this.recurringDuration,
      required this.transactionNote,
      this.warranty,
      this.warrantyDurationType,
      this.filePath});
  factory Transaction.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Transaction(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      type: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}type'])!,
      transactionDateTime: const DateTimeType().mapFromDatabaseResponse(
          data['${effectivePrefix}transaction_date_time'])!,
      amount: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}amount'])!,
      transactionMode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}transaction_mode'])!,
      recurring: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}recurring'])!,
      category: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}category'])!,
      recurringDuration: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}recurring_duration']),
      transactionNote: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}transaction_note'])!,
      warranty: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}warranty']),
      warrantyDurationType: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}warranty_duration_type']),
      filePath: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}file_path']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['type'] = Variable<String>(type);
    map['transaction_date_time'] = Variable<DateTime>(transactionDateTime);
    map['amount'] = Variable<double>(amount);
    map['transaction_mode'] = Variable<String>(transactionMode);
    map['recurring'] = Variable<bool>(recurring);
    map['category'] = Variable<String>(category);
    if (!nullToAbsent || recurringDuration != null) {
      map['recurring_duration'] = Variable<String?>(recurringDuration);
    }
    map['transaction_note'] = Variable<String>(transactionNote);
    if (!nullToAbsent || warranty != null) {
      map['warranty'] = Variable<int?>(warranty);
    }
    if (!nullToAbsent || warrantyDurationType != null) {
      map['warranty_duration_type'] = Variable<String?>(warrantyDurationType);
    }
    if (!nullToAbsent || filePath != null) {
      map['file_path'] = Variable<String?>(filePath);
    }
    return map;
  }

  TransactionsCompanion toCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      id: Value(id),
      type: Value(type),
      transactionDateTime: Value(transactionDateTime),
      amount: Value(amount),
      transactionMode: Value(transactionMode),
      recurring: Value(recurring),
      category: Value(category),
      recurringDuration: recurringDuration == null && nullToAbsent
          ? const Value.absent()
          : Value(recurringDuration),
      transactionNote: Value(transactionNote),
      warranty: warranty == null && nullToAbsent
          ? const Value.absent()
          : Value(warranty),
      warrantyDurationType: warrantyDurationType == null && nullToAbsent
          ? const Value.absent()
          : Value(warrantyDurationType),
      filePath: filePath == null && nullToAbsent
          ? const Value.absent()
          : Value(filePath),
    );
  }

  factory Transaction.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Transaction(
      id: serializer.fromJson<int>(json['id']),
      type: serializer.fromJson<String>(json['type']),
      transactionDateTime:
          serializer.fromJson<DateTime>(json['transactionDateTime']),
      amount: serializer.fromJson<double>(json['amount']),
      transactionMode: serializer.fromJson<String>(json['transactionMode']),
      recurring: serializer.fromJson<bool>(json['recurring']),
      category: serializer.fromJson<String>(json['category']),
      recurringDuration:
          serializer.fromJson<String?>(json['recurringDuration']),
      transactionNote: serializer.fromJson<String>(json['transactionNote']),
      warranty: serializer.fromJson<int?>(json['warranty']),
      warrantyDurationType:
          serializer.fromJson<String?>(json['warrantyDurationType']),
      filePath: serializer.fromJson<String?>(json['filePath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'type': serializer.toJson<String>(type),
      'transactionDateTime': serializer.toJson<DateTime>(transactionDateTime),
      'amount': serializer.toJson<double>(amount),
      'transactionMode': serializer.toJson<String>(transactionMode),
      'recurring': serializer.toJson<bool>(recurring),
      'category': serializer.toJson<String>(category),
      'recurringDuration': serializer.toJson<String?>(recurringDuration),
      'transactionNote': serializer.toJson<String>(transactionNote),
      'warranty': serializer.toJson<int?>(warranty),
      'warrantyDurationType': serializer.toJson<String?>(warrantyDurationType),
      'filePath': serializer.toJson<String?>(filePath),
    };
  }

  Transaction copyWith(
          {int? id,
          String? type,
          DateTime? transactionDateTime,
          double? amount,
          String? transactionMode,
          bool? recurring,
          String? category,
          String? recurringDuration,
          String? transactionNote,
          int? warranty,
          String? warrantyDurationType,
          String? filePath}) =>
      Transaction(
        id: id ?? this.id,
        type: type ?? this.type,
        transactionDateTime: transactionDateTime ?? this.transactionDateTime,
        amount: amount ?? this.amount,
        transactionMode: transactionMode ?? this.transactionMode,
        recurring: recurring ?? this.recurring,
        category: category ?? this.category,
        recurringDuration: recurringDuration ?? this.recurringDuration,
        transactionNote: transactionNote ?? this.transactionNote,
        warranty: warranty ?? this.warranty,
        warrantyDurationType: warrantyDurationType ?? this.warrantyDurationType,
        filePath: filePath ?? this.filePath,
      );
  @override
  String toString() {
    return (StringBuffer('Transaction(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('transactionDateTime: $transactionDateTime, ')
          ..write('amount: $amount, ')
          ..write('transactionMode: $transactionMode, ')
          ..write('recurring: $recurring, ')
          ..write('category: $category, ')
          ..write('recurringDuration: $recurringDuration, ')
          ..write('transactionNote: $transactionNote, ')
          ..write('warranty: $warranty, ')
          ..write('warrantyDurationType: $warrantyDurationType, ')
          ..write('filePath: $filePath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      type,
      transactionDateTime,
      amount,
      transactionMode,
      recurring,
      category,
      recurringDuration,
      transactionNote,
      warranty,
      warrantyDurationType,
      filePath);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Transaction &&
          other.id == this.id &&
          other.type == this.type &&
          other.transactionDateTime == this.transactionDateTime &&
          other.amount == this.amount &&
          other.transactionMode == this.transactionMode &&
          other.recurring == this.recurring &&
          other.category == this.category &&
          other.recurringDuration == this.recurringDuration &&
          other.transactionNote == this.transactionNote &&
          other.warranty == this.warranty &&
          other.warrantyDurationType == this.warrantyDurationType &&
          other.filePath == this.filePath);
}

class TransactionsCompanion extends UpdateCompanion<Transaction> {
  final Value<int> id;
  final Value<String> type;
  final Value<DateTime> transactionDateTime;
  final Value<double> amount;
  final Value<String> transactionMode;
  final Value<bool> recurring;
  final Value<String> category;
  final Value<String?> recurringDuration;
  final Value<String> transactionNote;
  final Value<int?> warranty;
  final Value<String?> warrantyDurationType;
  final Value<String?> filePath;
  const TransactionsCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.transactionDateTime = const Value.absent(),
    this.amount = const Value.absent(),
    this.transactionMode = const Value.absent(),
    this.recurring = const Value.absent(),
    this.category = const Value.absent(),
    this.recurringDuration = const Value.absent(),
    this.transactionNote = const Value.absent(),
    this.warranty = const Value.absent(),
    this.warrantyDurationType = const Value.absent(),
    this.filePath = const Value.absent(),
  });
  TransactionsCompanion.insert({
    this.id = const Value.absent(),
    required String type,
    required DateTime transactionDateTime,
    required double amount,
    required String transactionMode,
    required bool recurring,
    required String category,
    this.recurringDuration = const Value.absent(),
    this.transactionNote = const Value.absent(),
    this.warranty = const Value.absent(),
    this.warrantyDurationType = const Value.absent(),
    this.filePath = const Value.absent(),
  })  : type = Value(type),
        transactionDateTime = Value(transactionDateTime),
        amount = Value(amount),
        transactionMode = Value(transactionMode),
        recurring = Value(recurring),
        category = Value(category);
  static Insertable<Transaction> custom({
    Expression<int>? id,
    Expression<String>? type,
    Expression<DateTime>? transactionDateTime,
    Expression<double>? amount,
    Expression<String>? transactionMode,
    Expression<bool>? recurring,
    Expression<String>? category,
    Expression<String?>? recurringDuration,
    Expression<String>? transactionNote,
    Expression<int?>? warranty,
    Expression<String?>? warrantyDurationType,
    Expression<String?>? filePath,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (transactionDateTime != null)
        'transaction_date_time': transactionDateTime,
      if (amount != null) 'amount': amount,
      if (transactionMode != null) 'transaction_mode': transactionMode,
      if (recurring != null) 'recurring': recurring,
      if (category != null) 'category': category,
      if (recurringDuration != null) 'recurring_duration': recurringDuration,
      if (transactionNote != null) 'transaction_note': transactionNote,
      if (warranty != null) 'warranty': warranty,
      if (warrantyDurationType != null)
        'warranty_duration_type': warrantyDurationType,
      if (filePath != null) 'file_path': filePath,
    });
  }

  TransactionsCompanion copyWith(
      {Value<int>? id,
      Value<String>? type,
      Value<DateTime>? transactionDateTime,
      Value<double>? amount,
      Value<String>? transactionMode,
      Value<bool>? recurring,
      Value<String>? category,
      Value<String?>? recurringDuration,
      Value<String>? transactionNote,
      Value<int?>? warranty,
      Value<String?>? warrantyDurationType,
      Value<String?>? filePath}) {
    return TransactionsCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      transactionDateTime: transactionDateTime ?? this.transactionDateTime,
      amount: amount ?? this.amount,
      transactionMode: transactionMode ?? this.transactionMode,
      recurring: recurring ?? this.recurring,
      category: category ?? this.category,
      recurringDuration: recurringDuration ?? this.recurringDuration,
      transactionNote: transactionNote ?? this.transactionNote,
      warranty: warranty ?? this.warranty,
      warrantyDurationType: warrantyDurationType ?? this.warrantyDurationType,
      filePath: filePath ?? this.filePath,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (transactionDateTime.present) {
      map['transaction_date_time'] =
          Variable<DateTime>(transactionDateTime.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (transactionMode.present) {
      map['transaction_mode'] = Variable<String>(transactionMode.value);
    }
    if (recurring.present) {
      map['recurring'] = Variable<bool>(recurring.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (recurringDuration.present) {
      map['recurring_duration'] = Variable<String?>(recurringDuration.value);
    }
    if (transactionNote.present) {
      map['transaction_note'] = Variable<String>(transactionNote.value);
    }
    if (warranty.present) {
      map['warranty'] = Variable<int?>(warranty.value);
    }
    if (warrantyDurationType.present) {
      map['warranty_duration_type'] =
          Variable<String?>(warrantyDurationType.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String?>(filePath.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('transactionDateTime: $transactionDateTime, ')
          ..write('amount: $amount, ')
          ..write('transactionMode: $transactionMode, ')
          ..write('recurring: $recurring, ')
          ..write('category: $category, ')
          ..write('recurringDuration: $recurringDuration, ')
          ..write('transactionNote: $transactionNote, ')
          ..write('warranty: $warranty, ')
          ..write('warrantyDurationType: $warrantyDurationType, ')
          ..write('filePath: $filePath')
          ..write(')'))
        .toString();
  }
}

class $TransactionsTable extends Transactions
    with TableInfo<$TransactionsTable, Transaction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String?> type = GeneratedColumn<String?>(
      'type', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 8),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _transactionDateTimeMeta =
      const VerificationMeta('transactionDateTime');
  @override
  late final GeneratedColumn<DateTime?> transactionDateTime =
      GeneratedColumn<DateTime?>('transaction_date_time', aliasedName, false,
          type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double?> amount = GeneratedColumn<double?>(
      'amount', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _transactionModeMeta =
      const VerificationMeta('transactionMode');
  @override
  late final GeneratedColumn<String?> transactionMode =
      GeneratedColumn<String?>('transaction_mode', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _recurringMeta = const VerificationMeta('recurring');
  @override
  late final GeneratedColumn<bool?> recurring = GeneratedColumn<bool?>(
      'recurring', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (recurring IN (0, 1))');
  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  @override
  late final GeneratedColumn<String?> category = GeneratedColumn<String?>(
      'category', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _recurringDurationMeta =
      const VerificationMeta('recurringDuration');
  @override
  late final GeneratedColumn<String?> recurringDuration =
      GeneratedColumn<String?>('recurring_duration', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _transactionNoteMeta =
      const VerificationMeta('transactionNote');
  @override
  late final GeneratedColumn<String?> transactionNote =
      GeneratedColumn<String?>('transaction_note', aliasedName, false,
          type: const StringType(),
          requiredDuringInsert: false,
          defaultValue: const Constant('Un-Named'));
  final VerificationMeta _warrantyMeta = const VerificationMeta('warranty');
  @override
  late final GeneratedColumn<int?> warranty = GeneratedColumn<int?>(
      'warranty', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _warrantyDurationTypeMeta =
      const VerificationMeta('warrantyDurationType');
  @override
  late final GeneratedColumn<String?> warrantyDurationType =
      GeneratedColumn<String?>('warranty_duration_type', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _filePathMeta = const VerificationMeta('filePath');
  @override
  late final GeneratedColumn<String?> filePath = GeneratedColumn<String?>(
      'file_path', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        type,
        transactionDateTime,
        amount,
        transactionMode,
        recurring,
        category,
        recurringDuration,
        transactionNote,
        warranty,
        warrantyDurationType,
        filePath
      ];
  @override
  String get aliasedName => _alias ?? 'transactions';
  @override
  String get actualTableName => 'transactions';
  @override
  VerificationContext validateIntegrity(Insertable<Transaction> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('transaction_date_time')) {
      context.handle(
          _transactionDateTimeMeta,
          transactionDateTime.isAcceptableOrUnknown(
              data['transaction_date_time']!, _transactionDateTimeMeta));
    } else if (isInserting) {
      context.missing(_transactionDateTimeMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('transaction_mode')) {
      context.handle(
          _transactionModeMeta,
          transactionMode.isAcceptableOrUnknown(
              data['transaction_mode']!, _transactionModeMeta));
    } else if (isInserting) {
      context.missing(_transactionModeMeta);
    }
    if (data.containsKey('recurring')) {
      context.handle(_recurringMeta,
          recurring.isAcceptableOrUnknown(data['recurring']!, _recurringMeta));
    } else if (isInserting) {
      context.missing(_recurringMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('recurring_duration')) {
      context.handle(
          _recurringDurationMeta,
          recurringDuration.isAcceptableOrUnknown(
              data['recurring_duration']!, _recurringDurationMeta));
    }
    if (data.containsKey('transaction_note')) {
      context.handle(
          _transactionNoteMeta,
          transactionNote.isAcceptableOrUnknown(
              data['transaction_note']!, _transactionNoteMeta));
    }
    if (data.containsKey('warranty')) {
      context.handle(_warrantyMeta,
          warranty.isAcceptableOrUnknown(data['warranty']!, _warrantyMeta));
    }
    if (data.containsKey('warranty_duration_type')) {
      context.handle(
          _warrantyDurationTypeMeta,
          warrantyDurationType.isAcceptableOrUnknown(
              data['warranty_duration_type']!, _warrantyDurationTypeMeta));
    }
    if (data.containsKey('file_path')) {
      context.handle(_filePathMeta,
          filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Transaction map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Transaction.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TransactionsTable createAlias(String alias) {
    return $TransactionsTable(attachedDatabase, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  final int id;
  final String type;
  final String category;
  final String? note;
  Category(
      {required this.id,
      required this.type,
      required this.category,
      this.note});
  factory Category.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Category(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      type: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}type'])!,
      category: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}category'])!,
      note: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}note']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['type'] = Variable<String>(type);
    map['category'] = Variable<String>(category);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String?>(note);
    }
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      type: Value(type),
      category: Value(category),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory Category.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<int>(json['id']),
      type: serializer.fromJson<String>(json['type']),
      category: serializer.fromJson<String>(json['category']),
      note: serializer.fromJson<String?>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'type': serializer.toJson<String>(type),
      'category': serializer.toJson<String>(category),
      'note': serializer.toJson<String?>(note),
    };
  }

  Category copyWith({int? id, String? type, String? category, String? note}) =>
      Category(
        id: id ?? this.id,
        type: type ?? this.type,
        category: category ?? this.category,
        note: note ?? this.note,
      );
  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('category: $category, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, type, category, note);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.id == this.id &&
          other.type == this.type &&
          other.category == this.category &&
          other.note == this.note);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<int> id;
  final Value<String> type;
  final Value<String> category;
  final Value<String?> note;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.category = const Value.absent(),
    this.note = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String type,
    required String category,
    this.note = const Value.absent(),
  })  : type = Value(type),
        category = Value(category);
  static Insertable<Category> custom({
    Expression<int>? id,
    Expression<String>? type,
    Expression<String>? category,
    Expression<String?>? note,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (category != null) 'category': category,
      if (note != null) 'note': note,
    });
  }

  CategoriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? type,
      Value<String>? category,
      Value<String?>? note}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      category: category ?? this.category,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (note.present) {
      map['note'] = Variable<String?>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('category: $category, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String?> type = GeneratedColumn<String?>(
      'type', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 8),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  @override
  late final GeneratedColumn<String?> category = GeneratedColumn<String?>(
      'category', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String?> note = GeneratedColumn<String?>(
      'note', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, type, category, note];
  @override
  String get aliasedName => _alias ?? 'categories';
  @override
  String get actualTableName => 'categories';
  @override
  VerificationContext validateIntegrity(Insertable<Category> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Category.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $TransactionsTable transactions = $TransactionsTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final TransactionsDao transactionsDao =
      TransactionsDao(this as MyDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [transactions, categories];
}
