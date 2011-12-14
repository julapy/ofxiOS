//
//  MenuViewController.m
//  emptyExample
//
//  Created by lukasz karluk on 12/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MyAppViewController.h"
#import "ofxiOSViewController.h"
#import "SquareApp.h"
#import "CircleApp.h"
#import "TriangleApp.h"
#import "ImageApp.h"

@implementation MyAppViewController

- (void)viewDidAppear:(BOOL)animated 
{
    [super viewDidAppear:animated];
}

- (void)loadView  
{
    [super loadView];
    
    self.view.backgroundColor = [UIColor clearColor];
    
    UIImageView* backgroundView;
    backgroundView = [[[UIImageView alloc ] initWithImage:[UIImage imageNamed:@"Default.png"]] autorelease];
    [ self.view addSubview: backgroundView ];
    
    CGRect screenRect = [[ UIScreen mainScreen ] bounds ];
    
    CGRect scrollViewFrame = CGRectMake(0.f,
                                        0.f,
                                        screenRect.size.width,
                                        screenRect.size.height);
    
    UIScrollView* containerView = [[[UIScrollView alloc] initWithFrame:scrollViewFrame] autorelease];
    containerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    containerView.showsHorizontalScrollIndicator = NO;
    containerView.showsVerticalScrollIndicator = YES;
    containerView.alwaysBounceVertical = YES;
    [self.view addSubview:containerView];

    NSArray *buttonTitles;
    buttonTitles = [ NSArray arrayWithObjects: @"square", @"circle", @"triangle", @"image", nil ];
    
    NSInteger buttonY = 0;
    NSInteger buttonGap = 2;
    NSInteger buttonHeight = ( screenRect.size.height - 44 ) / [ buttonTitles count ] - buttonGap * ( [ buttonTitles count ] - 1 );
    CGRect buttonRect = CGRectMake( 0, 0, screenRect.size.width, buttonHeight );
    
    for( int i=0; i<[ buttonTitles count ]; i++ )
    {
        UIButton *button;
        button = [ self makeButtonWithFrame : CGRectMake( 0, buttonY, buttonRect.size.width, buttonRect.size.height)
                                    andText : [ buttonTitles objectAtIndex: i ] ];
        [ containerView addSubview : button ];
        
        if( i == 0 )
            [ button addTarget:self action:@selector(button1Pressed:) forControlEvents:UIControlEventTouchUpInside];
        else if( i == 1 )
            [ button addTarget:self action:@selector(button2Pressed:) forControlEvents:UIControlEventTouchUpInside];
        else if( i == 2 )
            [ button addTarget:self action:@selector(button3Pressed:) forControlEvents:UIControlEventTouchUpInside];
        else if( i == 3 )
            [ button addTarget:self action:@selector(button4Pressed:) forControlEvents:UIControlEventTouchUpInside];
        
        buttonY += buttonRect.size.height;
        buttonY += buttonGap;
    }
    
    containerView.contentSize = CGSizeMake( buttonRect.size.width, buttonRect.size.height * 3 );
}

- (UIButton*) makeButtonWithFrame : (CGRect)frame 
                          andText : (NSString*)text
{
    UIFont *font;
    font = [ UIFont fontWithName:@"Georgia" size:30 ];
    
    UILabel *label;
    label = [[[ UILabel alloc ] initWithFrame: CGRectMake( 0, 0, frame.size.width, frame.size.height ) ] autorelease ];
    label.backgroundColor = [ UIColor colorWithWhite: 1 alpha: 0.95 ];
    label.textColor = [ UIColor colorWithWhite: 0 alpha: 1 ];
    label.text = [ text uppercaseString ];
    label.textAlignment = UITextAlignmentCenter;
    label.font = font;
    label.userInteractionEnabled = NO;
    label.exclusiveTouch = NO;
    
    UIButton* button = [[[ UIButton alloc ] initWithFrame: frame ] autorelease ];
    [ button setBackgroundColor: [ UIColor clearColor ] ];
    [ button addSubview: label ];
    
    return button;
    
}

- (void)button1Pressed:(id)sender
{
    [ self creatApp: new SquareApp() withFrame: [ [ UIScreen mainScreen ] bounds ] ];
    self.navigationController.navigationBar.topItem.title = @"SquareApp";
}

- (void)button2Pressed:(id)sender
{
    [ self creatApp: new CircleApp() withFrame: [ [ UIScreen mainScreen ] bounds ] ];
    self.navigationController.navigationBar.topItem.title = @"CircleApp";
}

- (void)button3Pressed:(id)sender
{
    [ self creatApp: new TriangleApp() withFrame: [ [ UIScreen mainScreen ] bounds ] ];
    self.navigationController.navigationBar.topItem.title = @"TriangleApp";
}

- (void)button4Pressed:(id)sender
{
    [ self creatApp: new ImageApp() withFrame: [ [ UIScreen mainScreen ] bounds ] ];
    self.navigationController.navigationBar.topItem.title = @"ImageApp";
}

- (void) creatApp : (ofBaseApp*)app withFrame : (CGRect)rect
{
    ofxiOSViewController *glViewController;
    glViewController = [[[ ofxiOSViewController alloc ] initWithFrame : rect
                                                                  app : app ] autorelease ];
    
    [ self.navigationController pushViewController : glViewController
                                          animated : YES ];
}

@end
