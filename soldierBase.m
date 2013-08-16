//
//  soldierBase.m
//  ZombieDefense
//
//  Created by Hua Dong on 13-08-16.
//
//

#import "soldierBase.h"
#import "GameObj.h"
#import "CCSpriteFrameCache.h"
//#import "CCA"
#import "cocos2d.h"
@implementation soldierBase

+(id) makeBase{
    return [[self alloc] initBase];
}

-(id) initBase{
    if(self = [super initWithSpriteFrameName:@"radar_1.png"]){
        health = 10;
        //[self scheduleUpdate];
    }
    return self;
}


-(void) changeState:(int)state{
    sstate = state;
    [self stopAllActions];
    if(state == 1){
        [self setDisplayFrame:[[CCSpriteFrameCache
                                sharedSpriteFrameCache]
                               spriteFrameByName:@"radar_1.png"]];
    }else if(state == 2){
        deadAni = [self loadAnimation:@"blowingUpAnim" fileName:@"RadarDish"];
        id ani = [CCAnimate actionWithAnimation:deadAni];
        [self runAction:ani];
    }
}


-(void) update:(ccTime) dt{
    //NSLog(@"%d",self.health);
    if(self.health <= 0){
        [self changeState:2];
        self.dead = YES;
        [self unscheduleUpdate];
    }
}

@end
