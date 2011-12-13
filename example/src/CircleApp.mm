#include "CircleApp.h"

CircleApp :: CircleApp ()
{
    cout << "creating CircleApp" << endl;
}

CircleApp :: ~CircleApp ()
{
    cout << "destroying CircleApp" << endl;
}

//--------------------------------------------------------------
void CircleApp::setup()
{
	ofRegisterTouchEvents( this );
	ofxAccelerometer.setup();
	ofxiPhoneAlerts.addListener( this );
	ofBackground( 127 );
    
    font.loadFont( "fonts/mono0755.ttf", 8 );
}

//--------------------------------------------------------------
void CircleApp::update(){

}

//--------------------------------------------------------------
void CircleApp::draw()
{
    int x = ofGetWidth()  * 0.5;
    int y = ofGetHeight() * 0.5;
    
	ofSetColor( ofColor :: red );
    ofCircle( x, y, 100 );
    
    x = 10;
    y = 0;
    
    ofSetColor( ofColor :: white );
    font.drawString( "frame num      = " + ofToString( ofGetFrameNum() ),    x, y+=20 );
    font.drawString( "frame rate     = " + ofToString( ofGetFrameRate() ),   x, y+=20 );
    font.drawString( "screen width   = " + ofToString( ofGetWidth() ),       x, y+=20 );
    font.drawString( "screen height  = " + ofToString( ofGetHeight() ),      x, y+=20 );
}

//--------------------------------------------------------------
void CircleApp::exit()
{
    ofUnregisterTouchEvents( this );
    ofxiPhoneAlerts.removeListener( this );
}

//--------------------------------------------------------------
void CircleApp::touchDown(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void CircleApp::touchMoved(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void CircleApp::touchUp(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void CircleApp::touchDoubleTap(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void CircleApp::lostFocus(){

}

//--------------------------------------------------------------
void CircleApp::gotFocus(){

}

//--------------------------------------------------------------
void CircleApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void CircleApp::deviceOrientationChanged(int newOrientation){

}


//--------------------------------------------------------------
void CircleApp::touchCancelled(ofTouchEventArgs& args){

}

