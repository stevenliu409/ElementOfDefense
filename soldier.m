//
//  soldier.m
//  Element Of Defense
//
//  Created by Hua Dong on 2013-05-02.
//
//

#import "soldier.h"
#import "BulletCache.h"
#import "HelloWorldLayer.h"


@implementation soldier
@synthesize speed,range,damage,freq;
//@synthesize walkAni, shotAni, standAni;

+(id) makeSoldier{
    return [[self alloc] initSoldier];
}


-(id) initSoldier{
    
    if(self = [super init]){
        //fileName = [[NSBundle mainBundle] pathForResource:@"solders" ofType:@"plist"];
    }
    
    //NSLog(@"file name is%@",fileName);
    return self;
}


-(id) init{
    if(self = [super init]){
        dead = NO;
        
    }
    return self;
}



-(void) fire:(ccTime)ct {
    HelloWorldLayer* level = [HelloWorldLayer getLevel];
    BulletCache* cache = [level cache];
    [cache shootBulletFrom:self timer:ct];
}


-(void) changeState:(int)state{
    sstate = state;
    [self stopAllActions];
    if(state == 1){
        [self setDisplayFrame:[[CCSpriteFrameCache
                                sharedSpriteFrameCache]
                               spriteFrameByName:@"sv_anim_1.png"]];
    }else if(state == 2){
        walkAni = [self loadAnimation:@"walkingAnim" fileName:@"Viking"];
        
        ani1 = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:walkAni]];
    }else if(state == 3){
        shotAni = [self loadAnimation:@"malletPunchAnim" fileName:@"Viking"];
        
        ani1 = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:shotAni]];
    }else if(state == 4){
        deadAni = [self loadAnimation:@"vikingDeathAnim" fileName:@"Viking"];
        ani1 = [CCAnimate actionWithAnimation:deadAni];
    }
    
    if(ani1 != nil){
        [self runAction:ani1];
    }

    
}



-(void)update:(ccTime)dt{
    if(health <= 0){
        [self changeState:4];
        [self unscheduleUpdate];
        return;
    }
    
    if(sstate == 5){
            if(self.health <= 0){
                [self changeState:4];
                [self unscheduleUpdate];
            }else{
                [self changeState:3];
            }
            return;
    }

    
    if(destination_reached && sstate != 3){
        [self changeState:3];
        return;
    }
    
    if(sstate == 3){
        currentTime+=dt;
        if(currentTime > freq){
            [self fire:dt];
            currentTime = 0;
        }
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
    
}

-(void)activateSoldier{
    active = YES;
}

-(void) reset{
    destination_reached = NO;
    Waypoint *waypoint = (Waypoint*)[waypoints objectAtIndex:([waypoints count]-1)];
    spawnpoint = waypoint.nextWaypoint;
    self.position = waypoint.myPosition;
    [self scheduleUpdate];
}

@end
