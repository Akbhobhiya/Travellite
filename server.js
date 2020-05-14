const express = require('express');
const path = require('path');

const app = express();

app.use(express.static(__dirname + '/frontend')); 

var mysql      = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'mysql',
  database : 'dbname'
});

connection.connect(function(err){
if(!err) {
    console.log("Database is connected ... \n\n");  
} else {
    console.log("Error connecting database ... \n\n");  
}
});

app.get("/",function(req,res)
{
    res.sendFile('/frontend/web1.html',{root: __dirname});
})

app.listen(3000,function(){
    console.log("Server started");
});

