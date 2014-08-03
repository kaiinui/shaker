a = {
  x: 0,
  y: 0,
  z: 0,
  f: 0
}

window.onload = ->
  Score = {
    $el: document.querySelector('._score'),
    _score: 0,
    incrementScore: ->
      @_score += 1
      @$el.innerHTML = @_score
  }
  window.addEventListener 'devicemotion', (e)->
    newX = e.acceleration.x
    newY = e.acceleration.y
    newZ = e.acceleration.z
    dx = a.x - newX
    dy = a.y - newY
    dz = a.z - newZ
    a.x = newX
    a.y = newY
    a.z = newZ
    newF = dx^2 + dy^2 + dz^2
    df = (newF - a.f)^2
    a.f = newF
    Score.incrementScore() if df > 10