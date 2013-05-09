//
//  zArmy.m
//  Element Of Defense
//
//  Created by Steven Liu on 2013-05-02.
//
//

#import "sArmy.h"

@implementation sArmy

+(id) makeArmy:(int)numMGsoldier NumberOfSniper:(int)numSniper NumberOfTankSoldier:(int)numTankSoldier{
    return [[self alloc] initArmy:numMGsoldier  NumberOfSniper:numSniper NumberOfTankSoldiers:numTankSoldier];
}


-(id) initArmy:(int)numMGsoldiers NumberofSniper:(int)numSnipers NumberofTankSoldier:(int)numTankSoldiers{
    mgSoldier_array = [[[NSMutableArray alloc] init]autorelease];
    Sniper_array = [[[NSMutableArray alloc] init] autorelease];
    TankSoldier_array = [[[NSMutableArray alloc] init] autorelease];
    
    for(int i =0; i<numMGsoldiers;i++){
        mgsoldier *s1 = [ mgsoldier makeMg];
        [mgSoldier_array addObject:s1];
    }
    
    for(int j =0; j<numSnipers;j++){
        snipersoldier *s2 = [ snipersoldier makeSniper];
        [Sniper_array addObject:s2];
    }
    
    for(int k =0; k<numTankSoldiers;k++){
        tanksoldier *s3 = [ tanksoldier makeTankSoldier];
        [TankSoldier_array addObject:s3];
    }

    return self;
}

-(id) call_MG_reinforcements:(int)numMGsoldier{
    for(int i =0; i<numMGsoldier; i++){
        [mgSoldier_array removeLastObject];
    }
    return self;
}

-(id) call_Sniper_reinforcements:(int)numSniper{
    for (int i=0; i<numSniper; i++) {
        [Sniper_array removeLastObject];
    }
    return self;

}

-(id) call_Tank_reinforcements:(int)numTanksoldier{
    for(int i =0; i < numTanksoldier;i++){
        [TankSoldier_array removeLastObject];
    }
    return self;
}
@end
