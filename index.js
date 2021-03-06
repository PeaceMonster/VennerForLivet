
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
  database:"vennerForLivet",
  clearExpired: true,
  checkExpirationInterval: 60 * 1000,
  expiration: 60*1000
});

app.use(session({
  key: 'playerName',
  secret: 'DlS&xs#uKBZv!8vD8Q*oA#N!h^S&6tts',
  store: sessionStore,
  resave: false,
  rolling: true,
  saveUninitialized: false,
  cookie: {
    maxAge: 60*1000,
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
    socket.to(roomNumber).emit('newPlayer');
    console.log('User connected to: ' + roomNumber);
  });
  socket.on('vote', function(roomNumber, playerID, sender) {
    io.to(roomNumber).emit('inVote', sender, playerID);
    var sql = 'UPDATE `spillere` SET `hasVoted`=1 WHERE `gameID`=' + conn.escape(roomNumber) + ' and `spillerID`=' + conn.escape(sender) + ';'
    conn.query(sql, function(err, result) {
      var sql = 'select * from `spillere` where `gameID`=' + conn.escape(roomNumber) + ';';
      conn.query(sql, function(err, playerTotal) {
        var sql = 'select * from `spillere` where `gameID`=' + conn.escape(roomNumber) + ' and `hasVoted`=1;';
        conn.query(sql, function(err, playerVoted) {
          if (playerTotal.length <= playerVoted.length) {
            io.to(roomNumber).emit('next');
            console.log('next');
          }
        });
      });
    });
  });
  socket.on('nextQ', function(roomNumber) {
    console.log('True');
    var sql = "UPDATE `spillere` SET `hasVoted`=0 WHERE `gameID`=" + roomNumber + ";"
    conn.query(sql);
    io.to(roomNumber).emit('nextQ');
    var qID = Math.floor(Math.random() * 291) + 1
    var sql = 'select question from questions where ID=' + qID + ';';
    conn.query(sql, function(err, result) {
      io.to(roomNumber).emit('newQ', result[0].question);
    });
  });
  socket.on('disconnect', function() {
    console.log("User disconnected");
  });
});

app.get('/createGame', function(req, res) {
  res.sendFile(__dirname + '/createGame.html');
})

app.post('/addGame', function(req, res) {
  var gameID = (Math.floor(Math.random()*100000) + 1);
  var gameName = conn.escape(req.body.gameName);
  if (req.body.private) {
    var privateGame = "1";
  } else {
    var privateGame = "0";
  }
  var sql = 'INSERT INTO `games`(`gameID`, `gameName`, `gameHasStarted`, `private`, `gameStage`) VALUES (' + gameID + ',' + gameName + ',0,' + privateGame + ',0);';
  conn.query(sql);
  console.log(sql);
  res.redirect('/?id=' + gameID);
})


app.post("/Login", function(req, res) {
  req.session.playerName = req.body.playerName;
  var playerID = (Math.floor(Math.random()*100000) + 1);
  req.session.playerID = playerID.toString();
  req.session.gameID = req.body.gameID;
  console.log(req.body);
  var sql = "INSERT INTO `spillere`(`spillerID`, `playerName`, `gameID`, `sessionID`) VALUES ('" + req.session.playerID + "'," + conn.escape(req.session.playerName) + "," + conn.escape(req.body.gameID) + ",'" + req.session.id + "');";
  console.log(sql);
  conn.query(sql, function(err, result, fields) {
    if (err) throw err;
    console.log(result);
    res.redirect('/?id=' + req.body.gameID);
  });
})

app.post("/getGames", function(req, res) {
  var sql = "SELECT gameID,gameName from games where gameHasStarted=0 and private=0;";
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
  var sql = "SELECT playerName,spillerID from spillere where gameID=" + conn.escape(req.body.gameID) + ";";
  conn.query(sql, function(err, result, fields) {
    console.log(result);
    res.send(result);
  });
})

app.post("/getState", function(req, res) {
  var sql = "SELECT gameStage from games where gameID=" + req.body.gameID + ";";
  conn.query(sql, function(err, result) {
    res.send(result[0]);
  });
})

app.post("/StartGame", function(req, res) {
  var gameID = req.body.gameID;
  var sql = "UPDATE `games` SET `gameHasStarted`=1,gameStage=1 WHERE `gameID`=" + gameID +";";
  conn.query(sql, function(err, result, fields) {
    console.log(result);
    res.send(result);
    var qID = Math.floor(Math.random() * 291) + 1
    var sql = 'select question from questions where ID=' + qID + ';';
    conn.query(sql, function(err, result) {
      io.in(gameID).emit('newQ', result[0].question);
    });
    io.in(gameID).emit("startGame", "startGame");
  });
})

app.post('/getID', function(req, res) {
  res.send(req.session.playerID);
})

//404 error
app.get("*",function(req, res) {
  res.sendFile(__dirname + "/404.html");
})

app.get('/refreshSession', function(req, res) {
  res.send('Ok');
})

setInterval(function() {
  var sql = 'select spillerID,sessionID from spillere';
  conn.query(sql, function(err, allPlayers) {
    sql = 'select `session_id` from sessions';
    conn.query(sql, function(err, allSessions) {
      var isPlaying = false;
      for (let i = 0; i < allPlayers.length; i ++) {
        isPlaying = false;
        for (let j = 0; j < allSessions.length; j++) {
          if (allPlayers[i].sessionID == allSessions[j].session_id) {
            isPlaying = true;
          }
        }
        if (!isPlaying) {
          sql = 'DELETE FROM `spillere` WHERE `spillerID`="' + allPlayers[i].spillerID + '";';
          conn.query(sql);
          console.log('Player removed');
        }
      }
    });
  });
  sql = 'SELECT `gameID` FROM `games` WHERE `gameHasStarted`=1;';
  conn.query(sql, function(err, gamesStarted) {
    sql = 'SELECT `gameID` FROM `spillere`;';
    conn.query(sql, function(err, gamesWithPlayers) {
      for (let i = 0;i < gamesStarted.length; i++) {
        var hasPlayers = false;
        for (let j = 0;j < gamesWithPlayers.length; j++) {
          if (gamesStarted[i].gameID == gamesWithPlayers[j].gameID) {
            hasPlayers = true;
          }
        }
        if (!hasPlayers) {
          sql = 'DELETE FROM `games` WHERE `gameID`=' + gamesStarted[i].gameID + ';'
          conn.query(sql);
          console.log('Game Deleted');
        }
      }
    })
  });
}, 60000);
