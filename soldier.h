//
//  soldier.h
//  Element Of Defense
//
//  Created by Steven Liu on 2013-05-02.
//
//

#import "CCSprite.h"

@interface soldier : CCSprite{
    int health,range, damage, freq;
}

+(id) makeSoldier:(int) type;
-(id) initSoldier:(int) type;

@end
