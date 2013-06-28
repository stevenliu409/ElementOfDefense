//
//  mgsoldier.m
//  Element Of Defense
//
//  Created by Steven Liu on 2013-05-02.
//
//

#import "mgsoldier.h"
#import "Waypoint.h"

@implementation mgsoldier
@synthesize mySprite,gameLayer;

+(id) makeMg:(HelloWorldLayer*)_gamelayer waypoint:(NSMutableArray*)mywaypoints{
    return [[self alloc] initMg:_gamelayer waypoint:mywaypoints];
}

-(id) initMg:(HelloWorldLayer*)_gamelayer waypoint:(NSMutableArray*)mywaypoints{
    if(self = [super init]){
        health = 10;
        damage = 2;
        range = 100;
        freq = 0.5;
        speed =1;
        gameLayer = _gamelayer;
        mySprite = [CCSprite spriteWithFile:@"soldier1.png"];
        mySprite.scaleX = 75/mySprite.contentSize.width;
        mySprite.scaleY = 75/mySprite.contentSize.height;
		[self addChild:mySprite];
        
        Waypoint *waypoint = (Waypoint*)[mywaypoints objectAtIndex:([mywaypoints count]-1)];
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
    
    if(destination_reached){
        return;
    }
    
    if([gameLayer circle:myPosition withRadius:1 collisionWithCirle:spawnpoint.myPosition collisionCircleRadius:1]){
        //if there is a next point then move there
        if(spawnpoint.nextWaypoint){
            spawnpoint = spawnpoint.nextWaypoint;
    
        }
        else{
            destination_reached = true;
        }
    }
    CGPoint targetPoint = spawnpoint.myPosition;
    float movingspeed = speed;

    CGPoint normalized = ccpNormalize(ccp(targetPoint.x-myPosition.x, targetPoint.y-myPosition.y));
    
    myPosition =ccp(myPosition.x+normalized.x *movingspeed, myPosition.y+normalized.y *movingspeed);
    [mySprite setPosition:myPosition];
}


//the attack range 
-(void)draw{

    ccDrawColor4B(255, 0, 0, 0);
    ccDrawCircle(mySprite.position, range, 360, 30, false);
    [super draw];
}

@end
