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
    num_MG_Soldier = numMGsoldiers;
    return self;
}
-(id) initSniperArmy:(int)numSnipers{
    num_Sniper = numSnipers;
    return self;
}


-(id) initTankArmy:(int)numTankSoldiers{
    num_tank_soldier = numTankSoldiers;
    return self;
}

-(id) call_MG_reinforcements:(int)numMGsoldier{
    num_MG_Soldier -= numMGsoldier;
    return self;
}

-(id) call_Sniper_reinforcements:(int)numSniper{
    num_Sniper -= numSniper;
    return self;
}

-(id) call_Tank_reinforcements:(int)numTanksoldier{
    num_tank_soldier-= numTanksoldier;
    return self;
}
@end
