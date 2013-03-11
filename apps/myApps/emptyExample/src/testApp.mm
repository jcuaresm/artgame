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
    lastX = ofGetWidth()/2;
    lastY = ofGetHeight()/2;
    
    originX = ofGetWidth()/2;
    originY = ofGetHeight()/2;
    
    mainX = ofGetWidth()/2;
    mainY = ofGetHeight()/2;
    ofEnableAlphaBlending();
    ofSetFrameRate(150);
     mySound.play(); 
    
}

//--------------------------------------------------------------
void testApp::update(){
    //ofBackground(time, time, time);
    ofBackgroundGradient(ofColor(255,50,150), ofColor(((0.5*sin(time/60)+0.5)*255),((0.5*cos(time/30)+0.5)*255),100));
    
    //if (mainX != currentX)
        mainX += 0.05*(currentX-mainX);

        
    
        mainY += 0.05*(currentY-mainY);
    
    for (int i = 0 ; i < NUMBALLS ; i++)
    {
        //myBall[i].update();
    }
    myBall.update();
}

//--------------------------------------------------------------
void testApp::draw(){
    //ofScale(1.0*(0.5*sin(time*2.08)+0.5), 1);
    myBall.draw();
    ofEnableBlendMode(OF_BLENDMODE_MULTIPLY);
	my_img.draw(0,0);
    ofEnableBlendMode(OF_BLENDMODE_MULTIPLY);
    my_img2.draw(x,y);
    ofDisableBlendMode();
    ofSetColor(((0.5*sin(time/5)+0.5)*50), ((0.5*sin(time/5)+0.5)*100), ((0.5*sin(time/5)+0.5)*255));
    ofFill();
    ofTriangle(0,0,10,10,20,0);
    
    
    /////// ENTITY Start
    ofPushMatrix();
    {
        ofTranslate(mainX, mainY);
       // ofRotate(time);
    
        ofVec2f v1(currentX-mainX, mainY);
        ofVec2f v2(currentX-mainX, mainY-currentY);

        v1.normalize();
        v2.normalize();
        float angle = v1.angle(v2); // angle is 90
    
        ofRotate(-angle);
    // Rotating entity 1
    ofPushMatrix();
    {   ofRotate((time/15)*360);
        ofTranslate(16, 0);
        ofCircle(0, 0, 3);
    }
        ofPopMatrix(); 
    //
    
    // Rotating entity 2
    ofPushMatrix();
    {
        ofRotate((time/12)*360);
        ofTranslate(19, 0);
        ofCircle(0, 0, 2);
    }
    ofPopMatrix();
    //
        ofCircle(0, 0, 12);
        ofCircle(0, 0+20, 10);
        ofPushMatrix();
        {    ofTranslate(0, 40);
            ofRotate(sin(time/5)*6);
            ofCircle(0, 0, 10);
            ofPushMatrix();
            {   ofTranslate(-10, 10);
                ofRotate(cos(time/5)*4);
                ofTriangle(0,0,10,10,20,0);
                ofPushMatrix();
                {   ofTranslate(0, 10);
                    ofRotate(sin(time/5)*10);
                    ofTriangle(0,0,10,10,20,0);
                    ofPushMatrix();
                    {   ofTranslate(0, 10);
                        ofRotate(cos(time/2)*4);
                        ofTriangle(0,0,10,10,20,0);
                        ofPushMatrix();
                        {   ofTranslate(0, 10);
                            ofRotate(sin(time/5)*2);
                            ofTriangle(0,0,10,40,20,0);
                        }
                        ofPopMatrix();
                    }
                    ofPopMatrix();
                }
                ofPopMatrix();
            }
            ofPopMatrix();
        }
        ofPopMatrix();
    ////////////////// LIMB 2 - Center limb
    ofPushMatrix();
    ofRotate(20);
    ofScale(-1, 1.5);
    ofCircle(0, 0+20, 10);
    ofPushMatrix();
    {    ofTranslate(0, 40);
        ofRotate(sin(time/5)*6);
        ofCircle(0, 0, 10);
        ofPushMatrix();
        {   ofTranslate(-10, 10);
            ofRotate(cos(time/5)*4);
            ofTriangle(0,0,10,10,20,0);
            ofPushMatrix();
            {   ofTranslate(0, 10);
                ofRotate(sin(time/5)*10);
                ofTriangle(0,0,10,10,20,0);
                ofPushMatrix();
                {   ofTranslate(0, 10);
                    ofRotate(cos(time/5)*4);
                    ofTriangle(0,0,10,10,20,0);
                    ofPushMatrix();
                    {   ofTranslate(0, 10);
                        ofRotate(sin(time/5)*9);
                        ofTriangle(0,0,10,40,20,0);
                    }
                    ofPopMatrix();
                }
                ofPopMatrix();
            }
            ofPopMatrix();
        }
        ofPopMatrix();
    }
    ofPopMatrix();
    ofPopMatrix();
    //////////////// END LIMB 2
    
    //////////////// LIMB 3
    ofPushMatrix();
    {
        
    ofRotate(40);
        ofScale(-1, 1.2);
    ofCircle(0, 0+20, 10);
    ofPushMatrix();
    {    ofTranslate(0, 40);
        ofRotate(sin(time/5)*6);
        ofCircle(0, 0, 10);
        ofPushMatrix();
        {   ofTranslate(-10, 10);
            ofRotate(cos(time/3)*7);
            ofTriangle(0,0,10,10,20,0);
            ofPushMatrix();
            {   ofTranslate(0, 10);
                ofRotate(sin(time/5)*10);
                ofTriangle(0,0,10,10,20,0);
                ofPushMatrix();
                {   ofTranslate(0, 10);
                    ofRotate(cos(time/9)*10);
                    ofTriangle(0,0,10,10,20,0);
                    ofPushMatrix();
                    {   ofTranslate(0, 10);
                        ofRotate(sin(time/5)*6);
                        ofTriangle(0,0,10,40,20,0);
                    }
                    ofPopMatrix();
                }
                ofPopMatrix();
            }
            ofPopMatrix();
        }
        ofPopMatrix();
    }
    ofPopMatrix();
    }
    ofPopMatrix();
    ////////////////// END LIMB3
    
    }
    ofPopMatrix();
    
    
    
    
    ofSetColor(255, 0, 0);
    ofFill();
    /*
    ofLine(mainX, mainY, currentX, currentY);
    ofLine(mainX, mainY, currentX, mainY);
    ofLine(currentX, mainY, currentX, currentY);
    ofLine(mainX, mainY, currentX, currentY);
    */
    ofSetColor(255,255,255);
    
    for (int i = 0 ; i < NUMBALLS ; i++)
    {
       // myBall[i].draw();
    }
    

    
    time = ofGetElapsedTimef()*10;
    //cout << tan(currentY-lastY/currentX-lastX);
    cout << "last :" ;
    cout << lastX; cout << "\t";  cout << lastY;
    cout << "\n";
    cout << "Current :" ;
    cout << currentX; cout << "\t"; cout << currentY;
    cout << "\n\n";
    
}

//--------------------------------------------------------------
void testApp::exit(){

}

//--------------------------------------------------------------
void testApp::touchDown(ofTouchEventArgs & touch){
    lastX = currentX;
    lastY = currentY;
   currentX = touch.x;
   currentY = touch.y;
   
}

//--------------------------------------------------------------
void testApp::touchMoved(ofTouchEventArgs & touch){
    x = touch.x-250;
    y = touch.y-250;
    lastX = currentX;
    lastY = currentY;
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

