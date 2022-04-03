import 'package:drift/drift.dart';
import 'package:your_ca/data/database_tables/category_table.dart';

import '../../drift_database.dart';

part 'category_dao.g.dart';

@DriftAccessor(tables: [Categories])
class CategoriesDao extends DatabaseAccessor<MyDatabase> with _$CategoriesDaoMixin {

  CategoriesDao(MyDatabase db) : super(db);

  Future<List<Category>> getAllCategories(String categoryType) => (select(categories)
  ..where((category) => category.type.equals(categoryType))
  ).get();
  Future insertCategory(CategoriesCompanion categoriesCompanion) => into(categories).insert(categoriesCompanion);
  Future deleteCategory(Category category) => delete(categories).delete(category);
  Future updateCategory(CategoriesCompanion categoriesCompanion) =>
      update(categories).replace(categoriesCompanion);

}