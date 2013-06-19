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
#import "CCLayer.h"
@interface sArmy : CCNode
{
    NSMutableArray* mgSoldier_array;
    NSMutableArray* Sniper_array;
    NSMutableArray* TankSoldier_array;

}
+(id) makeMGArmy:(int)numMGsoldier;
+(id) makeSniperArmy:(int)numSniper;
+(id) makeTankArmy:(int)numTankSoldier;
-(id) initMGArmy:(int)numMGsoldiers;
-(id) initSniperArmy:(int)numSnipers;
-(id) initTankArmy:(int)numTankSoldier;
-(void) call_MG_reinforcements:(int)numMGsoldier layer:(CCLayer*) l;
-(id) call_Sniper_reinforcements:(int)numSniper;
-(id) call_Tank_reinforcements:(int)numTanksoldier;



@end
