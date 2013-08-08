//
//  Bullet.h
//  Element Of Defense
//
//  Created by Leo Cheung on 13-05-03.
//
//

#import "soldier.h"
#import "monster.h"
@interface Bullet : CCSprite{
    BOOL shoted;
    double currentTime;
    int totalTime;
}


@property(assign) double speed;
@property(assign) double damage;
@property(assign) double range;
@property(assign) BOOL shoted;
@property(assign) double freq;
@property(assign) CGPoint lastpos;
+(id)makeBullet;
-(id)initBullet;
-(void) bulletAnimation:(soldier*) s timer:(ccTime)ct;
-(BOOL) hitMonster:(monster*) m;

@end
