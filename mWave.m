//
//  mWave.m
//  ZombieDefense
//
//  Created by Hua Dong on 13-06-24.
//
//

#import "mWave.h"
#import "monster.h"
#import "zombieHead.h"
#import "vampireHead.h"
@implementation mWave

-(id) init{
    if(self = [super init]){
        batch = [CCSpriteBatchNode batchNodeWithFile:@"mlist.png"];
        [self addChild:batch];
        for(int n = 0; n < 2; n++){
            monster* m = [monster makeMonster:[zombieHead makeZhead] mhead:[vampireHead makevampireHead]];
            m.position = ccp(100,100);
            [m setTexture:batch.texture];
            [batch addChild:m];
        }
    }
    return self;
}

@end
