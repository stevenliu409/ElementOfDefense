//
//  soldier.m
//  Element Of Defense
//
//  Created by Steven Liu on 2013-05-02.
//
//

#import "soldier.h"

@implementation soldier
@synthesize dead;

+(id) makeSoldier:(int)type{
    return [[self alloc] initSoldier:type];
}


-(id) initSoldier:(int)type{
    
    if(self = [super init]){
        if(type == 0){
            
        }
        
        
    }
    
    return self;
    
}


-(void) updateSoldier:(ccTime *)ct{
    
}



@end
