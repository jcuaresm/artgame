#include "mEntity.h"
#include "testApp.h"


mEntity::mEntity()
{
    numEat = 0;
    
    // 0 = circle, 1 = triangle, 2 = square
    

    /*for (int i = 0; i <= sizeof(shapesEat); i+=3)
    {
        shapesEat[i] = 0;
    }
    
    for (int i = 1; i <= sizeof(shapesEat); i+=3)
    {
        shapesEat[i] = 1;
    }
    
    for (int i = 2; i <= sizeof(shapesEat); i+=3)
    {
        shapesEat[i] = 2;
    }*/
    
    /*for (int i = 0; i <= 5; i++)
    {
        shapesEat[i] = 0;
    }
    for (int i = 6; i <= 12; i++)
    {
        shapesEat[i] = 1;
    }*/
    
    shapesEat[0] = 0;
    shapesEat[1] = 1;
    shapesEat[2] = 2;
    shapesEat[3] = 1;
    shapesEat[4] = 1;
    shapesEat[5] = 0;
    shapesEat[6] = 1;
    shapesEat[7] = 1;
    shapesEat[8] = 0;
    shapesEat[9] = 0;
    shapesEat[10] = 1;
    shapesEat[11] = 1;
    shapesEat[12] = 1;
    shapesEat[13] = 2;
    shapesEat[14] = 2;
    
    
}

void mEntity::update(){

}

void mEntity::draw(double time, double currentX, double currentY, double mainX, double mainY){
    
    ofVec2f v1(currentX-mainX, mainY);
    ofVec2f v2(currentX-mainX, mainY-currentY);

    v1.normalize();
    v2.normalize();
    float angle = v1.angle(v2); // angle is 90
    
    
    /////// ENTITY Start
    ofPushMatrix();
    {
        ofTranslate(mainX, mainY);
        ofRotate(-angle);

        ofSetColor(((0.5*sin(time/5)+0.5)*50), ((0.5*sin(time/5)+0.5)*100), ((0.5*sin(time/5)+0.5)*255));
        ofFill();
    
        
        
    // Rotating entity 1
    ofPushMatrix();
    {   ofRotate((time/15)*360);
        ofTranslate(16, 0);
        ofCircle(0, 0, 3);
    }
        ofPopMatrix(); 


        

    ofCircle(0, 0, 12); // HEAD
    ofSetColor(255, 255, 255);
    ofTriangle(-10, 0, 0, -10, 10, 0);
    
    ofSetColor(((0.5*sin(time/5)+0.5)*50), ((0.5*sin(time/5)+0.5)*100), ((0.5*sin(time/5)+0.5)*255));
    
    
    //void recursiveDraw(int depth, int MAX, int counter, int AMP);
        ofPushMatrix();
            recursiveDraw(6, 6, 0, 15);
        ofPopMatrix();
        ofPushMatrix();
            ofRotate(45);
            recursiveDraw(numEat, 6, 0, 15);
        ofPopMatrix();
        
    if (numEat > 6) {
        ofPushMatrix();
            ofRotate(90);
            recursiveDraw(numEat-6, 12, 6, 15);
        ofPopMatrix();
        ofPushMatrix();
            ofRotate(135);
            recursiveDraw(numEat-6, 12, 6, 15);
        ofPopMatrix();
        
    }
    /*
    
    if (numEat > 12) {
        ofPushMatrix();
            ofRotate(180);
            recursiveDraw(numEat-12, 6, 0, 15, numEat);
        ofPopMatrix();
        ofPushMatrix();
            ofRotate(225);
            recursiveDraw(numEat-12, 6, 0, 15, numEat);
        ofPopMatrix();
    }
    
    if (numEat > 18) {
        ofPushMatrix();
            ofRotate(270);
            recursiveDraw(numEat-18, 6, 0, 15, numEat);
        ofPopMatrix();
        ofPushMatrix();
            ofRotate(315);
            recursiveDraw(numEat-18, 6, 0, 15, numEat);
        ofPopMatrix();
    }*/
    
    /*
    if (numEat >= 1) {
        ofCircle(0, 0+20, 10);
        ofPushMatrix(); if (numEat >= 2) {
            ofTranslate(0, 40);
            ofRotate(sin(time/5)*6);
            ofCircle(0, 0, 10);
            ofPushMatrix(); if (numEat >= 3) {
                ofTranslate(-10, 10);
                ofRotate(cos(time/5)*4);
                ofTriangle(0,0,10,10,20,0);
                ofPushMatrix(); if (numEat >= 4) {
                    ofTranslate(0, 10);
                    ofRotate(sin(time/5)*10);
                    ofTriangle(0,0,10,10,20,0);
                    ofPushMatrix(); if (numEat >= 5) {
                        ofTranslate(0, 10);
                        ofRotate(cos(time/2)*4);
                        ofTriangle(0,0,10,10,20,0);
                        ofPushMatrix(); if (numEat >= 6) {
                            ofTranslate(0, 10);
                            ofRotate(sin(time/5)*2);
                            ofTriangle(0,0,10,40,20,0);
                        } ofPopMatrix();
                    } ofPopMatrix();
                } ofPopMatrix();
            } ofPopMatrix();
        } ofPopMatrix();
    }*/
        
    ////////////////// LIMB 2 - Center limb
    /*ofPushMatrix();
    ofRotate(20);
    ofScale(-1, 1.5);
    ofCircle(0, 0+20, 10);
    ofPushMatrix();
        ofTranslate(0, 40);
        ofRotate(sin(time/5)*6);
        ofCircle(0, 0, 10);
        ofPushMatrix();
           ofTranslate(-10, 10);
            ofRotate(cos(time/5)*4);
            ofTriangle(0,0,10,10,20,0);
            ofPushMatrix();
                ofTranslate(0, 10);
                ofRotate(sin(time/5)*10);
                ofTriangle(0,0,10,10,20,0);
                ofPushMatrix();
                    ofTranslate(0, 10);
                    ofRotate(cos(time/5)*4);
                    ofTriangle(0,0,10,10,20,0);
                    ofPushMatrix();
                        ofTranslate(0, 10);
                        ofRotate(sin(time/5)*9);
                        ofTriangle(0,0,10,40,20,0);
                    
                    ofPopMatrix();
                ofPopMatrix();
            ofPopMatrix();
        ofPopMatrix();
    ofPopMatrix();
    ofPopMatrix();*/
    //////////////// END LIMB 2
    
    //////////////// LIMB 3
    /*ofPushMatrix();
    {
        
    ofRotate(40);
        ofScale(-1, 1.2);
    ofCircle(0, 0+20, 10);
    ofPushMatrix();
    {    
        ofTranslate(0, 40);
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
    ofPopMatrix();*/
    ////////////////// END LIMB3
    
    }
    ofPopMatrix();

    ofSetColor(255,255,255);
} 

void mEntity::recursiveDraw(int depth, int MAX, int counter, int AMP)
{       if (counter >= MAX)
        {
            return;
        }
        if (depth == 0) {
            return;
        }
        else {
            ofTranslate(0, 20);
            if (shapesEat[counter] == 1)
                ofTriangle(-10, -10, 0, 10, 10, -10);
            else if (shapesEat[counter] == 0)
                ofCircle(0, 0, 10);
            else if (shapesEat[counter] == 2)
                ofRect(-10, -10, 20, 20);
            ofPushMatrix();
                if (depth <= MAX/2)
                    ofRotate(sin((ofGetElapsedTimef()*10)/3)*AMP);
                else
                    ofRotate(cos((ofGetElapsedTimef()*10)/3)*AMP);
                depth -= 1;
                counter += 1;
                recursiveDraw(depth, MAX, counter, AMP);
            ofPopMatrix();
        }
}