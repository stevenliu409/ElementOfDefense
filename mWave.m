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
        [self geneMonsters];
        //[self scheduleUpdate];
    }
    return self;
}

-(void) geneMonsters{
    int pos = 480;
    for(int n = 0; n < 10; n++){
        monster* m = [monster makeMonster:[zombieHead makeZhead] mhead:[vampireHead makevampireHead]];
        m.position = ccp(pos,100);
        [m setTexture:batch.texture];
        [batch addChild:m];
        pos += 50;
    }
    mArray = [batch children];
}

-(void) addMonster:(monster *)m{
    [batch addChild:m];
}

-(CCArray*) getMonsters{
    return [batch children];
}

-(void) removeMonster:(monster *)m{
    
}



/*
-(void) update:(ccTime) dt{
    for(int n = 0; n < mArray.count; n++){
        monster* m = [mArray objectAtIndex:n];
        //[m updateMonster:dt];
    }
}
 */

@end
