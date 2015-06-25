//= require chai
//= require map
var assert = chai.assert;

describe('map ajax', function(){
  beforeEach(function () {
    sinon.spy($, 'ajax');
    this.requests = [];
    this.xhr = sinon.useFakeXMLHttpRequest();
    this.xhr.onCreate = function (req) { this.requests.push(req); }.bind(this);
  });

  afterEach(function () {
    $.ajax.restore();
    this.xhr.restore();
  });

  it('burritoAjax makes an AJAX call to the server', function () {
    var e = {latitude: 39, longitude: -104}
     burritoAjax(e);
     assert($.ajax.calledOnce, 'We hit JQuery\'s AJAX method');
     assert.strictEqual(this.requests.length, 1, 'We made one AJAX request');
   });
});
