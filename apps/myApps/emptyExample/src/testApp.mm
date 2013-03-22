#include "testApp.h"
#include "math.h"
#include "ofBall.h"


//--------------------------------------------------------------
void testApp::setup(){	
	// initialize the accelerometer
    ofSetBackgroundAuto(false);
	ofxAccelerometer.setup();
    
    mySound.loadSound("Renescentia.mp3");
    
	
    if(!my_img.loadImage("teal.jpg")){
        ofLog(OF_LOG_ERROR, "Error while loading image");
    }
    
    if(!my_img2.loadImage("yellow.jpg")){
        ofLog(OF_LOG_ERROR, "Error while loading image");
    }
	//If you want a landscape oreintation 
	//iPhoneSetOrientation(OFXIPHONE_ORIENTATION_LANDSCAPE_RIGHT);
	
	//ofBackground(time, time, time);
    //ofBackground(150, 150, 150);
    ofBackgroundGradient(ofColor(255,50,150), ofColor(((0.5*sin(time/60)+0.5)*255),((0.5*cos(time/30)+0.5)*255),100));
    
    currentX = ofGetWidth()/2;
    currentY = ofGetHeight()/2;
    
    mainX = ofGetWidth()/2;
    mainY = ofGetHeight()/2;
    ofEnableAlphaBlending();
    ofSetFrameRate(150);
    
    //mySound.play(); 
    
    countSize = 1;
    
    inContact = false;

    time = 0;
    
}

//--------------------------------------------------------------
void testApp::update(){

    time = ofGetElapsedTimef()*10;
    // Background gradient controlled by time
    ofBackgroundGradient(ofColor(255,50,150), ofColor(((0.5*sin(time/60)+0.5)*255),((0.5*cos(time/30)+0.5)*255),100));
    
    // Main control for MAIN ENTITY
    // main X, Y is the actual displacement of MAIN ENTITY
    // current X, Y is the current touch location
    mainX += 0.05*(currentX-mainX);
    mainY += 0.05*(currentY-mainY);
    
    for (int i = 0 ; i < NUMBALLS ; i++) {
        myBall[i].update();
        
        // Logic for collision between two shapes
        for ( int j = 0 ; j < NUMBALLS; j++) {
            if ( j != i ) {
                ofVec2f vDist(myBall[i].x-myBall[j].x, myBall[i].y-myBall[j].y);
                float len = vDist.length();
                if (len <= myBall[i].dim+myBall[j].dim) {
                    myBall[i].speedX *= -1;
                    myBall[i].speedY *= -1;
                }
            }
        }
        // Logic for collision between MAIN ENTITY and shape
        ofVec2f vDist(mainX-myBall[i].x, mainY-myBall[i].y); 
        float len = vDist.length(); // Calculate distance between ball
        if (len <= 12+myBall[i].dim +10 && myBall[i].dim != 0) {
            cout << "HIT!";
            inContact = true;
            contactWith = i;
            cout << "\n";
            cout << contactWith;
            cout << "\n";
        }
    }
    
    if (inContact) {
        ofVec2f vDist2(mainX-myBall[contactWith].x, mainY-myBall[contactWith].y);
        float len2 = vDist2.length(); 
        if (len2 <= 12+myBall[contactWith].dim +10) {
            ofSetColor(255-(countSize*5), 0+countSize*5, 0);
            ofCircle(myBall[contactWith].x, myBall[contactWith].y, myBall[contactWith].dim+countSize);
            countSize++;
            cout << contactWith;
            cout << "\n";
            if (countSize >= 30) {
                myBall[contactWith].dim = 0;
                inContact = false;
                myEntity.numEat++;
                cout << myEntity.numEat;
            }
        }
        else {
            inContact = false;
        }
    }
    else {
        countSize = 1;
    }
    
    cout << "\n";

} //END UPDATE()

//--------------------------------------------------------------
void testApp::draw(){
    //ofScale(1.0*(0.5*sin(time*2.08)+0.5), 1);
    for (int i = 0 ; i < NUMBALLS ; i++) {
        myBall[i].draw();
    }

    ofEnableBlendMode(OF_BLENDMODE_MULTIPLY);
	my_img.draw(0,0);
    ofEnableBlendMode(OF_BLENDMODE_MULTIPLY);
    my_img2.draw(x,y);
    ofDisableBlendMode();
    
    myEntity.draw(time, currentX, currentY, mainX, mainY);
    
    ofSetColor(255, 0, 0);
    ofFill();
    /*
    ofLine(mainX, mainY, currentX, currentY);
    ofLine(mainX, mainY, currentX, mainY);
    ofLine(currentX, mainY, currentX, currentY);
    ofLine(mainX, mainY, currentX, currentY);
    */
    
    // RESET COLOR FILL
    ofSetColor(255,255,255);
    
    
}

//--------------------------------------------------------------
void testApp::exit(){

}

//--------------------------------------------------------------
void testApp::touchDown(ofTouchEventArgs & touch){
   currentX = touch.x;
   currentY = touch.y;
   
}

//--------------------------------------------------------------
void testApp::touchMoved(ofTouchEventArgs & touch){
    x = touch.x-250;
    y = touch.y-250;
    currentX = touch.x;
    currentY = touch.y;
}

//--------------------------------------------------------------
void testApp::touchUp(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void testApp::touchDoubleTap(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void testApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void testApp::lostFocus(){

}

//--------------------------------------------------------------
void testApp::gotFocus(){

}

//--------------------------------------------------------------
void testApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void testApp::deviceOrientationChanged(int newOrientation){

}

