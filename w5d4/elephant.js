function Elephant(name, height, tricks_array) {
  this.name = name;
  this.height = height;
  this.tricks = tricks_array;
};

Elephant.prototype.trumpet = function() {
  console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`);
};

Elephant.prototype.grow = function() {
  return this.height = this.height + 12;
};

Elephant.prototype.addTrick(new_trick) = function() {
  this.tricks.push(new_trick);
};

Elephant.prototype.play = function() {
  trickIndex = Math.floor(Math.random() * this.tricks.length);
  console.log(`${this.name} is ${this.tricks[trickIndex]}!`);
};

Elephant.paradeHelper = function (elephant) {
  console.log(`${elephant.name} is trotting by!`);
};