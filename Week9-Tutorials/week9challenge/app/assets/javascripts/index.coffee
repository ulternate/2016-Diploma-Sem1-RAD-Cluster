# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  # Update time function will change the time values to reflect the current time and will colour the page/text.
  updateTime = ->
    hour = parseInt($('#hour').text())
    minute = parseInt($('#min').text())
    second = parseInt($('#sec').text())
    
    second++
    
    # Loop the seconds, minutes and hours if they're over the limits
    if second > 59
      second = 0
      minute++
    
    if minute > 59
      minute = 0
      hour++
    
    if hour > 23
      hour = 0
    
    # Check if the time's are single digits, if so add a '0'
    s = second.toString()
    m = minute.toString()
    h = hour.toString()
    lenS = second.toString().length
    lenM = minute.toString().length
    lenH = hour.toString().length
    
    if lenS < 2
      s = '0' + s
    
    if lenM < 2
      m = '0' + m
    
    if lenH < 2
      h = '0' + h
    
    # Update the text values
    $('#hour').text h
    $('#min').text m
    $('#sec').text s

    # Get the colour from the time value and get the inverse colour
    colour = h + m + s
    inverseColour = getInverse(colour)
    colour = "#" + colour

    # Apply the colour styles.
    $("body").css({"background-color": colour, "color": inverseColour})

    return
  
  # Get the inverse colour
  getInverse = (colour) ->
    inverseColour = parseInt(colour)
    inverseColour = 0xFFFFFF ^ inverseColour
    inverseColour = inverseColour.toString(16)
    inverseColour = ("000000" + inverseColour).slice(-6)
    inverseColour = "#" + inverseColour
    return inverseColour

  # Run the updateTime function every second
  setInterval updateTime, 1000
  return