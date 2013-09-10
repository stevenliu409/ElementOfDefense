//
//  testRArm.m
//  ZombieDefense
//
//  Created by Hua Dong on 13-09-06.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "testRArm.h"


@implementation testRArm


+(id) makeTestRArm:(NSString *)dis fromFile:(NSString *)fn attackDir:(NSString *)adir{
    return [[self alloc] initTestRArm:dis fromFile:fn attackDir:adir];
}

-(id) initTestRArm:(NSString *)dis fromFile:(NSString *)fn attackDir:(NSString *)adir{
    if(self = [super initTestRleg:dis fromFile:fn]){
        attackDir = adir;
        self.currentAni = [self loadAnimation:fn fileName:@"test"];
        if(self.currentAni == NULL){
            NSLog(@"error");
        }else{
            //[self stopAllActions];
            [self runAction:[CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:self.currentAni]]];
        }

    }
    return self;
}

-(void) changeState:(int)state{
    sstate = state;
    if(sstate == 1){
        sstate = state;
        [self stopAllActions];
        self.currentAni = NULL;
        ani = NULL;
        if(sstate == 1){
            
            [self setDisplayFrame:[[CCSpriteFrameCache
                                    sharedSpriteFrameCache]
                                   spriteFrameByName:fdis]];
            
        }
    }else if(sstate == 2){
        self.currentAni = [self loadAnimation:ffn fileName:@"test"];
        ani = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:self.currentAni]];
    }
    
    if(ani != NULL){
        [self runAction:ani];
    }
    
}

@end
