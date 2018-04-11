var http = require('http');
var url = require('url');
var md5 = require('md5');

function User() {
    const ID = md5(Math.random());

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

    this.players = users;

    this.dealToPlayer = function (player) {
        for (x = 0; x < 8; x++) {
            this.players[player].addToHand(deck.pop());
        }
    };

    this.getDataForUser = function (userID) {
        for (i = 0; i < this.players.length; i++) {
            if (userID == this.players[i].getUserID()) {
                var player = this.players[i];
                break
            }
        }

        return "HAND: " + player.getHand().toString();
    }


    for (i = 0; i < 52; i++) {
        deck[i] = i;
    }

    for (i = 0; i < numOfPlayers+1; i++) {
        this.players[i] = new Player(i);
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
            this.waitingUsers.empty();

            return this.games.indexOf(g);
        } else {
            return false
        }
    };

    this.maybeRemoveGame = function () {
        for (i = 0; i < this.games.length; i++) {
            if (this.games[i].isFinished()) {
                this.games.splice(i, 1);
            }
        }
    };
}

//=========---Main Program---=========

lobby = new Lobby();

http.createServer(function (req, res) {
    var q = url.parse(req.url, true);
    var qdata = q.query;

    var userID = qdata.userID;
    var gameNum =  qdata.gameNum;
    var userIndex = null;

    for(var i = 0; i < lobby.users.length; i++) {
        if (lobby.users[i].getUserID() == userID) {
            userIndex = i;
            break;
        }
    }

    if (userIndex == null) {
        var u = new User();
        lobby.users.push(u);
        userID = u.getUserID();
        res.write("USERID: " + userID.toString());
        lobby.waitingUsers.push(u);
    } else {
        res.write("USERID: " + userID + ";");
        var u = lobby.users[userIndex];
        if (!lobby.waitingUsers.includes(u)) { //Contains is not a function
            lobby.waitingUsers.push(u);
        } else {
            res.write(lobby.games[gameNum].getDataForUser(userID));
        }
    }

    var potentialGame = lobby.maybeNewGame();

    if (potentialGame != false) {
        res.write("INIT NEW GAME;")
        var game = potentialGame;
        for (i = 0; i < game.players.length; i++) {
            if (userID == game.players.users[i].getUserID()) {
                var user = game.players.users[i];
                break
            }
        }
        var playerNumber = game.players.indexOf(user);
        res.write("PlayerNumber " + playerNumber.toString());
    }

    res.end();

}).listen(8080);
