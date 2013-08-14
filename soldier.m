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
@synthesize dead,speed,range,damage,freq,health,sstate;
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

/*
-(void) updateSoldier:(ccTime)ct{
     
    currentTime+=ct;
    if(currentTime > freq){
    
        [self fire:ct];
        currentTime = 0;
    }

}
*/
-(void) changeState:(int)state{
    sstate = state;
    [self stopAllActions];
    id ani;
    if(state == 1){
        [self setDisplayFrame:[[CCSpriteFrameCache
                                sharedSpriteFrameCache]
                               spriteFrameByName:@"sv_anim_1.png"]];
    }else if(state == 2){
        walkAni = [self loadAnimation:@"walkingAnim" fileName:@"Viking"];
        
        ani = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:walkAni]];
    }else if(state == 3){
        shotAni = [self loadAnimation:@"malletPunchAnim" fileName:@"Viking"];
        
        ani = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:shotAni]];
    }else if(state == 4){
        deadAni = [self loadAnimation:@"vikingDeathAnim" fileName:@"Viking"];
        ani = [CCAnimate actionWithAnimation:deadAni];
    }
    
    if(ani != nil){
        [self runAction:ani];
    }

    
}

-(CCAnimation*) loadAnimation :(NSString *)aniName fileName:(NSString*) fn{
    //CCAnimation* ani;
    fileName = [[NSBundle mainBundle] pathForResource:fn ofType:@"plist"];
    NSDictionary* aniDic = [NSDictionary dictionaryWithContentsOfFile:fileName];
    if(aniDic == nil){
        NSLog(@"not find dic");
        return nil;
    }
    NSDictionary* aniSubDic = [aniDic objectForKey:aniName];
    if(aniSubDic == nil){
        NSLog(@"not find aniSubDic");
        return nil;
    }
    CCAnimation* ani = [CCAnimation animation];
    float d = [[aniSubDic objectForKey:@"delay"]floatValue];
    [ani setDelayPerUnit:d];
    NSString* frameNums = [aniSubDic objectForKey:@"animationFrames"];
    NSArray *animationFrameNumbers =
    [frameNums componentsSeparatedByString:@","];
    
    NSString *animationFramePrefix =
    [aniSubDic objectForKey:@"filenamePrefix"];

    for (NSString *frameNumber in animationFrameNumbers) {
        NSString *frameName =
        [NSString stringWithFormat:@"%@%@.png",
         animationFramePrefix,frameNumber];
        [ani addSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache]spriteFrameByName:frameName]];
    }
    return ani;
}

-(int) getState{
    return sstate;
}

-(void)update:(ccTime)dt{
    
    
    if(health <= 0){
        [self changeState:4];
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


@end
