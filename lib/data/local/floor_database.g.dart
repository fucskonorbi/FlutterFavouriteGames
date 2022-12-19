// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floor_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorFloorDealDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FloorDealDatabaseBuilder databaseBuilder(String name) =>
      _$FloorDealDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FloorDealDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$FloorDealDatabaseBuilder(null);
}

class _$FloorDealDatabaseBuilder {
  _$FloorDealDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$FloorDealDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$FloorDealDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<FloorDealDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$FloorDealDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$FloorDealDatabase extends FloorDealDatabase {
  _$FloorDealDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  FloorDealDao? _dealDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `new_deals` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, `price` REAL NOT NULL, `favorite` INTEGER NOT NULL, `onSale` INTEGER NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  FloorDealDao get dealDao {
    return _dealDaoInstance ??= _$FloorDealDao(database, changeListener);
  }
}

class _$FloorDealDao extends FloorDealDao {
  _$FloorDealDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _floorDealInsertionAdapter = InsertionAdapter(
            database,
            'new_deals',
            (FloorDeal item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'price': item.price,
                  'favorite': item.favorite ? 1 : 0,
                  'onSale': item.onSale ? 1 : 0
                }),
        _floorDealUpdateAdapter = UpdateAdapter(
            database,
            'new_deals',
            ['id'],
            (FloorDeal item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'price': item.price,
                  'favorite': item.favorite ? 1 : 0,
                  'onSale': item.onSale ? 1 : 0
                }),
        _floorDealDeletionAdapter = DeletionAdapter(
            database,
            'new_deals',
            ['id'],
            (FloorDeal item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'price': item.price,
                  'favorite': item.favorite ? 1 : 0,
                  'onSale': item.onSale ? 1 : 0
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<FloorDeal> _floorDealInsertionAdapter;

  final UpdateAdapter<FloorDeal> _floorDealUpdateAdapter;

  final DeletionAdapter<FloorDeal> _floorDealDeletionAdapter;

  @override
  Future<List<FloorDeal>> getAllDeals() async {
    return _queryAdapter.queryList('SELECT * FROM new_deals',
        mapper: (Map<String, Object?> row) => FloorDeal(
            id: row['id'] as int,
            name: row['name'] as String,
            price: row['price'] as double,
            favorite: (row['favorite'] as int) != 0,
            onSale: (row['onSale'] as int) != 0));
  }

  @override
  Future<List<FloorDeal>> getDealsByName(String name) async {
    return _queryAdapter.queryList('SELECT * FROM new_deals WHERE name = ?1',
        mapper: (Map<String, Object?> row) => FloorDeal(
            id: row['id'] as int,
            name: row['name'] as String,
            price: row['price'] as double,
            favorite: (row['favorite'] as int) != 0,
            onSale: (row['onSale'] as int) != 0),
        arguments: [name]);
  }

  @override
  Future<void> insertDeals(List<FloorDeal> deals) async {
    await _floorDealInsertionAdapter.insertList(
        deals, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateDeal(FloorDeal deal) async {
    await _floorDealUpdateAdapter.update(deal, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteDeal(FloorDeal deal) async {
    await _floorDealDeletionAdapter.delete(deal);
  }
}
