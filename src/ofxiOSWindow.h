//
//  MyAppWindow.h
//  emptyExample
//
//  Created by lukasz karluk on 12/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#pragma once

#import "ofAppiPhoneWindow.h"

class ofxiOSWindow : public ofAppiPhoneWindow
{
public:
    
    void startAppWithDelegate   ( string appDelegateClassName = "ofxiPhoneAppDelegate" );
    void runAppViaInfiniteLoop  ( ofBaseApp * appPtr );
    void timerLoop              ();
};