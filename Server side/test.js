var http = require('http');
var url = require('url');
var md5 = require('md5');

function User() {
    var ID = md5(Math.random());

    this.getUserID = function () {
        return ID;
    }
}

function Player(ID, num) {
    var number = num;
    var hand = [];
    var ranksWon = [];
    var playerID = ID;

    this.addToHand = function(card) {
        hand.push(card);
    }

    this.removeFromHand = function (card) {
        var pos = hand.indexOf(card);
        hand.splice(pos, 1);
    }

    this.getHand = function () {
        return hand;
    }

    this.getID = function () {
        return playerID;
    }
}

function Game(users) {
    var deck = [];
    var Finished = false;

    this.players = [];
    this.players = users;

    this.isFinished = function () {
        return Finished;
    }

    this.dealToPlayer = function (player) {
        for (x = 0; x < 8; x++) {
            this.players[player].addToHand(deck.pop());
        }
    }

    for (i = 0; i < 52; i++) {
        deck[i] = i;
    }

    for (i = 0; i < this.players.length; i++) {
        this.players[i] = new Player(i);
        dealToPlayer(i);
    }

}

function Lobby() {
    var Games = [];
    var waitingUsers = [];

    this.maybeNewGame = function () {
        if (waitingUsers.length > 1) this.createNewGame();
    }

    this.createNewGame = function () {
        var g = new Game(waitingUsers)
        Games.push(g)
        waitingUsers.empty();
    }

    this.maybeRemoveGame = function () {
        for (i = 0; i < Games.length; i++) {
            if (Games[i].isFinished()) {
                Games.splice(i, 1);
            }
        }
    };

    this.addUser = function (user) {
        waitingUsers.push(user);
    }

}

var G = new Game();



http.createServer(function (req, res) {
    var q = url.parse(req.url, true);
    var qdata = q.query;
    var playerID = qdata.player;
    res.writeHead(200, {'Content-Type': 'text/html'});
    if (playerID >= 0) {
        res.write('Player:' + '<br/>' + playerID + '<br/>');
        res.write('Cards:' + '<br/>');
        for (i = 0; i < 8; i++) {
            res.write(G.players.getHand()[i].toString() + '<br/>');
        }
    }
    res.end();
}).listen(8080);