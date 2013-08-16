//
//  sArmy.m
//  Element Of Defense
//
//  Created by Steven Liu on 2013-05-02.
//
//

#import "sArmy.h"
#import "Waypoint.h"
#import "mgsoldier.h"
#import "snipersoldier.h"
#import "tanksoldier.h"

@implementation sArmy

/*

+(id) makeArmy:(int)numMGsoldier sniper:(int)s tank:(int)t{
    
}

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
    mgSoldier_array = [[NSMutableArray alloc] init];
    for(int i =0; i<numMGsoldiers;i++){
        mgsoldier *s1 = [ mgsoldier make];
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

-(void) call_MG_reinforcements:(int)numMGsoldier layer:(CCLayer *)l{
    for(int i =0; i<numMGsoldier; i++){
        mgsoldier *temp_soldier = [mgSoldier_array objectAtIndex:0];
        [l addChild:temp_soldier z:3];
        [mgSoldier_array removeObject:temp_soldier];
    }
}

-(void) call_Sniper_reinforcements:(int)numSniper layer:(CCLayer *)l{
    for (int i=0; i<numSniper; i++) {
        snipersoldier *temp_soldier = [Sniper_array objectAtIndex:0];
        [l addChild:temp_soldier z:3];
        [Sniper_array removeObject:temp_soldier];
    }
}

-(void) call_Tank_reinforcements:(int)numTanksoldier layer:(CCLayer*) l{
    for(int i =0; i < numTanksoldier;i++){
        tanksoldier *temp_soldier = [TankSoldier_array objectAtIndex:0];
        [l addChild:temp_soldier z:3];
        [TankSoldier_array removeObject:temp_soldier];
    }
}
 */
@end
