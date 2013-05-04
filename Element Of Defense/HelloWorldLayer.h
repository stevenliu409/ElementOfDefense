//
//  HelloWorldLayer.h
//  Element Of Defense
//
//  Created by Steven Liu on 2013-04-21.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//


#import <GameKit/GameKit.h>
#import "mgsoldier.h"
#import "snipersoldier.h"
#import "tanksoldier.h"
// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "Bullet.h"
#import "BulletCache.h"
// HelloWorldLayer
@interface HelloWorldLayer : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
    mgsoldier* s1;
    snipersoldier* s2;
    tanksoldier* s3 ;
    Bullet* b1;
    NSMutableArray* army;
    NSMutableArray* bodyCache;
    NSUserDefaults* prefs;
    
}

@property(nonatomic,retain) BulletCache* cache;

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;
+(HelloWorldLayer*) getLevel;

@end
