const express = require('express');
const path = require('path');

const bodyParser = require('body-parser');

const app = express();

app.use(express.static(__dirname + '/frontend')); 

app.use(bodyParser.urlencoded({ extended: true }));

var mysql      = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'Kumar@123',
  database : 'smart_travel_guide_webApp'
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


app.post("/",function(req,res){
    const Name="'"+ req.body.Name + "'";
    const Email= "'" + req.body.Email + "'";
    const Username = "'" + req.body.Username + "'"; 
    const Password = "'" + req.body.Password + "'";

    console.log("Insert into user values (" + Name + "," + Email + "," + Username + "," + Password + ")");
    var sql= "Insert into user values (" + Name + "," + Email + "," + Username + "," + Password + ")" ;
    connection.query(sql, function(err,result){
        if(err) throw err;
        console.log("1 record inserted");
    } );
    res.redirect(302, '/login.html' );
    
})

app.listen(3000,function(){
    console.log("Server started");
});

