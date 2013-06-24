//
//  BulletCache.h
//  Element Of Defense
//
//  Created by Hua Dong on 13-05-03.
//
//

#import "CCSprite.h"
#import "cocos2d.h"
#import "soldier.h"
@interface BulletCache : CCNode{
    CCSpriteBatchNode* batch;
    int nextBullet;
    double currentTime;
    int totalTime;
}

-(void) shootBulletFrom:(soldier*) s timer:(ccTime) dt;
-(CCArray*) getCache;
@end
