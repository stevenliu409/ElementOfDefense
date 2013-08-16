//
//  soldier.h
//  Element Of Defense
//
//  Created by Steven Liu on 2013-05-02.
//
//

#import "CCSprite.h"
#import "Waypoint.h"
#import "GameObj.h"
@interface soldier : GameObj{
    int range, damage, speed;
    BOOL destination_reached;
    double freq;
    double currentTime;
    Waypoint *spawnpoint;
    BOOL active;
    CCAnimation* walkAni;
    CCAnimation* shotAni;
    CCAnimation* standAni;
    CCAnimation* deadAni;
    CCAnimation* hurtAni;
    //NSString* fileName;
    NSMutableArray* waypoints;
    CCLayer* gameLayer;
    CCAnimate* action;
    BOOL sChange;
    //id ani1;
}

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
-(void)activateSoldier;
//-(void) getAttacked:(monster*) m;
-(void) fire:(ccTime) dt;
//-(CCAnimation*) loadAnimation:(NSString*) aniName fileName:(NSString*)fn;
-(void) reset;
@end
