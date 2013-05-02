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
    BOOL dead;
}

@property (readonly) BOOL dead;

+(id) makeSoldier:(int) type;
-(id) initSoldier:(int) type;
-(void) updateSoldier:(ccTime*) ct;
//-(void) getAttacked:(monster*) m;
@end
