//
//  testRArm.h
//  ZombieDefense
//
//  Created by Hua Dong on 13-09-06.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "body.h"
#import "testRLeg.h"
@interface testRArm :testRLeg {
    NSString* attackDir;
}

+(id) makeTestRArm:(NSString*) dis fromFile:(NSString*) fn attackDir:(NSString*) adir;
-(id) initTestRArm:(NSString*) dis fromFile:(NSString*) fn attackDir:(NSString*) adir;

@end
