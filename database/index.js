var mysql = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password: '',
  database : 'sdc'
});

connection.connect();

module.exports = connection;