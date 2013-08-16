//
//  soldierBase.h
//  ZombieDefense
//
//  Created by Hua Dong on 13-08-16.
//
//

#import "CCSprite.h"
#import "GameObj.h"
@interface soldierBase : GameObj{
    CCAnimation* hurtAni;
    CCAnimation* deadAni;
}

@property (assign) BOOL finishAni;


+(id) makeBase;
-(id) initBase;
-(void) checkAniFinsh:(ccTime) dt;
@end
