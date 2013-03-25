#include "ofMain.h"
#include "testApp.h"
#include "ofAppGlutWindow.h"
#include "ofBall.h"

int main(){
    //ofAppGlutWindow window;
    //window.setGlutDisplayString("rgba double samples>=4");
	ofSetupOpenGL(1024,768, OF_FULLSCREEN);			// <-------- setup the GL context
    
	ofRunApp(new testApp);
}
