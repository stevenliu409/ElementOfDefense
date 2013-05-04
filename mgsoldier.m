//
//  mgsoldier.m
//  Element Of Defense
//
//  Created by Steven Liu on 2013-05-02.
//
//

#import "mgsoldier.h"

@implementation mgsoldier

+(id) makeMg{
    return [[self alloc] initMg];
}

-(id) initMg{
    if(self = [super initWithFile:@"soldier1.png"]){
        health = 10;
        damage = 2;
        range = 5;
        freq = 2;
        speed =2;
    }
    return self;
}



@end
