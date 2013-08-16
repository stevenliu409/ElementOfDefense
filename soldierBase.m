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
@synthesize finishAni;
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
        ani = [CCAnimate actionWithAnimation:deadAni];
        [self runAction:ani];
    }
}


-(void) update:(ccTime) dt{
    //NSLog(@"%d",self.health);
    if(self.health <= 0){
        [self changeState:2];
        [self unscheduleUpdate];
        [self schedule:@selector(checkAniFinsh:)];
        self.dead = YES;
        
    }
}

-(void) checkAniFinsh:(ccTime)dt{
    NSLog(@"%d",[self numberOfRunningActions]);
    if([self numberOfRunningActions]== 0){
        finishAni = YES;
        [self unschedule:@selector(checkAniFinsh:)];
    }

}

@end
