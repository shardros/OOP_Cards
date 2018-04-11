var http = require('http');
var url = require('url');
var md5 = require('md5');

const s = 1;
const r = 0;

function User() {
    const ID = md5(Math.random());
    this.inGame = false;
    this.dataForUser = [[]];

    this.getUserID = function () {
        return ID;
    }
}

function Player(User, num) {
    var number = num;
    var hand = [];
    var ranksWon = [];

    this.addToHand = function(card) {
        hand.push(card);
    };

    this.removeFromHand = function (card) {
        var pos = hand.indexOf(card);
        hand.splice(pos, 1);
    };

    this.getHand = function () {
        return hand;
    };

    this.getID = function () {
        return User.getUserID();
    }
}


function Game(users) {
    var deck = [];
    var Finished = false;

    this.gameID = md5(Math.random());
    this.players = users;

    this.dealToPlayer = function (player) {
        for (var x = 0; x < 8; x++) {
            this.players[player].addToHand(deck.pop());
        }
    };

    this.askForCard = function (rank, player) {
        for (var i = 0; i < this.players.length; i++) {
            if (player != players[i]) {
                var tempHand = this.players[i].getHand();
                for (var x = 0; x < tempHand.length; x++) {
                    if (tempHand[x][r] == rank) {
                        player.addToHand(this.players[i].removeFromHand(temphand[x]));
                    }
                }
            }
        }
    }


    for (var i = 0; i < 52; i++) {
        deck.push([i % 13, i % 4]);
    }

    for (i = 0; i < this.players.length; i++) {
        this.players[i] = new Player(users[i], i);
        this.players[i].inGame = this.gameID;
        this.dealToPlayer(i);
    }

}

function Lobby() {
    this.waitingUsers = [];
    this.users = [];
    this.games = [];


    this.maybeNewGame = function () {
        if (this.waitingUsers.length > 1) {

            var g = new Game(this.waitingUsers);
            this.games.push(g);
            for (var i = 0;i < this.waitingUsers.length; i++) {
                for (var x = 0;x < this.waitingUsers.length; x++) {
                    console.log(this.waitingUsers[i].dataForUser);
                }
                //this.waitingUsers[i].dataForUser.push("NEW GAME: " + this.games.gameID);
            }
            //this.waitingUsers.clear();

            return this.games.indexOf(g);
        } else {
            return false
        }
    };

    this.getDataForUser = function(user) {
        console.log("data for user " + user.dataForUser.toString());
        return "inGame: " + user.inGame + "; Data:" + user.dataForUser + ";";

    }
}


//=========---Main Program---=========

lobby = new Lobby();

http.createServer(function (req, res) {
    var q = url.parse(req.url, true);
    var qdata = q.query;

    var userID = qdata.userID;

    console.log("USER ID: " + userID);

    var operator = qdata.operator;
    var operand = qdata.operand;

    var userExists = false;

    for (var i = 0;i < lobby.users.length; i++) {
        console.log("checking against user: " + lobby.users[i].getUserID().toString())
        if (lobby.users[i].getUserID() == userID) {
            var user = lobby.users[i];
            userExists = true;
            console.log("found user: " + userID);
            break;
        }
    }

    if (userExists) {
        if (!user.inGame) {
            lobby.waitingUsers.push(user);
            user.dataForUser.push("IN LOBBY");
            lobby.maybeNewGame();
        }
        res.write(lobby.getDataForUser(user).toString());
    } else {
        //create a user
        var u = new User();
        lobby.users.push(u);
        lobby.waitingUsers.push(u);
        u.dataForUser.push("IN LOBBY");
        lobby.maybeNewGame();
        res.write("NEW USER: " + u.getUserID().toString());
    }

    /*
    switch (operator.toString()) {
        case "Ask":
    }*/

    res.end();

}).listen(8080);