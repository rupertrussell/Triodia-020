# Triodia-020

A work in progress
designed to help measure to scale points on a photograph

// Display photo of a transect with scale 
// 1) Click on top corner of transect scale in photo
// 2) click on oposite corner of transect scale eg 1 meter from first click on photo
// 3) move the mouse to the first point you eant to measure press 1
// 4) move the mouse to the second point you want to measure press 2
// 5) read the distance releative to the scape of the transct in meters
// move mouse to a new point press 1 move to another point and press 2 
// sread new distance between points

version 28  added WSAD movement of large images
I setill need to use an array to track and re draw points after panning on the screen

Version 33 stores the points in an array and uses it to redraw the points when the screen is panned.
The only thing I want to do now is to save the full image and not just the screen.
I think I might be able to do that by reading the image into a pixel array but I am not sure if I can save the array back to an image.

I also want to be able to trace around the outline of a hummock and add up the length.
