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
        self.flipX = YES;
        Waypoint *waypoint = (Waypoint*)[waypoints objectAtIndex:([waypoints count]-1)];
        spawnpoint = waypoint.nextWaypoint;
        self.position = waypoint.myPosition;
        [self changeState:2];
        [gameLayer addChild:self z:3];
        [self scheduleUpdate];
        //[self schedule: @selector(updateSolder:) interval:1.0];
    }
    return self;
}

/*
+(id) makeSniper:(CCLayer*)_gameLayer {
    return [[self alloc] initSniper:_gameLayer];
}

-(id) initSniper:(CCLayer*)_gameLayer {
    if(self = [super initWithSpriteFrameName:@"an1_anim1.png"] ){
        health = 6;
        damage = 7;
        range = 10;
        freq = 2;
        speed = 3;
        gameLayer = _gameLayer;
        walkAni = [self loadAnimation:@"robotWalkingAnim" fileName:@"EnemyRobot"];
        shotAni = [self loadAnimation:@"shootPhaserAnim" fileName:@"EnemyRobot"];
        
        if(walkAni == nil){
            NSLog(@"wrong!");
        }else {
            NSLog(@"Sniper load animation");
            [self runAction:[CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:walkAni]]];
        }
        //[self changeState:2];
        self.flipX = YES;
        [gameLayer addChild:self z:3];
        sChange = NO;
        [self changeState:2];
        //[self scheduleUpdate];
        //[self schedule: @selector(updateSolder:) interval:3.0];
    }
    return self;
}

*/
-(void) changeState:(int)state{
    [self stopAllActions];
    if(state == 1){
        [self setDisplayFrame:[[CCSpriteFrameCache
                                sharedSpriteFrameCache]
                               spriteFrameByName:@"an1_anim1.png"]];
    }else if(state == 2){
        walkAni = [self loadAnimation:@"robotWalkingAnim" fileName:@"EnemyRobot"];

        CCAnimate* ani = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:walkAni]];
        [self runAction:ani];
    }else if(state == 3){
        shotAni = [self loadAnimation:@"shootPhaserAnim" fileName:@"EnemyRobot"];
        
        CCAnimate* ani = [CCAnimate actionWithAnimation:shotAni];
        [self runAction:ani];
    }
    /*
    if(ani != nil){
        [self runAction:ani];
    }*/
    
    
    
}

-(void)update:(ccTime)dt{

    if(destination_reached){
        [self changeState:3];
        return;
    }
    if([gameLayer circle:self.position withRadius:1 collisionWithCirle:spawnpoint.myPosition collisionCircleRadius:1]){
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
     
     CGPoint normalized = ccpNormalize(ccp(targetPoint.x-self.position.x, targetPoint.y-self.position.y));
     
     self.position =ccp(self.position.x+normalized.x *movingspeed, self.position.y+normalized.y *movingspeed);
    /*
    if(sChange == NO){
        [self changeState:1];
        NSLog(@"Changed");
        sChange = YES;
        //return;
    }*/
}

@end
