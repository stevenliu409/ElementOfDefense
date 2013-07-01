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
// HelloWorldLayer
@interface HelloWorldLayer : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
    Bullet* b1;
    NSMutableArray* army;
    NSMutableArray* bodyCache;
    NSMutableArray* monsterCache;
    NSUserDefaults* prefs;
    vampireHead* v1;
    vampireHead* v2;
    
}

@property(nonatomic,retain) BulletCache* cache;
@property(nonatomic, retain) mWave* wave;
@property (nonatomic,strong) NSMutableArray *waypoints, *waypoints2;

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;
+(HelloWorldLayer*) getLevel;
-(BOOL)circle:(CGPoint)circlePoint withRadius:(float)radius collisionWithCirle:(CGPoint)circlePointTwo collisionCircleRadius:(float)radiusTwo;
@end
