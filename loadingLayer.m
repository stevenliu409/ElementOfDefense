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
#import "openningLayer.h"
#import "shopLayer.h"
#import "logingLayer.h"
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
    prefs = [NSUserDefaults standardUserDefaults];
    NSData* l;
    CCTransitionFlipX* transition;
    switch (targetSence) {
        case 1:
            [self display];
            l = [prefs objectForKey:@"level1"];
            [prefs setValue:l forKey:@"currentLevel"];
            [prefs synchronize];
            transition = [CCTransitionFade transitionWithDuration:2 scene:[HelloWorldLayer scene] withColor:ccWHITE];
            break;
        case 997:
            [self updateItemList];
            transition = [CCTransitionFade transitionWithDuration:2 scene:[shopLayer scene] withColor:ccWHITE];
            break;
        case 998:
            transition = [CCTransitionFade transitionWithDuration:2 scene:[openningLayer scene] withColor:ccWHITE];
            break;
        case 999:
            [self display];
            transition = [CCTransitionFade transitionWithDuration:2 scene:[logingLayer scene] withColor:ccWHITE];
            break;
        default:
            break;
    }
    [[CCDirector sharedDirector] replaceScene:transition];

}

-(void) display{
    NSLog(@"display");
    NSDictionary* us = [prefs objectForKey:@"users"];
    NSArray* array = [us allKeys];
    for (int n = 0; n<[array count];n++){
        NSLog(@"%@",[array objectAtIndex:n]);
    }
}


-(void) updateItemList{
    NSMutableArray* itemArray;
    NSArray* itemArray1 = [prefs objectForKey:@"itemArray"];
    if(itemArray1 == NULL){
        itemArray = [[NSMutableArray alloc] init];
    }else{
        itemArray = [[NSMutableArray alloc] init];
    }
    NSMutableDictionary* d = [[NSMutableDictionary alloc] init];
    [d setObject:@"Leo" forKey:@"itemName"];
    [d setObject:@"increase monseter hp by 10" forKey:@"desc"];
    [d setObject:[NSNumber numberWithInt:10] forKey:@"price"];
    [d setObject:[NSNumber numberWithInt:1] forKey:@"type"];
    [itemArray addObject:d];
    [prefs setObject:itemArray forKey:@"itemArray"];
    [prefs synchronize];
}

@end
