//
//  Bullet.h
//  Element Of Defense
//
//  Created by Leo Cheung on 13-05-03.
//
//

#import "soldier.h"

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
+(id)makeBullet;
-(id)initBullet;
-(void) shootBulletFrom:(soldier*) s timer:(ccTime)ct;
-(void)updateBullet:(ccTime)ct;
@end
