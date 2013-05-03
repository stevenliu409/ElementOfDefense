//
//  snipersoldier.m
//  Element Of Defense
//
//  Created by Steven Liu on 2013-05-02.
//
//

#import "snipersoldier.h"

@implementation snipersoldier

+(id) makeSniper{
    return [[self alloc] initSniper];
}

-(id) initSniper{
    if(self = [super initWithFile:@"soilder2.png"]){
        health = 6;
        damage = 7;
        range = 10;
        freq = 2;
    }
    return self;
}

-(void) updateSoldier:(ccTime *)ct{

}


@end
