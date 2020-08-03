// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  OscaDao _oscaDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
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
            'CREATE TABLE IF NOT EXISTS `Exam` (`examID` INTEGER, `examName` TEXT, `context` TEXT, `contextType` TEXT, `subject` TEXT, `beginDate` TEXT, `dueDate` TEXT, `timeFrom` TEXT, `timeTo` TEXT, `grade` TEXT, `gradeDescription` TEXT, `instructorString` TEXT, `status` TEXT, `statusSystem` TEXT, `semesterID` TEXT, `semesterName` TEXT, PRIMARY KEY (`examID`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Course` (`courseID` INTEGER, `courseDataID` TEXT, `courseNumber` TEXT, `courseName` TEXT, `eventType` TEXT, `eventCategory` TEXT, `semesterID` TEXT, `semesterName` TEXT, `creditPoints` TEXT, `hoursPerWeek` TEXT, `smallGroups` TEXT, `courseLanguage` TEXT, `facultyName` TEXT, `maxStudents` TEXT, `instructorsString` TEXT, `moduleName` TEXT, `moduleNumber` TEXT, `listener` TEXT, `acceptedStatus` TEXT, `materialPresent` TEXT, `infoPresent` TEXT, PRIMARY KEY (`courseDataID`))');

        await database.execute('''CREATE VIEW IF NOT EXISTS `Semester` AS SELECT
  semesterName as name,
  semesterID AS id,
  SUM(master) as master,
  SUM(bachelor) as bachelor
FROM (
  SELECT
    DISTINCT semesterName,
    semesterID,
    courseNumber LIKE '%M%' AS master,
    courseNumber LIKE '%B%' AS bachelor
  FROM Course
  WHERE courseNumber LIKE '%M%'
  OR courseNumber LIKE '%B%'
)
GROUP BY semesterName
ORDER BY semesterID ASC''');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  OscaDao get oscaDao {
    return _oscaDaoInstance ??= _$OscaDao(database, changeListener);
  }
}

class _$OscaDao extends OscaDao {
  _$OscaDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _examDtoInsertionAdapter = InsertionAdapter(
            database,
            'Exam',
            (ExamDto item) => <String, dynamic>{
                  'examID': item.examID,
                  'examName': item.examName,
                  'context': item.context,
                  'contextType': item.contextType,
                  'subject': item.subject,
                  'beginDate': item.beginDate,
                  'dueDate': item.dueDate,
                  'timeFrom': item.timeFrom,
                  'timeTo': item.timeTo,
                  'grade': item.grade,
                  'gradeDescription': item.gradeDescription,
                  'instructorString': item.instructorString,
                  'status': item.status,
                  'statusSystem': item.statusSystem,
                  'semesterID': item.semesterID,
                  'semesterName': item.semesterName
                }),
        _courseDtoInsertionAdapter = InsertionAdapter(
            database,
            'Course',
            (CourseDto item) => <String, dynamic>{
                  'courseID': item.courseID,
                  'courseDataID': item.courseDataID,
                  'courseNumber': item.courseNumber,
                  'courseName': item.courseName,
                  'eventType': item.eventType,
                  'eventCategory': item.eventCategory,
                  'semesterID': item.semesterID,
                  'semesterName': item.semesterName,
                  'creditPoints': item.creditPoints,
                  'hoursPerWeek': item.hoursPerWeek,
                  'smallGroups': item.smallGroups,
                  'courseLanguage': item.courseLanguage,
                  'facultyName': item.facultyName,
                  'maxStudents': item.maxStudents,
                  'instructorsString': item.instructorsString,
                  'moduleName': item.moduleName,
                  'moduleNumber': item.moduleNumber,
                  'listener': item.listener,
                  'acceptedStatus': item.acceptedStatus,
                  'materialPresent': item.materialPresent,
                  'infoPresent': item.infoPresent
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _semesterMapper = (Map<String, dynamic> row) => Semester(
      row['name'] as String,
      row['id'] as String,
      row['master'] == null ? null : (row['master'] as int) != 0,
      row['bachelor'] == null ? null : (row['bachelor'] as int) != 0);

  final InsertionAdapter<ExamDto> _examDtoInsertionAdapter;

  final InsertionAdapter<CourseDto> _courseDtoInsertionAdapter;

  @override
  Future<List<Semester>> getSemester() async {
    return _queryAdapter.queryList('SELECT * FROM Semester',
        mapper: _semesterMapper);
  }

  @override
  Future<void> insertExams(List<ExamDto> exam) async {
    await _examDtoInsertionAdapter.insertList(exam, OnConflictStrategy.replace);
  }

  @override
  Future<void> insertCourses(List<CourseDto> course) async {
    await _courseDtoInsertionAdapter.insertList(
        course, OnConflictStrategy.replace);
  }
}
