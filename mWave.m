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
#import "body.h"
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
    for(int n = 0; n < 1; n++){
        monster* m = [monster makeMonster:[zombieHead makeZhead] mhead:[vampireHead makevampireHead]];
        //m.position = ccp(200,100);
        [m setTexture:batch.texture];
        [batch addChild:m];
        pos += 50;
    }
    mArray = [batch children];
}

-(void) addMonster:(monster *)m{
    [m setTexture:batch.texture];
    [batch addChild:m];
}

-(void) addMonster:(body*)head mbody:(body*) b{
    monster* m = [monster makeMonster:b mhead:head];
    [m setTexture:batch.texture];
    [batch addChild:m];
}

-(CCArray*) getMonsters{
    return [batch children];
}

-(void) removeMonster:(monster *)m{
    [batch removeChild:m cleanup:YES];
}


-(void) cleanMonster{
    [batch removeAllChildrenWithCleanup:YES];
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
