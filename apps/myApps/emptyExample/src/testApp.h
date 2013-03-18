#pragma once

#include "ofMain.h"
#include "ofxiPhone.h"
#include "ofxiPhoneExtras.h"
#include "ofBall.h"


#define NUMBALLS 50

class testApp : public ofxiPhoneApp{
	
    public:
        void setup();
        void update();
        void draw();
        void exit();
	
        void touchDown(ofTouchEventArgs & touch);
        void touchMoved(ofTouchEventArgs & touch);
        void touchUp(ofTouchEventArgs & touch);
        void touchDoubleTap(ofTouchEventArgs & touch);
        void touchCancelled(ofTouchEventArgs & touch);

        void lostFocus();
        void gotFocus();
        void gotMemoryWarning();
        void deviceOrientationChanged(int newOrientation);
        ofImage my_img;
        ofImage my_img2;

        int x;
        int y;
        
        double time;
        
        int currentX;
        int currentY;
        
        int lastX;
        int lastY;
        
        int originX;
        int originY;
        
        float mainX;
        float mainY;
    
        ofBall myBall[NUMBALLS];

   // ofBall myBall;
    ofSoundPlayer mySound;
    
        int countSize;
        
        int contactWith;
        bool inContact;
    
        
};


