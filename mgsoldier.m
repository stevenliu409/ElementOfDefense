//
//  mgsoldier.m
//  Element Of Defense
//
//  Created by Steven Liu on 2013-05-02.
//
//

#import "mgsoldier.h"

@implementation mgsoldier
@synthesize mySprite;

+(id) makeMg{
    return [[self alloc] initMg];
}

-(id) initMg{
    if(self = [super init]){
        health = 10;
        damage = 2;
        range = 2;
        freq = 0.5;
        speed =2;
        mySprite = [CCSprite spriteWithFile:@"soldier1.png"];
        mySprite.scaleX = 75/mySprite.contentSize.width;
        mySprite.scaleY = 75/mySprite.contentSize.height;
		[self addChild:mySprite];
    }
    
    return self;
}



@end
