#include "ofBall.h"
#include "testApp.h"


ofBall::ofBall()
{
    x = ofRandom(0, MAXHEIGHT);      // give some random positioning
    y = ofRandom(0, MAXWIDTH);
    
    //speedX = ofRandom(-5, 5);           // and random speed and direction
    //speedY = ofRandom(-5, 5);
    
    speedX = 5;         // and random speed and direction
    speedY = 5;
    
    dim = 20;
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
    ofSetColor(120,120,120);
    ofCircle(x, y, dim);
    ofSetColor(255,255,255);
} 