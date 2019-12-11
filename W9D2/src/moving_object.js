// const Game = require("./game.js")

function MovingObject(pos, vel, radius, color, game) {
  this.pos = pos;
  this.vel = vel;
  this.radius = radius;
  this.color = color;
  this.game = game;
}

MovingObject.prototype.draw = function(context) {
  // const centerX = canvas.width / 2;
  // const centerY = canvas.height / 2;
  context.beginPath();
  context.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI);
  context.fillStyle = this.color;
  context.fill();
  context.lineWidth = 2;
  context.stroke();
};

MovingObject.prototype.move = function() {
  this.pos = [this.pos[0] + this.vel[0], this.pos[1] + this.vel[1]];

  this.pos = this.game.wrap(this.pos);
};

MovingObject.prototype.isCollideWith = function(otherObject) {
  let distance = Math.pow(this.pos[0] - otherObject.pos[0],2) + Math.pow(this.pos[1] - otherObject.pos[1], 2);
  distance = Math.sqrt(distance);

  if (distance < (this.radius + otherObject.radius)) {
    return true;
  } else {
    return false;
  }
};

MovingObject.prototype.collideWith = function(otherObject) {
  // this.game.remove(this);
  // this.game.remove(otherObject);
}; 


module.exports = MovingObject;