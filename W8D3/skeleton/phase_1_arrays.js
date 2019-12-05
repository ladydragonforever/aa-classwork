Array.prototype.uniq = function() { 
  let result = [];
  // Array.prototype.forEach( el => {
  //   result.push(el);
  // });
  this.forEach(el => {
    if (!result.includes(el)) {
      result.push(el);
    }
    }
    );
  return result;
};

Array.prototype.twoSum = function() {
  const result = [];
  for (let i = 0; i < this.length-1; i++) {
    for (let j = i+1; j < this.length; j++) {
      if (this[i]+this[j] === 0) {
        result.push([i,j]);
      }
    }
  } 
  return result;
};

Array.prototype.transpose = function(){
  const result = new Array(this[0].length).fill(0).map(() => new Array(this.length));
  for(let i = 0; i < this.length; i++){
    for(let j = 0; j < this[0].length; j++){
      result[j][i] = this[i][j];
    }
  }

  return result;
};


Array.prototype.myEach = function (callback) {
  for (let index = 0; index < this.length; index++) {
    callback(this[index]);
  }
};






