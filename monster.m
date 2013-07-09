//
//  monster.m
//  Element Of Defense
//
//  Created by Hua Dong on 13-05-03.
//
//

#import "monster.h"
#import "cocos2d.h"
@interface monster(PrivateMethod)

-(void) makeMonster;
@end

@implementation monster
@synthesize mbody;
@synthesize mhead;
@synthesize attFreq;
+(id) makeMonster:(body *)b mhead:(body *)h{
    return [[self alloc] initMonster:b mhead:h];
}

-(id) initMonster:(body *)b mhead:(body *)h{
    if(self = [super init]){
        mhead = h;
        mbody = b;
        mbody.position = CGPointMake(0, 0);
        mhead.position = CGPointMake(0,25);
        [self addChild:mhead];
        [self addChild:mbody];
    }
    return self;
}

+(id) newMonster{
    return [[self alloc] init];
}

-(id) init{
    if(self = [super init]){
        mhead = NULL;
        mbody = NULL;
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)decoder{
    self = [[monster alloc] init];
    if (self != nil) {
        self.mbody = [decoder decodeObjectForKey:@"body"];
        self.mhead = [decoder decodeObjectForKey:@"head"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:mbody forKey:@"body"];
    [encoder encodeObject:mhead forKey:@"head"];
}

-(BOOL) addBody:(body *)b{
    if (mhead == NULL) {
        mhead = b;
        return true;
    }else if(mbody == NULL){
        mbody = b;
        return true;
    }else{
        return false;
    }
}

-(void) moveMonster:(ccTime)ct{
    
}

-(void) monsterAttack:(soldier* )s timer:(ccTime)ct{
    totalTime += ct;
    currentTime = totalTime;
    if(currentTime >attFreq){
        currentTime = 0;
        totalTime = 0;
        [self attack:s];
    }
}

-(void) attack:(soldier *)s{
    
}

-(int) getMSpeed{
    int s = mbody.speed + mbody.speed;
    return s;
}



-(BOOL) checkMonster{
    return mhead != NULL && mbody != NULL;
}


-(void) updateMonster:(ccTime)ct soilders:(soldier *)s{
    if([self hitSoldier:s]){
        [self monsterAttack:s timer:ct];
    }else{
        [self moveMonster:ct];
    }
}



@end
