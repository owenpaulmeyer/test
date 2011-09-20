//Owen Meyer
//processingFinal:  graph y = x^4
//

float [] coefPass = {10,0,1 };  //the first item in the list is the y intercept
                                   //the last item is the x coefficient of the hightest
                                  //exponent. 0's must be used for x's not present
float xStart = -7;  //the first x input value
float xEnd = 7;  //the last x input value
float xInc = .01;  //x is iterated by this amount
float xScale = 100;  //scales what is displayed (x values)
float yScale = 1;  //scales what is displayed (y values)


void setup(){
  smooth();
  size( 400, 400 );
  translate( width/2, height-10 );  //moves origin to center of screen
  scale( 1, -1 );  //"corrects" y axis orientation
  noFill();
  stroke( 255, 0, 0 );  //red is for x
  line( -width/2, 0, width/2, 0);  //x axis
  stroke( 0, 255, 0 );  //green is for y
  line( 0, -height/2, 0, height/2 );  //y axis
  stroke( 0 );  //black for drawing the function

  displayxNy();  //graph the curve
}

//  the magic of it all
//  inputs the coefficient array and an x value
//  computes the y value for this x input 
float polyFunct( float[] coef, float ex){  
  float carrier = 0;  //carries the acumulative sum as polyFunct iterates through the coefficients of x

  for( int idx = 0; idx < coef.length; idx++ ){
    carrier = (3 * pow(ex, 2) + 2 )/( 4 * pow(ex,4));//+= coef[ idx ] * pow( ex, idx );  //acumulates the sum of the x-terms
  }
  return carrier;  //output of y for x ("ex")
}

// uses polyFunct to calculate y's for x's and graphs these vertices
void displayxNy(){
  beginShape();
  for( float xIterate = xStart; xIterate < xEnd; xIterate += xInc ){
    vertex( xIterate * xScale, polyFunct(coefPass, xIterate)*yScale );
    println("x: "+ xIterate + "  y: " + polyFunct(coefPass, xIterate));
  }
  endShape();
  
}
  
