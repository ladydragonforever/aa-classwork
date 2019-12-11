const MovingObject = require('./moving_object.js');
const Util = require('./util.js');
// const Game = require('./game.js');

function Asteroid (pos, game) {
  // MovingObject.call(this, color);
  // MovingObject.call(this, radius);
  // MovingObject.call(this, pos);
  // MovingObject.call(this, Util.randomVec(5));
  COLOR = "red";
  RADIUS = 20;
  MovingObject.call(this, pos, Util.randomVec(10), RADIUS, COLOR, game);
}

Asteroid.prototype.collideWith = function (otherObject) {
  if (otherObject instanceof Ship) return otherObject.relocate();
  // this.game.remove(this);
  // this.game.remove(otherObject);
}; 

Util.inherits(MovingObject, Asteroid);

module.exports = Asteroid;