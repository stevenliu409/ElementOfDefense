//
//  soldier.h
//  Element Of Defense
//
//  Created by Steven Liu on 2013-05-02.
//
//

#import "CCSprite.h"
#import "Waypoint.h"

@interface soldier : CCSprite{
    int health,range, damage, speed;
    BOOL dead, destination_reached;
    double freq;
    double currentTime;
    Waypoint *spawnpoint;
    CGPoint myPosition;
}

@property (readonly) BOOL dead;
@property (readonly) int speed;
@property (readonly) int range;
@property (readonly) int damage;
@property (assign) double freq;

+(id) makeSoldier:(int) type;
-(id) initSoldier:(int) type;
-(void) updateSoldier:(ccTime) ct;
//-(void) getAttacked:(monster*) m;
-(void) fire:(ccTime) dt;
@end
