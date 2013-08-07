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
@synthesize mySprite;


+(id) makeMg:(HelloWorldLayer*)_gamelayer waypoint:(NSMutableArray*)mywaypoints{
    return [[self alloc] initMg:_gamelayer waypoint:mywaypoints];
}

-(id) initMg:(HelloWorldLayer*)_gamelayer waypoint:(NSMutableArray*)mywaypoints{
    if(self = [super initWithSpriteFrameName:@"sv_mallet_1.png"]){
        waypoints = mywaypoints;
        health = 10;
        damage = 2;
        range = 100;
        freq = 0.5;
        speed =1;
        active = NO;
        gameLayer = _gamelayer;
        [self changeState:2];
        Waypoint *waypoint = (Waypoint*)[waypoints objectAtIndex:([waypoints count]-1)];
        spawnpoint = waypoint.nextWaypoint;
        self.position = waypoint.myPosition;
        [gameLayer addChild:self z:3];
        [self scheduleUpdate];
        
    }
    
    return self;
}

/*
+(id) makeMg:(HelloWorldLayer*)_gamelayer{
    return [[self alloc] initMg:_gamelayer];
}

-(id) initMg:(HelloWorldLayer*)_gamelayer {
    if(self = [super initWithSpriteFrameName:@"sv_mallet_1.png"]){
        health = 10;
        damage = 2;
        range = 100;
        freq = 0.5;
        speed =1;
        active = NO;
        gameLayer = _gamelayer;
        walkAni = [self loadAnimation:@"walkingAnim" fileName:@"Viking"];
        shotAni = [self loadAnimation:@"malletPunchAnim" fileName:@"Viking"];
        //[self runAction:[CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation: shotAni]]];
        //[self changeState:3];
        
        [self changeState:1];
        sChange = NO;
        [gameLayer addChild:self z:3];
        [self scheduleUpdate];
        
    }
    
    return self;
}
*/
/*  DO NOT DELETE
 DEBUGGER: the attack range
-(void)draw{

    ccDrawColor4B(255, 0, 0, 0);
    ccDrawCircle(mySprite.position, range, 360, 30, false);
    [super draw];
}
*/


@end
