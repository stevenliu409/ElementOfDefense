//
//  Waypoint.m
//  ZombieDefense
//
//  Created by Steven Liu on 2013-06-20.
//
//

#import "Waypoint.h"

@implementation Waypoint

@synthesize myPosition, nextWaypoint;

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
        [theGame addChild:self z:3];
        
	}
    
	return self;
}


//used for debugging
-(void)draw
{
    ccDrawColor4B(0, 255, 2, 255);
    ccDrawCircle(myPosition, 6, 360, 30, false);
    ccDrawCircle(myPosition, 2, 360, 30, false);
    
    if(nextWaypoint)
        ccDrawLine(myPosition, nextWaypoint.myPosition);
    
    [super draw];
}

@end