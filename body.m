//
//  body.m
//  Element Of Defense
//
//  Created by Hua Dong on 13-05-03.
//
//

#import "body.h"

@implementation body
@synthesize speed;
@synthesize shield;
@synthesize attack;
@synthesize currentAni;
@synthesize fdir;
@synthesize fdis;
@synthesize ffn;
+(id) makeBody:(NSString *)dir{
    return [[self alloc] initBody:dir];
}

+(id) makeBodyWithFn:(NSString *)fname{
    return [[self alloc] initWithFile:fname];
}
-(id) initBody:(NSString *) fname{
    
    if((self = [super initWithSpriteFrameName:fname])){
        speed = 0;
        health = 0;
        attack = 0;
        shield = 0;
        fdir = fname;
        self.flipX = NO;
    }
    return self;
}

-(id) initBodyWithFn:(NSString*) fname{
    if((self = [super initWithFile:fname])){
        speed = 0;
        health = 0;
        attack = 0;
        shield = 0;
        fdir = fname;
    }
    return self;
}


+(id) makeBodyWithBody:(body *)b{
    return [[self alloc] initBodyWithBody:b];
}

-(id) initBodyWithBody:(body *)b{
    if(self = [super initWithSpriteFrameName:b.fdir]){
        speed = b.speed;
        health = b.health;
        attack = b.attack;
        shield = b.shield;
        self.flipX = NO;
        fdir = b.fdir;
        currentAni = b.currentAni;
        ani = b.ani;
        
    }
    return self;
    
}

-(BOOL) checkTouch:(CGPoint)pt{
    return CGRectContainsPoint(self.boundingBox, pt);
}

- (id)initWithCoder:(NSCoder *)decoder{
    self = [[body alloc] init];
    if (self != nil) {
        self.speed = [decoder decodeIntForKey:@"speed"];
        self.health = [decoder decodeIntForKey:@"health"];
        self.attack = [decoder decodeIntForKey:@"attack"];
        self.shield = [decoder decodeIntForKey:@"shield"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeInt:speed forKey:@"speed"];
    [encoder encodeInt:health forKey:@"health"];
    [encoder encodeInt:shield forKey:@"shield"];
    [encoder encodeInt:attack forKey:@"attack"];
}

-(void) dealloc{
    [currentAni release];
    [super dealloc];
}


@end
