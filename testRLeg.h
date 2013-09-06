//
//  testRLeg.h
//  ZombieDefense
//
//  Created by Hua Dong on 13-09-05.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "body.h"
@interface testRLeg : body {
    NSString* fdis;
    NSString* ffn;
}
+(id) makeTestRLeg:(NSString*) dis fromFile:(NSString*) fn;
-(id) initTestRleg:(NSString*) dis fromFile:(NSString*) fn;
@end
