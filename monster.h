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
#import "soldierBase.h"
#import "testRArm.h"
#import "testRLeg.h"
//#import "Bullet.h"
@interface monster : GameObj{
    int currentTime;
    double totalTime;
    CGPoint rlegPos;
    CGPoint headPos;
    CGPoint bodyPos;
    CGPoint llegPos;
    CGPoint rarmPos;
    CGPoint larmPos;
    double xPos,yPos;
}


@property(nonatomic, retain) body* mbody;
@property(nonatomic, retain) body* mhead;
@property(nonatomic, retain) testRLeg* mleg;
@property(nonatomic, retain) testRArm* marm;
@property(nonatomic, retain) testRLeg* mrleg;
@property(nonatomic, retain) testRArm* mrarm;
@property(readonly) double attFreq;
@property(assign) BOOL dead;
@property(assign) int damage;
@property(readonly) double prect;

+(id) makeMonster:(body*) b mhead:(body*) h mrleg:(testRLeg*) mr mlleg:(testRLeg*) lr mrarm:(testRArm*) ra mlarm:(testRArm*) la;
-(id) initMonster:(body*) b mhead:(body*) h mrleg:(testRLeg*) mr mlleg:(testRLeg*) lr mrarm:(testRArm*) ra mlarm:(testRArm*) la;
+(id) newMonster;
-(BOOL) addBody:(body*) b;
-(BOOL) checkMonster;
-(void) moveMonster:(ccTime) ct;
-(void) monsterAttack:(GameObj*) s timer:(ccTime)ct;
-(void) attack:(GameObj*) s;
-(int) getMSpeed;
-(BOOL) updateMonster:(ccTime) ct soilders:(GameObj*) s1;
-(void) killed;
-(void) setUpPos:(double) x yPos:(int) y;
@end
