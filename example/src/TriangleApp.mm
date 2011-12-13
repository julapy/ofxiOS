#include "TriangleApp.h"

TriangleApp :: TriangleApp ()
{
    cout << "creating TriangleApp" << endl;
}

TriangleApp :: ~TriangleApp ()
{
    cout << "destroying TriangleApp" << endl;
}

//--------------------------------------------------------------
void TriangleApp::setup()
{	
	ofRegisterTouchEvents( this );
	ofxAccelerometer.setup();
	ofxiPhoneAlerts.addListener( this );
	ofBackground( 127 );
    
    font.loadFont( "fonts/mono0755.ttf", 8 );
}

//--------------------------------------------------------------
void TriangleApp::update(){

}

//--------------------------------------------------------------
void TriangleApp::draw()
{
    int a = 100;
    int b = sqrt( a * a + a * a );
    int x = ofGetWidth()  * 0.5;
    int y = ofGetHeight() * 0.5 - 50;
    
	ofSetColor( ofColor :: red );
    ofTriangle( x, y - a, x + b, y + b, x - b, y + b );
    
    x = 10;
    y = 0;
    
    ofSetColor( ofColor :: white );
    font.drawString( "frame num      = " + ofToString( ofGetFrameNum() ),    x, y+=20 );
    font.drawString( "frame rate     = " + ofToString( ofGetFrameRate() ),   x, y+=20 );
    font.drawString( "screen width   = " + ofToString( ofGetWidth() ),       x, y+=20 );
    font.drawString( "screen height  = " + ofToString( ofGetHeight() ),      x, y+=20 );
}

//--------------------------------------------------------------
void TriangleApp::exit()
{
    ofUnregisterTouchEvents( this );
    ofxiPhoneAlerts.removeListener( this );
}

//--------------------------------------------------------------
void TriangleApp::touchDown(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void TriangleApp::touchMoved(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void TriangleApp::touchUp(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void TriangleApp::touchDoubleTap(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void TriangleApp::lostFocus(){

}

//--------------------------------------------------------------
void TriangleApp::gotFocus(){

}

//--------------------------------------------------------------
void TriangleApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void TriangleApp::deviceOrientationChanged(int newOrientation){

}


//--------------------------------------------------------------
void TriangleApp::touchCancelled(ofTouchEventArgs& args){

}

