//
//  mWave.h
//  ZombieDefense
//
//  Created by Hua Dong on 13-06-24.
//
//

#import "CCNode.h"
#import "cocos2d.h"
#import "monster.h"
@interface mWave : CCNode{
    CCSpriteBatchNode* batch;
    CCArray* mArray;
    
}

-(void) geneMonsters;
-(void) addMonster:(monster*) m;
-(CCArray*) getMonsters;
-(void) removeMonster:(monster*)m;
-(void) addMonster:(body*)head mbody:(body*) b;
-(void) cleanMonster;

@end
