
//Setting Up express and its components
const express = require("express");
const app = express();
const {check , validationResult} = require('express-validator');
const session = require('express-session');
const mySqlStore = require('express-mysql-session')(session);
const bodyParser = require("body-parser");
//Setting up inbuild modules
const path = require("path");
const fs = require("fs");
const http = require("http").createServer(app);
const mysql = require('mysql');
//Setting up last modules
const io = require("socket.io")(http);


//Connecting to database
var conn = mysql.createConnection({
  host:"localhost",
  user:"root",
  password:"",
  database:"vennerForLivet"
})

var sessionStore = new mySqlStore({
  host:"localhost",
  port:"3306",
  user:"root",
  password:"",
  database:"vennerForLivet"
});

app.use(session({
  key: 'playerName',
  secret: 'Mikkelerutroligsød',
  store: sessionStore,
  resave: false,
  rolling: true,
  saveUninitialized: false,
  cookie: {
    maxAge: 600*1000,
  }
}));

conn.connect(function(err) {
  if (err) throw err;
  console.log("Connected to MySQL");
})

//Setup delivery of css and other files
app.use(express.static(path.join(__dirname, 'public')))
app.use(bodyParser.json());
app.use(bodyParser.urlencoded());
//Shortcut, do not keep
app.get("/Game", function(req, res) {
  res.sendFile(__dirname + "/index.html");
})

conn.query("SELECT * from games where gameID=215645", function(err, result, fields) {
  if (err) throw err;
  if (result[0]) {
    console.log(result[0].gameName);
  } else {
    console.log("Fail");
  }
});

//Default Routing
app.get("/", function(req , res){
  if (req.query.id) {
    var sql = "SELECT * from games where gameID=" + conn.escape(req.query.id);
    conn.query(sql, function(err, result, fields) {
      if (result[0]) { //Hvis der er et spil med det ID så true, ellers send dem til spillisten
        if (result[0].gameHasStarted == 0) {
          if (req.session.playerID) {
            res.sendFile(__dirname + "/index.html");
          } else {
            res.sendFile(__dirname + "/login.html");
          }
        } else {
          sql = "SELECT * from spillere where gameID=" + req.session.gameID + ";";
          conn.query(sql, function(err, result, fields) {
            if (result) {
              res.sendFile(__dirname + "/index.html");
            } else {
              res.sendFile(__dirname + "/games.html");
            }
          });
        }
      } else {
        res.sendFile(__dirname + "/games.html");
      }
    });
  } else {
    res.sendFile(__dirname + "/games.html"); //Send brugeren til en liste af åbne spil
  }
})
//Run server
http.listen(3000, function() {
  console.log('Listening on port 3000');
});

//Basic Socket connection and disconnect messages and join room
io.on("connection", function(socket) {
  console.log("user connected");
  socket.on('joinRoom', function(roomNumber) {
    socket.join(roomNumber);
    console.log('User connected to: ' + roomNumber);
  });
  socket.on('disconnect', function() {
    console.log("User disconnected");
  });
});

app.post("/Login", function(req, res) {
  req.session.playerName = req.body.playerName;
  var playerID = (Math.floor(Math.random()*100000) + 1);
  req.session.playerID = playerID.toString();
  req.session.gameID = req.body.gameID;
  console.log(req.body);
  var sql = "INSERT INTO `spillere`(`spillerID`, `playerName`, `gameID`, `sessionID`) VALUES ('" + req.session.playerID + "'," + conn.escape(req.session.playerName) + "," + conn.escape(req.body.gameID) + ",'" + req.sessionID + "');";
  console.log(sql);
  conn.query(sql, function(err, result, fields) {
    if (err) throw err;
    console.log(result);
    res.redirect('/?id=' + req.body.gameID);
  });
})

app.post("/getGames", function(req, res) {
  var sql = "SELECT gameID,gameName from games where gameHasStarted=0;";
  conn.query(sql,function(err, result, fields) {
    console.log(result);
    res.send(result);
  });
});

app.post("/GameName", function(req, res) {
  var sql = "SELECT gameName from games where gameID=" + conn.escape(req.body.gameID) + ";";
  conn.query(sql, function(err, result, fields) {
    console.log(result[0]);
    res.send(result[0].gameName);
  });
})

app.post("/getPlayers", function(req, res) {
  var sql = "SELECT playerName from spillere where gameID=" + conn.escape(req.body.gameID) + ";";
  conn.query(sql, function(err, result, fields) {
    console.log(result);
    res.send(result);
  });
})

app.post("/StartGame", function(req, res) {
  var gameID = req.body.gameID;
  var sql = "UPDATE `games` SET `gameHasStarted`=1 WHERE `gameID`=" + gameID +";";
  conn.query(sql, function(err, result, fields) {
    console.log(result);
    res.send(result);
  });
})


//404 error
app.get("*",function(req, res) {
  res.sendFile(__dirname + "/404.html");
})
