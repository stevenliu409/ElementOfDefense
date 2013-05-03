//
//  monster.m
//  Element Of Defense
//
//  Created by Hua Dong on 13-05-03.
//
//

#import "monster.h"

@implementation monster
@synthesize body;
@synthesize head;
+(id) makeMonster:(CCSprite *)b mhead:(CCSprite *)h{
    return [[self alloc] initMonster:b mhead:h];
}

-(id) initMonster:(CCSprite *)b mhead:(CCSprite *)h{
    if(self = [super init]){
        head = h;
        body = b;
        body.position = CGPointMake(0, 0);
        head.position = CGPointMake(0,25);
        [self addChild:head];
        [self addChild:body];
    }
    return self;
}


@end
