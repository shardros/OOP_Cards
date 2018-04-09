var http = require('http');
var url = require('url');

function Player(num) {
    var number = num;
    var hand = [];
    var ranksWon = [];

    this.addToHand = function(card) {
        hand.push(card);
    }

    this.removeFromHand = function (card) {
        var pos = hand.indexOf(card);
        hand.splice(pos, 1);
    }

    this.getHand = function () {
        result = hand;
    }
}

function Game(numOfPlayers) {
    var deck = [];
    this.players = [];
    var numberOfPlayers = numOfPlayers;

    this.dealToPlayer = function (player) {
        for (x = 0; x < 8; x++) {
            this.players[player].addToHand(deck.pop());
        }
    }

    for (i = 0; i < 52; i++) {
        deck[i] = i;
    }

    for (i = 0; i < numOfPlayers+1; i++) {
        this.players[i] = new Player(i);
        dealToPlayer(i);
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
