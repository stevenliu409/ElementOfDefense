//
//  zArmy.m
//  Element Of Defense
//
//  Created by Steven Liu on 2013-05-02.
//
//

#import "sArmy.h"

@implementation sArmy


+(id) makeMGArmy:(int)numMGsoldier{
    return [[self alloc] initMGArmy:numMGsoldier];
}

+(id) makeSniperArmy:(int)numSniper{
    return [[self alloc] initSniperArmy:numSniper ];
}

+(id) makeTankArmy:(int)numTankSoldier{
    return [[self alloc] initTankArmy:numTankSoldier ];
}

-(id) initMGArmy:(int)numMGsoldiers{
    mgSoldier_array = [[[NSMutableArray alloc] init]autorelease];
    for(int i =0; i<numMGsoldiers;i++){
        mgsoldier *s1 = [ mgsoldier makeMg];
        [mgSoldier_array addObject:s1];
    }
    return self;
}
-(id) initSniperArmy:(int)numSnipers{
    Sniper_array = [[[NSMutableArray alloc] init] autorelease];
    for(int j =0; j<numSnipers;j++){
        snipersoldier *s2 = [ snipersoldier makeSniper];
        [Sniper_array addObject:s2];
    }
    
    return self;
}


-(id) initTankArmy:(int)numTankSoldiers{
    TankSoldier_array = [[[NSMutableArray alloc] init] autorelease];
    for(int k =0; k<numTankSoldiers;k++){
        tanksoldier *s3 = [ tanksoldier makeTankSoldier];
        [TankSoldier_array addObject:s3];
    }
    
    return self;
}

-(id) call_MG_reinforcements:(int)numMGsoldier{
    for(int i =0; i<numMGsoldier; i++){
        mgsoldier *temp_soldier = [mgSoldier_array objectAtIndex:0];
        [self addChild:temp_soldier];
        [mgSoldier_array removeLastObject];
    }
    return self;
}

-(id) call_Sniper_reinforcements:(int)numSniper{
    for (int i=0; i<numSniper; i++) {
        snipersoldier *temp_soldier = [Sniper_array objectAtIndex:0];
        [self addChild:temp_soldier];
        [Sniper_array removeLastObject];
    }
    return self;
    
}

-(id) call_Tank_reinforcements:(int)numTanksoldier{
    for(int i =0; i < numTanksoldier;i++){
        tanksoldier *temp_soldier = [TankSoldier_array objectAtIndex:0];
        [self addChild:temp_soldier];
        [TankSoldier_array removeLastObject];
    }
    return self;
}
@end
