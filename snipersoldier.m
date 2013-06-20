//
//  snipersoldier.m
//  Element Of Defense
//
//  Created by Steven Liu on 2013-05-02.
//
//

#import "snipersoldier.h"

@implementation snipersoldier
@synthesize mySprite;

+(id) makeSniper{
    return [[self alloc] initSniper];
}

-(id) initSniper{
    if(self = [super init] ){
        health = 6;
        damage = 7;
        range = 10;
        freq = 2;
        speed = 3;
        mySprite = [CCSprite spriteWithFile:@"soldier2.png"];
        mySprite.scaleX = 75/mySprite.contentSize.width;
        mySprite.scaleY = 75/mySprite.contentSize.height;
		[self addChild:mySprite];
    }
    return self;
}


@end
