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
#import "testRArm.h"
#import "testRLeg.h"
@implementation mWave

-(id) init{
    if(self = [super init]){
        batch = [CCSpriteBatchNode batchNodeWithFile:@"testAltas_default.png"];
        [self addChild:batch];
        [self geneMonsters];
        //[self scheduleUpdate];
    }
    return self;
}

-(void) geneMonsters{
    int pos = 480;
    for(int n = 0; n < 1; n++){
        //monster* m = [monster makeMonster:[zombieHead makeZhead] mhead:[vampireHead makevampireHead]];
        //m.position = ccp(200,100);
        
        monster* m = [monster makeMonster:[body makeBody:@"body.png"] mhead:[body makeBody:@"head.png"] mrleg:[testRLeg makeTestRLeg:@"rleg_1.png" fromFile:@"walkRleg"] mlleg:[testRLeg makeTestRLeg:@"lleg_1.png" fromFile:@"walkLleg"] mrarm:[testRArm makeTestRArm:@"rarm_1.png" fromFile:@"walkRArm" attackDir:@"attackArm"] mlarm:[testRArm makeTestRArm:@"larm_1.png" fromFile:@"walkLArm" attackDir:@"attackArm"]];
        m.mhead.flipX = YES;
        m.mbody.flipX = YES;
        [m setTexture:batch.texture];
        [batch addChild:m];
        [m setUpPos:300 yPos:100];
        pos += 50;
    }
    mArray = [batch children];
}

-(void) addMonster:(monster *)m{
    [m setTexture:batch.texture];
    [batch addChild:m];
}

-(void) addMonster:(body*)head mbody:(body*) b{
    monster* m = [monster makeMonster:[body makeBody:@"body.png"] mhead:[body makeBody:@"head.png"] mrleg:[testRLeg makeTestRLeg:@"rleg_1.png" fromFile:@"walkRleg"] mlleg:[testRLeg makeTestRLeg:@"lleg_1.png" fromFile:@"walkLleg"] mrarm:[testRArm makeTestRArm:@"rarm_1.png" fromFile:@"walkRArm" attackDir:NULL] mlarm:[testRArm makeTestRArm:@"larm_1.png" fromFile:@"walkLArm" attackDir:NULL]];
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
