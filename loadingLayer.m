//
//  loadingLayer.m
//  Element Of Defense
//
//  Created by Hua Dong on 13-05-03.
//
//

#import "loadingLayer.h"
#import "cocos2d.h"
#import "HelloWorldLayer.h"
@implementation loadingLayer
+(id) loadSence:(NSString *)dir from:(int)f to:(int)t{
    return [[[self alloc] initWithSence:dir from:f to:t]autorelease];
}

-(id)initWithSence:(NSString *)dir from:(int)f to:(int)t{
    if((self = [super init])){
        CCSprite* bg = [CCSprite spriteWithFile:dir];
        bg.scaleX = 480/bg.contentSize.width;
        bg.scaleY = 320/bg.contentSize.height;
        bg.anchorPoint = ccp(0,0);
        [self addChild:bg z:1];
        CCLabelTTF* label = [CCLabelTTF labelWithString:@"Loading....." fontName:@"Marker Felt" fontSize:25];
        CGSize size = [[CCDirector sharedDirector]winSize];
        label.position = ccp(size.width - 50, 50);
        [self addChild:label z:2];
        targetSence = t;
        fromSence = f;
        
        [self scheduleUpdate];
    }
    return self;

}

-(void) update:(ccTime*) delta{
    [self unscheduleAllSelectors];
    CCTransitionFlipX* transition;
    switch (targetSence) {
        case 1:
            transition = [CCTransitionFade transitionWithDuration:2 scene:[HelloWorldLayer scene] withColor:ccWHITE];
            break;
        default:
            break;
    }
    [[CCDirector sharedDirector] replaceScene:transition];

}

@end
