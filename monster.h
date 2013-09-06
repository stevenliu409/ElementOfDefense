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
}


@property(nonatomic, retain) body* mbody;
@property(nonatomic, retain) body* mhead;
@property(nonatomic, retain) body* mleg;
@property(nonatomic, retain) body* marm;
@property(nonatomic, retain) body* mrleg;
@property(nonatomic, retain) body* mrarm;
@property(readonly) double attFreq;
@property(assign) BOOL dead;
@property(assign) int damage;
@property(readonly) double prect;

+(id) makeMonster:(body*) b mhead:(body*) h mrleg:(body*) mr mlleg:(body*) lr mrarm:(body*) ra mlarm:(body*) la;
-(id) initMonster:(body*) b mhead:(body*) h mrleg:(body*) mr mlleg:(body*) lr mrarm:(body*) ra mlarm:(body*) la;
+(id) newMonster;
-(BOOL) addBody:(body*) b;
-(BOOL) checkMonster;
-(void) moveMonster:(ccTime) ct;
-(void) monsterAttack:(GameObj*) s timer:(ccTime)ct;
-(void) attack:(GameObj*) s;
-(int) getMSpeed;
-(BOOL) updateMonster:(ccTime) ct soilders:(GameObj*) s1;
-(void) killed;
-(void) setUpPos:(int) x yPos:(int) y;
@end
