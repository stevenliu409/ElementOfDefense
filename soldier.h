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
    BOOL active;
    CCAnimation* walkAni;
    CCAnimation* shotAni;
    CCAnimation* standAni;
    CCAnimation* deadAni;
    NSString* fileName;
    NSMutableArray* waypoints;
    CCLayer* gameLayer;
    CCAnimate* action;
    BOOL sChange;
}

@property (readonly) BOOL dead;
@property (readonly) int speed;
@property (readonly) int range;
@property (readonly) int damage;
@property (assign) double freq;
/*
@property (nonatomic,retain) CCAnimation* walkAni;
@property (nonatomic,retain) CCAnimation* shotAni;
@property (nonatomic,retain) CCAnimation* standAni;*/


+(id) makeSoldier;
-(id) initSoldier;
-(void) updateSoldier:(ccTime) ct;
-(void)activateSoldier;
//-(void) getAttacked:(monster*) m;
-(void) fire:(ccTime) dt;
-(CCAnimation*) loadAnimation:(NSString*) aniName fileName:(NSString*)fn;
-(void) changeState:(int) state;

@end
