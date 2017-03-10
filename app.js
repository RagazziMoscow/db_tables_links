var structure = require("./models/structure");

var connectonProperties = {
  database: "computer",
  schema: "public"
};

console.log(structure(connectonProperties.database, connectonProperties.schema).queryForView());

