//
//  testRLeg.m
//  ZombieDefense
//
//  Created by Hua Dong on 13-09-05.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "testRLeg.h"
#import "monster.h"

@implementation testRLeg

+(id) makeTestRLeg:(NSString *)dis fromFile:(NSString *)fn{
    return [[self alloc] initTestRleg:dis fromFile:fn];
}


-(id) initTestRleg:(NSString *)dis fromFile:(NSString *)fn{
    if(self = [super initBody:dis]){
        fdis = dis;
        ffn = fn;
        self.flipX = YES;
        self.currentAni = [self loadAnimation:fn fileName:@"test"];
        if(self.currentAni == NULL){
            NSLog(@"error");
        }else{
            [self runAction:[CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:self.currentAni]]];
        }
        sstate = 2;
        
    }
    return self;
}


-(void) changeState:(int)state{
    sstate = state;
    [self stopAllActions];
    self.currentAni = NULL;
    ani = NULL;
    if(sstate == 1){
        [self setDisplayFrame:[[CCSpriteFrameCache
                                sharedSpriteFrameCache]
                               spriteFrameByName:fdis]];

    }else if(sstate == 2){
        self.currentAni = [self loadAnimation:ffn fileName:@"test"];
        ani = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:self.currentAni]];
    }
    
    if(ani != NULL){
        [self runAction:ani];
    }
}


-(void) dealloc{
    [super dealloc];
}

@end
