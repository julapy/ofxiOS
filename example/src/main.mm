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
        ofxiOSWindow *iosWindow = new ofxiOSWindow();
        ofSetupOpenGL( ofPtr<ofAppBaseWindow>( iosWindow ), 1024,768, OF_FULLSCREEN );
        iosWindow->startAppWithDelegate( "MyAppDelegate" );
    }
    else
    {
        ofSetupOpenGL( 1024,768, OF_FULLSCREEN );
        ofRunApp( new SquareApp() );
    }
}
