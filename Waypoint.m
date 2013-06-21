//
//  Waypoint.m
//  ZombieDefense
//
//  Created by Steven Liu on 2013-06-20.
//
//

#import "Waypoint.h"

@implementation Waypoint

@synthesize myPosition, nextWaypoint, mySprite;

+(id)nodeWithTheGame:(CCLayer*)_game location:(CGPoint)location
{
    return [[self alloc] initWithTheGame:_game location:location];
}

-(id)initWithTheGame:(CCLayer*)_game location:(CGPoint)location
{
	if( (self=[super init])) {
        
		theGame = _game;
        
        [self setPosition:CGPointZero];
        myPosition = location;
        mySprite = [CCSprite spriteWithFile:@"circle.png"];
        mySprite.position = location;
        [theGame addChild:mySprite z:3];
        [theGame addChild:self];
        
	}
    
	return self;
}

@end