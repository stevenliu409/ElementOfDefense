//
//  IntroLayer.h
//  Element Of Defense
//
//  Created by Steven Liu on 2013-04-21.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface IntroLayer : CCLayer
{
    NSUserDefaults* prefs;
    
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
