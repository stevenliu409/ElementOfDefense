//
//  snipersoldier.m
//  Element Of Defense
//
//  Created by Steven Liu on 2013-05-02.
//
//

#import "snipersoldier.h"

@implementation snipersoldier

+(id) makeSniper:(HelloWorldLayer*)_gameLayer waypoint:(NSMutableArray*)mywaypoints{
    return [[self alloc] initSniper:_gameLayer waypoint:mywaypoints];
}

-(id) initSniper:(HelloWorldLayer*)_gameLayer waypoint:(NSMutableArray*)mywaypoints{
    if(self = [super initWithSpriteFrameName:@"an1_anim1.png"] ){
        health = 6;
        damage = 7;
        range = 10;
        freq = 2;
        speed = 3;
        gameLayer = _gameLayer;
        waypoints = mywaypoints;
        walkAni = [self loadAnimation:@"robotWalkingAnim" fileName:@"EnemyRobot"];
        if(walkAni == nil){
            NSLog(@"wrong!");
        }else {
            NSLog(@"Sniper load animation");
           [self runAction:[CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:walkAni]]];
        }
        self.flipX = YES;
        Waypoint *waypoint = (Waypoint*)[waypoints objectAtIndex:([waypoints count]-1)];
        spawnpoint = waypoint.nextWaypoint;
        self.position = waypoint.myPosition;

        [gameLayer addChild:self z:3];
        [self scheduleUpdate];
    }
    return self;
}

-(void) changeState:(int)state{
    [self stopAllActions];
    CCAnimate* ani = nil;
    switch (state) {
        case 1:
            [self setDisplayFrame:[[CCSpriteFrameCache
                                    sharedSpriteFrameCache]
                                   spriteFrameByName:@"an1_anim1.png"]];
            break;
        case 2:
            ani = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:walkAni]];
            break;
        case 3:
            
            break;
        default:
            break;
    }
    
    if(ani != nil){
        [self runAction:ani];
    }
    
    
}

@end
