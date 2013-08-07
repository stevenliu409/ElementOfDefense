//
//  mgsoldier.h
//  Element Of Defense
//
//  Created by Steven Liu on 2013-05-02.
//
//

#import "soldier.h"
#import "HelloWorldLayer.h"

@interface mgsoldier : soldier

+(id) makeMg:(HelloWorldLayer*)_gameLayer waypoint:(NSMutableArray*)mywaypoints;
-(id) initMg:(HelloWorldLayer*)_gameLayer waypoint:(NSMutableArray*)mywaypoints;

@end
