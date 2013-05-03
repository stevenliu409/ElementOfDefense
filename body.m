//
//  body.m
//  Element Of Defense
//
//  Created by Hua Dong on 13-05-03.
//
//

#import "body.h"

@implementation body


+(id) makeBody:(NSString *)dir{
    return [[self alloc] initBody:dir];
}

-(id) initBody:(NSString *)dir{
    if(self = [super initWithFile:dir]){
    }
    return self;
}

@end
