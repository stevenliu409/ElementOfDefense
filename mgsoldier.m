//
//  mgsoldier.m
//  Element Of Defense
//
//  Created by Steven Liu on 2013-05-02.
//
//

#import "mgsoldier.h"


@implementation mgsoldier
@synthesize mySprite,gameLayer;

+(id) makeMg:(HelloWorldLayer*)_gamelayer{
    return [[self alloc] initMg:_gamelayer];
}

-(id) initMg:(HelloWorldLayer*)_gamelayer{
    if(self = [super init]){
        health = 10;
        damage = 2;
        range = 2;
        freq = 0.5;
        speed =2;
        gameLayer = _gamelayer;
        mySprite = [CCSprite spriteWithFile:@"soldier1.png"];
        mySprite.scaleX = 75/mySprite.contentSize.width;
        mySprite.scaleY = 75/mySprite.contentSize.height;
		[self addChild:mySprite];
        
        Waypoint *waypoint = (Waypoint*)[gameLayer.waypoints objectAtIndex:([gameLayer.waypoints count]-1)];
        spawnpoint = waypoint.nextWaypoint;
        CGPoint pos = waypoint.myPosition;
        myPosition = pos;
        [mySprite setPosition:pos];
        [gameLayer addChild:self z:3];
        [self scheduleUpdate];
    }
    
    return self;
}

-(void)update:(ccTime)dt{
    //if there is a next point then move there
    if(spawnpoint.nextWaypoint){
        spawnpoint = spawnpoint.nextWaypoint;
    
    }
    else{
       //stay at that point
        spawnpoint.nextWaypoint = spawnpoint;
    
    }

    CGPoint targetPoint = spawnpoint.myPosition;
    float movingspeed = speed;

    CGPoint normalized = ccpNormalize(ccp(targetPoint.x-myPosition.x, targetPoint.y-myPosition.y));

    myPosition =ccp(myPosition.x+normalized.x *movingspeed, myPosition.y+normalized.y *movingspeed);
    [mySprite setPosition:myPosition];
}



@end
