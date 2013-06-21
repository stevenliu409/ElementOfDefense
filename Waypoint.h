//
//  Waypoint.h
//  ZombieDefense
//
//  Created by Steven Liu on 2013-06-20.
//
//

#import "cocos2d.h"
#import "CCLayer.h"

@interface Waypoint: CCNode {
    CCLayer *theGame;
}

@property (nonatomic,readwrite) CGPoint myPosition;
@property (nonatomic,assign) Waypoint *nextWaypoint;
@property (nonatomic,assign) CCSprite *mySprite;

+(id)nodeWithTheGame:(CCLayer*)_game location:(CGPoint)location;
-(id)initWithTheGame:(CCLayer *)_game location:(CGPoint)location;

@end