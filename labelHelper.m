//
//  labelHelper.m
//  ZombieDefense
//
//  Created by Hua Dong on 13-08-23.
//
//

#import "labelHelper.h"

@implementation labelHelper

+(id) makeLabel:(NSString *)str layer:(CCLayer *)l position:(CGPoint)point fontsize:(int) fs zValue:(int)zv{
    return [[self alloc] initLabel:str layer:l position:point fontsize:fs zValue:zv];
}

-(id) initLabel:(NSString *)str layer:(CCLayer *)l position:(CGPoint)point fontsize:(int)fs zValue:(int)zv{
    if(self = [super initWithString:str fontName:@"Marker Felt" fontSize:fs]){
        self.position = point;
        [l addChild:self z:zv];
    }
    return self;
}

@end
