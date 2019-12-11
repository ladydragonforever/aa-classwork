console.log("Webpack is working!")
const MovingObject = require('./moving_object.js');
const Asteroid = require('./asteroid.js');
const Game = require('./game.js');
const GameView = require('./game_view.js');
const Ship = require('./ship.js');



const canvas = document.getElementById('game-canvas');
const context = canvas.getContext('2d');
// context.fillStyle = 'black';

// const object1 = new MovingObject([30, 30], [10, 10], 10, "#00FF00");
// const asteroid = new Asteroid([50, 50]);
// const game = new Game();
// game.draw(context);
// debugger
const game_view = new GameView(context);
game_view.start();
// object1.draw(context);
// asteroid.draw(context);



window.MovingObject = MovingObject;
window.Asteroid = Asteroid;
window.Game = Game;
window.GameView = GameView;
window.Ship = Ship;