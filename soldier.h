//
//  soldier.h
//  Element Of Defense
//
//  Created by Steven Liu on 2013-05-02.
//
//

#import "CCSprite.h"

@interface soldier : CCSprite{
    int health,range, damage, freq, speed;
    BOOL dead;
}

@property (readonly) BOOL dead;
@property (readonly) int speed;

+(id) makeSoldier:(int) type;
-(id) initSoldier:(int) type;
-(void) updateSoldier:(ccTime*) ct:(int)speed;
//-(void) getAttacked:(monster*) m;
@end
