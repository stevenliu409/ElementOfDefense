//
//  tanksoldier.m
//  Element Of Defense
//
//  Created by Steven Liu on 2013-05-03.
//
//

#import "tanksoldier.h"

@implementation tanksoldier

+(id) makeTankSoldier{
    return [[self alloc] initTankSoldier];

}

-(id) initTankSoldier{
    if(self = [super initWithFile:@"soldier3.png"]){
        health = 20;
        damage = 5;
        range = 1;
        freq = 3;
        speed = 1;
    }
    return self;
}

-(void) updateSoldier:(ccTime *)ct :(int) speed{
    [super updateSoldier:ct :speed ];
}


@end
