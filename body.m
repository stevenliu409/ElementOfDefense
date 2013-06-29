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
@synthesize health;
@synthesize shield;
@synthesize attack;

+(id) makeBody:(NSString *)dir{
    return [[self alloc] initBody:dir];
}

-(id) initBody:(NSString *) fname{
    
    if((self = [super initWithSpriteFrameName:fname])){
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


@end
