//= require render-ideas.js

describe('truncateBodies', function () {
  it('truncates bodies longer than 100 chars', function () {
    var body = 'I want to be the very best, like no one ever was. To catch them is my real test, to train them is my cause.'
    var truncated = 'I want to be the very best, like no one ever was. To catch them is my real test, to train them is...'
    expect(truncateBodies(body)).to.equal(truncated)
  });
});
