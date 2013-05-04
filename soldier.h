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
@property (readonly) int range;
@property (readonly) int damage;
@property (readonly) int freq;
+(id) makeSoldier:(int) type;
-(id) initSoldier:(int) type;
-(void) updateSoldier:(ccTime) ct;
//-(void) getAttacked:(monster*) m;
-(void) fire:(ccTime) dt;
@end
