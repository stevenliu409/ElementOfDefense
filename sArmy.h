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
    
    NSMutableArray* mgSoldier_array;
    NSMutableArray* Sniper_array;
    NSMutableArray* TankSoldier_array;

}
+(id) makeArmy:(int)numMGsoldier NumberOfSniper:(int)numSniper NumberOfTankSoldier:(int)numTankSoldier;
-(id) initArmy:(int)numMGsoldiers NumberOfSniper:(int)numSnipers NumberOfTankSoldiers:(int)numTankSoldiers;
-(id) call_MG_reinforcements:(int)numMGsoldier;
-(id) call_Sniper_reinforcements:(int)numSniper;
-(id) call_Tank_reinforcements:(int)numTanksoldier;



@end
