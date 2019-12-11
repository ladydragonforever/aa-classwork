const Game = require('./game.js');

function GameView(ctx) {
  this.game = new Game();
  this.context = ctx;
}

GameView.prototype.start = function() {
  let context = this.context;
  // let that = this;
  // setInterval(this.game.moveObjects.bind(this.game), 20);
  // setInterval(function(){
  //   that.game.moveObjects();
  // }, 20);
  setInterval(() => this.game.step(), 20);
  setInterval(() => this.game.draw(context), 20);  
};

module.exports = GameView; 