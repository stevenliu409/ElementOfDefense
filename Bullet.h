//
//  Bullet.h
//  Element Of Defense
//
//  Created by Leo Cheung on 13-05-03.
//
//

#import "soldier.h"

@interface Bullet : soldier


+(id)makeBullet;
-(id)initBullet;
-(void)updateBullet:(soldier*) s;

@end
