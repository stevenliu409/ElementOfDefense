//
//  tanksoldier.m
//  Element Of Defense
//
//  Created by Steven Liu on 2013-05-03.
//
//

#import "tanksoldier.h"

@implementation tanksoldier
@synthesize mySprite;

+(id) makeTankSoldier{
    return [[self alloc] initTankSoldier];

}

-(id) initTankSoldier{
    if(self = [super init]){
        health = 20;
        damage = 5;
        range = 1;
        freq = 3;
        speed = 1;
        mySprite = [CCSprite spriteWithFile:@"soldier3.png"];
        mySprite.scaleX = 75/mySprite.contentSize.width;
        mySprite.scaleY = 75/mySprite.contentSize.height;
		[self addChild:mySprite];

    }
    return self;
}


@end
