var pgStructure = require('pg-structure');

var connectionArgs = {
  database: "Example",
  user: "admin",
  password: "admin",
  host: "localhost",
  port: 5432
};

pgStructure(connectionArgs, ['public', 'cekavo'])
  .then((db) => {


/*
    // Basic
    var tables = db.schemas.get('cekavo').tables; // Map of Table objects.

    // List of table names
    for (let table of tables.values()) {
      console.log("Таблица ", table.name);


      var relations = table.m2oRelations.values();
      for (let relation of relations) {
        console.log("Отношение ", relation.constraint.name, "между таблицами ",
          relation.sourceTable.name, "и ", relation.targetTable.name);
      }


      for (let column of table.foreignKeyColumns.values()) {
        console.log("Внешний ключ ", column.name);
      }

    }

*/
  console.log(db.get('public').tables.get('Players').colums.get('Name').type);


  })
  .catch(err => console.log(err.stack));