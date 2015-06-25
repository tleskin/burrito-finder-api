//= require chai
//= require favorite_burrito
var assert = chai.assert;

describe("favorite_burrito.js", function() {
  it ("favBurritoObject()", function() {
    var thing = "0 Illegal Pete's"
    var burritos = [{table: 0}, { table: 1}, {table: 2}, { table: 3 }]

    assert.deepEqual( {table: 0}, favBurritoObject(burritos, thing));
  });
});
