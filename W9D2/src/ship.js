const MovingObject = require('./moving_object.js');
const Util = require('./util.js');

function Ship(pos, game) {
  COLOR = "green";
  RADIUS = 20;
  MovingObject.call(this, pos, Util.randomVec(0), RADIUS, COLOR, game);
}

Ship.prototype.relocate = function() {
  this.pos = this.game.randomPosition();
  this.vel = Util.randomVec(0);
};

Util.inherits(MovingObject, Ship);

module.exports = Ship;