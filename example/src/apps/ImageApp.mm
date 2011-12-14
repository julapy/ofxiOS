#include "ImageApp.h"

ImageApp :: ImageApp ()
{
    cout << "creating ImageApp" << endl;
}

ImageApp :: ~ImageApp ()
{
    cout << "destroying ImageApp" << endl;
}

//--------------------------------------------------------------
void ImageApp::setup()
{	
	ofRegisterTouchEvents( this );
	ofxAccelerometer.setup();
	ofxiPhoneAlerts.addListener( this );
	ofBackground( 127 );
    
    font.loadFont( "fonts/mono0755.ttf", 8 );
    
    image.loadImage( "images/dive.jpg" );
}

//--------------------------------------------------------------
void ImageApp::update(){

}

//--------------------------------------------------------------
void ImageApp::draw()
{
    int x = ( ofGetWidth()  - image.width  ) * 0.5;
    int y = ( ofGetHeight() - image.height ) * 0.5;
    
	ofSetColor( ofColor :: white );
    image.draw( x, y );
    
    x = 10;
    y = 0;
    
    ofSetColor( ofColor :: white );
    font.drawString( "frame num      = " + ofToString( ofGetFrameNum() ),    x, y+=20 );
    font.drawString( "frame rate     = " + ofToString( ofGetFrameRate() ),   x, y+=20 );
    font.drawString( "screen width   = " + ofToString( ofGetWidth() ),       x, y+=20 );
    font.drawString( "screen height  = " + ofToString( ofGetHeight() ),      x, y+=20 );
}

//--------------------------------------------------------------
void ImageApp::exit()
{
    ofUnregisterTouchEvents( this );
    ofxiPhoneAlerts.removeListener( this );
}

//--------------------------------------------------------------
void ImageApp::touchDown(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void ImageApp::touchMoved(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void ImageApp::touchUp(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void ImageApp::touchDoubleTap(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void ImageApp::lostFocus(){

}

//--------------------------------------------------------------
void ImageApp::gotFocus(){

}

//--------------------------------------------------------------
void ImageApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void ImageApp::deviceOrientationChanged(int newOrientation){

}


//--------------------------------------------------------------
void ImageApp::touchCancelled(ofTouchEventArgs& args){

}

