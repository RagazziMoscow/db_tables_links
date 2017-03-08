var pgStructure = require('pg-structure');

/*
  database: "xgb_nir",
  user: "xgb_nir",
  password: "accab9725sgh"
*/


var connectionArgs = {
  database: "computer",
  user: "admin",
  password: "admin",
  host: "localhost",
  port: 5432
};

var analyzedSchema = 'public'

function getIndependentTables(db, analyzedSchema) {

  var independentTablesArray = [];
  var tables = db.schemas.get(analyzedSchema).tables.values();
  for (table of tables) {
    if (table.foreignKeyColumns.size === 0 && !isView(db, analyzedSchema, table.name)) {
      //console.log("Для таблицы ", table.name, "внешние ключи отсутствуют");
      independentTablesArray.push(table.name);
    }
  }
  return independentTablesArray;

}

function getAllTables(db, analyzedSchema) {
  var tables = Array.from(db.schemas.get(analyzedSchema).tables);
  return tables;
}



var analizedTables = [];

function getSequenceForView(db, analyzedSchema, independentTableName) {
  //var analizedTables = [];
  //if(tableName.)
  var table = getTable(db, analyzedSchema, independentTableName);
  var name = table.name;

  // если в массиве такой таблицы ещё нет
  if (!analizedTables.includes(name)) {

    //console.log(name);

    analizedTables.push(name);
    if (table.o2mRelations.size != 0) {
      //console.log(table.o2mRelations.sourceTable);
      //getStructure(db, analyzedSchema, table.o2mRelations.targetTable);
      var relations = table.o2mRelations;
      for (relation of relations.values()) {
        getSequenceForView(db, analyzedSchema, relation.targetTable.name);
      }
    }
    if (table.m2oRelations.size != 0) {
      var relations = table.m2oRelations;
      for (relation of relations.values()) {
        getSequenceForView(db, analyzedSchema, relation.targetTable.name);
      }
    }



  }
}

// получаем таблицу
function getTable(db, analyzedSchema, tableName) {
  return db.schemas.get(analyzedSchema).tables.get(tableName);
}


// получаем, существует ли отношение между таблицами
function isRelationBetweenTables(db, analyzedSchema, firstTableName, secondTableName) {

  var relations = getTable(db, analyzedSchema, firstTableName).relations;
  //console.log(relations);
  for (let relation of relations.values()) {
    //console.log(relation.targetTable.name);
    if (relation.type != 'MANY TO MANY' && relation.targetTable.name == secondTableName) {
      return true;
    }
  }

  return false;
}

function getRelation(db, analyzedSchema, firstTableName, secondTableName) {
  var relations = getTable(db, analyzedSchema, firstTableName).relations;
  //console.log(relations);
  for (let relation of relations.values()) {
    //console.log(relation.targetTable.name);
    if (relation.type != 'MANY TO MANY' && relation.targetTable.name == secondTableName) {
      return relation;
    }
  }

  return null;
}


// получаем имена полей таблиц, учавствующих в отношении
function getRelationColumns(relation) {

  var columnsList = [];

  if (relation.type == 'ONE TO MANY') {

    var relationColumns = relation.targetTable.columns; // колонки в таблице с внешним ключом
    var necessaryTableName = relation.sourceTable.name; // имя таблицы с первичным ключом

  } else {

    var relationColumns = relation.sourceTable.columns;
    var necessaryTableName = relation.targetTable.name;

  }

  // конечная таблица
  //console.log(relation.targetTable.name);
  //console.log(relationColumns);

  // обход по таблице с внешним ключом
  for (let tableColumn of relationColumns.values()) {

    // если существуют колонки, на которые ссылается ограничение
    if (tableColumn.referencedColumns.size != 0 &&
      Array.from(tableColumn.referencedColumns)[0].table.name == necessaryTableName) {

      // колонки из табицы с первичным ключом
      let refColumns = tableColumn.referencedColumns;
      //console.log(refColumns);

      // вставляем в массив имена таблиц, сначала начальная таблица, потом конечная
      if (relation.type == 'ONE TO MANY') {

        columnsList[0] = {
          "name": Array.from(refColumns)[0].name,
          "table": Array.from(refColumns)[0].table.name
        };
        columnsList[1] = {
          "name": tableColumn.name,
          "table": tableColumn.table.name
        };
      } else {

        columnsList[0] = {
          "name": tableColumn.name,
          "table": tableColumn.table.name
        };
        columnsList[1] = {
          "name": Array.from(refColumns)[0].name,
          "table": Array.from(refColumns)[0].table.name
        };

      }

    }
  }
  return columnsList;
}

// получаем поле начальной таблицы, участвующей в отношении
function getSourceTableColumn(relation) {
  var sourceColumn = {};
  if (relation.type == 'ONE TO MANY') {

    var relationColumns = relation.targetTable.columns; // колонки в таблице с внешним ключом
    var necessaryTableName = relation.sourceTable.name; // имя таблицы с первичным ключом

  } else {

    var relationColumns = relation.sourceTable.columns;
    var necessaryTableName = relation.targetTable.name;

  }

  // конечная таблица
  //console.log(relation.targetTable.name);
  //console.log(relationColumns);

  // обход по таблице с внешним ключом
  for (let tableColumn of relationColumns.values()) {

    // если существуют колонки, на которые ссылается ограничение
    if (tableColumn.referencedColumns.size != 0 &&
      Array.from(tableColumn.referencedColumns)[0].table.name == necessaryTableName) {

      // колонки из табицы с первичным ключом
      let refColumns = tableColumn.referencedColumns;
      //console.log(refColumns);

      // вставляем в массив имена таблиц, сначала начальная таблица, потом конечная
      if (relation.type == 'ONE TO MANY') {
        sourceColumn.name = Array.from(refColumns)[0].name;
        sourceColumn.table = Array.from(refColumns)[0].table.name;
      } else {
        sourceColumn.name = tableColumn.name;
        sourceColumn.table = tableColumn.table.name;

      }

    }
  }
  return sourceColumn;
}

// получаем поле конечной таблицы, участвующей в отношении
function getTargetTableColumn(relation) {
  var sourceColumn = {};
  if (relation.type == 'ONE TO MANY') {

    var relationColumns = relation.targetTable.columns; // колонки в таблице с внешним ключом
    var necessaryTableName = relation.sourceTable.name; // имя таблицы с первичным ключом

  } else {

    var relationColumns = relation.sourceTable.columns;
    var necessaryTableName = relation.targetTable.name;

  }

  // конечная таблица
  //console.log(relation.targetTable.name);
  //console.log(relationColumns);

  // обход по таблице с внешним ключом
  for (let tableColumn of relationColumns.values()) {

    // если существуют колонки, на которые ссылается ограничение
    if (tableColumn.referencedColumns.size != 0 &&
      Array.from(tableColumn.referencedColumns)[0].table.name == necessaryTableName) {

      // колонки из табицы с первичным ключом
      let refColumns = tableColumn.referencedColumns;
      //console.log(refColumns);

      // вставляем в массив имена таблиц, сначала начальная таблица, потом конечная
      if (relation.type == 'ONE TO MANY') {

        sourceColumn.name = tableColumn.name;
        sourceColumn.table = tableColumn.table.name;
      } else {
        sourceColumn.name = Array.from(refColumns)[0].name;
        sourceColumn.table = Array.from(refColumns)[0].table.name;


      }

    }
  }
  return sourceColumn;
}

// получаем логическое значение, является ли данный объект представлением или базовой таблицей
function isView(db, analyzedSchema, ObjectName) {
  var analizedObject = getTable(db, analyzedSchema, ObjectName);
  return Boolean(analizedObject.primaryKeyColumns.size == 0);
}



function getSQLForView(db, analyzedSchema) {

  getSequenceForView(db, analyzedSchema, getIndependentTables(db, analyzedSchema)[0]);
  console.log(analizedTables);

  var SQLQuery = "set search_path to " + analyzedSchema + ";";
  SQLQuery += "\n select * from ";
  SQLQuery += analyzedSchema + '.' + analizedTables[0];

  for (let i = 1; i < analizedTables.length; i++) {

    for (let j = 0; j < i; j++) {

      if (isRelationBetweenTables(db, analyzedSchema, analizedTables[i], analizedTables[j])) {

        console.log(analizedTables[i], "->", analizedTables[j]);

        let joinColumnTargetInfo = getTargetTableColumn(getRelation(db, analyzedSchema, analizedTables[i], analizedTables[j]));
        let joinColumnSourceInfo = getSourceTableColumn(getRelation(db, analyzedSchema, analizedTables[i], analizedTables[j]));
        SQLQuery += " full join " + analizedTables[i] +
          " on " + analizedTables[j] + "." + joinColumnTargetInfo.name +
          " = " + analizedTables[i] + "." + joinColumnSourceInfo.name + "\n";

        break;

      }
    }

  }

  SQLQuery = SQLQuery.substring(0, SQLQuery.length - 1);
  SQLQuery += ";";
  console.log("Скрипт:\n", SQLQuery);
}


pgStructure(connectionArgs, analyzedSchema)
  .then((db) => {

    //getSequenceForView(db, analyzedSchema, 'printer');

    //console.log(getRelationColumns(Array.from(getTable(db, analyzedSchema, 'passenger').o2mRelations)[0]));
    //console.log(getAllTables(db, analyzedSchema));
    //console.log(getSequenceForView(db, analyzedSchema, 'company'));
    //console.log(analizedTables);
    getSQLForView(db, analyzedSchema);
    //console.log(getIndependentTables(db, analyzedSchema));
    //console.log(getSourceTableColumn(getRelation(db, analyzedSchema, 'company', 'trip'))) ;


    //console.log(getTargetTableColumn(Array.from(getTable(db, analyzedSchema, 'passenger').o2mRelations)[0]));

  })
  .catch(err => console.log(err.stack));