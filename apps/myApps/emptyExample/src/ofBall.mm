#include "ofBall.h"
#include "testApp.h"


ofBall::ofBall()
{
    x = ofRandom(0, MAXHEIGHT);      // give some random positioning
    y = ofRandom(0, MAXWIDTH);
    
    speedX = ofRandom(-3, 3);           // and random speed and direction
    speedY = ofRandom(-3, 3);
    
    //speedX = 5;         // and random speed and direction
    //speedY = 5;
    
    colorR = ofRandom(255);
    colorG = ofRandom(255);
    colorB = ofRandom(255);
        
    dim = ofRandom(1, 10);
}

void ofBall::update(){
    if(x < 0 + dim ){
        x = 0 + dim;
        speedX *= -1;
    } else if(x > MAXHEIGHT - dim){
        x = MAXHEIGHT - dim;
        speedX *= -1;
    }
    
    if(y < 0 + dim){
        y = 0 + dim;
        speedY *= -1;
    } else if(y > MAXWIDTH - dim){
        y = MAXWIDTH - dim;
        speedY *= -1;
    } 
    
    x+=speedX;
    y+=speedY;
    

}

void ofBall::draw(){
    // values for R, G, B
//<<<<<<< HEAD
    //Playing around with the ball's shape
    ofSetColor(colorR, colorG, colorB);
    ofCircle(x, y, dim);
    ofRect(x,y,dim, dim);
//=======
    ofSetColor(colorR, colorG, colorB);
    
//>>>>>>> I tried to create a random number of balls at once!
    ofSetColor(255,255,255);
} 