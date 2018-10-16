# Triodia-020

A work in progress
designed to help measure to scale points on a photograph

// 1) Click on top corner of transect scale in photo
// 2) click on oposite corner of transect scale eg 1 meter from first click on photo
// 3) move the mouse to the first point you want to measure press 1
// 4) move the mouse to the second point you want to measure press 2
// 5) read the distance releative to the scale of the transct in meters

// To outline the perimeter of a Triodia hummock
// 1) Move the mouse to the edge of a hummock and press N for (New)
// 2) Move the mouse around the edge of the hummoick and press P for each Point you want to mark
// 3) Press O to close the polygon when you have marked the last point
// The length of the Perimiter will be dislayed in Meters.

// point INSIDE the perimiter and press I to fill with Yelow
// you may need to repeat the fill in any missed areas 

// press Y to count the Yellow Pixels and display the enclosed Area
// Note at present only one enclosed area can be measured  if you enclose
// additional areas the enclosed areas will be added to eachother.


version 28  added WSAD movement of large images
I still need to use an array to track and redraw points after panning on the screen

Version 33 stores the points in an array and uses it to redraw the points when the screen is panned.
The only thing I want to do now is to save the full image and not just the screen.
I think I might be able to do that by reading the image into a pixel array but I am not sure if I can save the array back to an image.
(I never worked out a way to do that)

Version 92 is the "final " version it can draw a 

