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
        self.flipX = YES;
        self.currentAni = [self loadAnimation:fn fileName:@"test"];
        if(self.currentAni == NULL){
            NSLog(@"error");
        }else{
            [self runAction:[CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:self.currentAni]]];
        }
        sstate = 1;
        
    }
    return self;
}


-(void) dealloc{
    [super dealloc];
}

@end
