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
            NSLog(@"load animation");
           [self runAction:[CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:walkAni]]];
        }
        [gameLayer addChild:self z:3];
        [self scheduleUpdate];
    }
    return self;
}




@end
