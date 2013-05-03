//
//  openningLayer.h
//  Element Of Defense
//
//  Created by Hua Dong on 13-05-03.
//
//

#import "CCLayer.h"
#import "cocos2d.h"
@interface openningLayer : CCLayer{
    CGSize size;
    NSUserDefaults* prefs;
}

+(CCScene *) scene;

-(void) goLevel1:(id) sender;
@end
