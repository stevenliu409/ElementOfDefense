//
//  monster.h
//  Element Of Defense
//
//  Created by Hua Dong on 13-05-03.
//
//

#import "CCSprite.h"
#import "body.h"
#import "soldier.h"
@interface monster : CCSprite{
    int currentTime;
    double totalTime;
}


@property(nonatomic, retain) body* mbody;
@property(nonatomic, retain) body* mhead;
@property(readonly) double attFreq;

+(id) makeMonster:(body*) b mhead:(body*) h;
-(id) initMonster:(body*) b mhead:(body*) h;
+(id) newMonster;
-(BOOL) addBody:(body*) b;
-(BOOL) checkMonster;
-(void) moveMonster:(ccTime) ct;
-(void) monsterAttack:(soldier*) s timer:(ccTime)ct;
-(BOOL) hitSoldier:(soldier*) s;
-(void) attack:(soldier*) s;
-(int) getMSpeed;
-(void) updateMonster:(ccTime) ct soilders:(soldier*) s;
@end
