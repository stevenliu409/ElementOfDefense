//
//  zArmy.h
//  Element Of Defense
//
//  Created by Steven Liu on 2013-05-02.
//
//

#import "CCNode.h"
#import "mgsoldier.h"
#import "snipersoldier.h"
#import "tanksoldier.h"

@interface sArmy : CCNode
{
    int num_MG_Soldier, num_Sniper, num_tank_soldier;
}
+(id) makeMGArmy:(int)numMGsoldier;
+(id) makeSniperArmy:(int)numSniper;
+(id) makeTankArmy:(int)numTankSoldier;
-(id) initMGArmy:(int)numMGsoldiers;
-(id) initSniperArmy:(int)numSnipers;
-(id) initTankArmy:(int)numTankSoldier;
-(id) call_MG_reinforcements:(int)numMGsoldier;
-(id) call_Sniper_reinforcements:(int)numSniper;
-(id) call_Tank_reinforcements:(int)numTanksoldier;



@end
