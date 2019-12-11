const Asteroid = require("./asteroid.js");
const Ship = require('./ship.js');

function Game() {
  DIM_X = 500;
  DIM_Y = 500;
  NUM_ASTEROIDS =4;
  this.ship = new Ship(this.randomPosition(), this);
  this.asteroids = [];
  while(this.asteroids.length < NUM_ASTEROIDS) {
   this.asteroids.push(this.addAsteroids());
  }
  this.allObjects();
}

Game.prototype.allObjects = function() {
  this.asteroids.push(this.ship);
};

Game.prototype.addAsteroids = function() {
 let position = this.randomPosition(); 
 return new Asteroid(position, this);
 
};

Game.prototype.randomPosition = function() {
  let min_X = 0;
  let max_X = DIM_X;
  let min_Y = 0;
  let max_Y = DIM_Y;
  let pos_X = Math.random()*(max_X - min_X)  + min_X;
  let pos_Y = Math.random() * (max_Y - min_Y) + min_Y;
  return [Math.floor(pos_X), Math.floor(pos_Y)];

};

Game.prototype.draw = function(context) {
  context.clearRect(0,0,500,500);
  this.asteroids.forEach (el => el.draw(context));
};

Game.prototype.moveObjects = function() {
  this.asteroids.forEach (el => el.move());
};

Game.prototype.wrap = function(pos) {
  // if (pos[0] === 500) {
  //   return [0, pos[1]];
  // } else if (pos[0] === 0){
  //   return [500, pos[1]];
  // } else if (pos[1] === 0) {
  //   return [pos[0], 500];
  // } else if (pos[1] === 500) {
  //   return [pos[0], 0];
  // } else {
  //   return pos;
  // }
  if (pos[0] > 0 && pos[1] > 0) { 
    return [pos[0] % DIM_X, pos[1] % DIM_Y];
  } else if (pos[0] > 0 && pos[1] < 0) {
    return [pos[0] % DIM_X, pos[1] + DIM_Y];
  } else if (pos[0] < 0 && pos[1] > 0) {
    return [pos[0] + DIM_X, pos[1] % DIM_Y];
  } else if (pos[0] < 0 && pos[1] < 0) {
    return [pos[0] + DIM_X, pos[1] % DIM_Y];
  }
};

Game.prototype.checkCollisions = function(){
  for(let i = 0; i < this.asteroids.length-1; i++) {
    for(let j = i+1; j < this.asteroids.length; j++) {
    if (this.asteroids[i].isCollideWith(this.asteroids[j])) {
      this.asteroids[i].collideWith(this.asteroids[j]);
      }
    }
  }
};

Game.prototype.step = function() {
  this.moveObjects();
  this.checkCollisions();
};

Game.prototype.remove = function(asteroid) {
  this.asteroids.splice(this.asteroids.indexOf(asteroid),1);
};

module.exports = Game;