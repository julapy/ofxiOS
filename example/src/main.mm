#include "ofMain.h"
#include "ofxiOSWindow.h"

#include "SquareApp.h"
#include "CircleApp.h"
#include "TriangleApp.h"

int main()
{
    bool bUseiOS = true;
    
    if( bUseiOS )
    {
        /**
         *
         *  Below is how you start using ofxiOS.
         *
         *  First a ofxiOSWindow is created and added to ofSetupOpenGL()
         *  Notice that no app is being sent to ofRunApp() - this happens later when we actually need the app.
         *
         *  One last thing that needs to be done is telling ofxiOSWindow which AppDelegate to use.
         *  This is a custom AppDelegate and inside it you can start coding your iOS application.
         *  The AppDelegate must extend ofxiOSAppDelegate.
         *
         **/
        
        ofxiOSWindow *iosWindow = new ofxiOSWindow();
        iosWindow->enableDepthBuffer();                 // OPTIONAL - you will need to turn this on if drawing 3d.
        iosWindow->enableRetinaSupport();               // OPTIONAL - this turns on retina support for iPhone4 and upwards.
        
        ofSetupOpenGL( ofPtr<ofAppBaseWindow>( iosWindow ), 1024,768, OF_FULLSCREEN );
        iosWindow->startAppWithDelegate( "MyAppDelegate" );
    }
    else
    {
        /**
         *
         *  This is the normal way of running an app using ofxiPhone.
         *  This code has been left in this example to show that ofxiPhone still works
         *  and that there hasn't been any changes to OF core or ofxiPhone.
         *
         **/
        
        ofSetupOpenGL( 1024,768, OF_FULLSCREEN );
        ofRunApp( new SquareApp() );
    }
}
