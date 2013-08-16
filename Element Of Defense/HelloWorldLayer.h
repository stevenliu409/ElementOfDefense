//
//  HelloWorldLayer.h
//  Element Of Defense
//
//  Created by Steven Liu on 2013-04-21.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//


#import <GameKit/GameKit.h>
// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "Bullet.h"
#import "BulletCache.h"
#import "vampireHead.h"
#import "mWave.h"
#import "monster.h"
// HelloWorldLayer
@interface HelloWorldLayer : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
    Bullet* b1;
    int army_count;
    NSMutableArray* bodyCache;
    NSMutableArray* monsterCache;
    NSMutableArray* playerMonster;
    NSMutableArray* deadSoldiers;
    NSUserDefaults* prefs;
    vampireHead* v1;
    vampireHead* v2;
    CCSpriteBatchNode *sceneSpriteBatchNode;
    NSMutableDictionary* linesDic;
    //BOOL split;
    soldierBase* base;
    CCLabelTTF* conLabel;
    
}

@property(nonatomic,retain) BulletCache* cache;
@property(nonatomic, retain) mWave* wave;
@property (nonatomic,strong) NSMutableArray *waypoints, *waypoints2, *waypoints3;
@property (nonatomic,strong) NSMutableArray *soldiers;


// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;
+(HelloWorldLayer*) getLevel;
-(BOOL)circle:(CGPoint)circlePoint withRadius:(float)radius collisionWithCirle:(CGPoint)circlePointTwo collisionCircleRadius:(float)radiusTwo;
-(void) genBodyPart:(monster* )m;
-(double) genRandom;
-(void) stopGame;
-(void) moveRight;
-(void) moveLeft;
-(void) changeToLeft:(ccTime) dt;
-(void) changeToRight:(ccTime) dt;
-(void) resetSoldiers;
@end
