var http = require('http');
var url = require('url');


function Game() {

    this.deck =[]; //I know these should be private with get functions but this is easy
    this.hands = [[]];
    this.playerNum = 0;

    var i;
    for (i = 0; i < 52; i++) {
        this.deck[i] = i;
    }

    this.createPlayer = function () {
        if (playerNum < 7) {
            this.hands.push([null]);
            var number = this.dealToPlayer(playerNum);
            this.playerNum++;
            return number;
        } else {
            return false
        }
    }

    this.dealToPlayer = function (player) {
        var playerHand = [];

        for (x = 0; x < 8; x++) {
            playerHand.push(this.deck.pop());
        }
        this.hands[player] = playerHand;
        return this.hands[player];
    }
};

var G = new Game();
var i = 0

http.createServer(function (req, res) {
    var q = url.parse(req.url, true);
    var qdata = q.query;
    res.writeHead(200, {'Content-Type': 'text/html'});

    if (qdata.player == null) {
        var playerNo = G.createPlayer();
        if (playerNo >= 0) {
            res.write('Player:' + '<br/>' + playerNo + '<br/>');
            res.write('Cards:' + '<br/>');
            for (i = 0; i < 8; i++) {
                res.write(G.hands[playerNo][i].toString() + '<br/>');
            }
        }
    }

    res.end();
}).listen(8080);
