//
//  snipersoldier.h
//  Element Of Defense
//
//  Created by Steven Liu on 2013-05-02.
//
//

#import "soldier.h"
#import "HelloWorldLayer.h"
@interface snipersoldier : soldier{

}
+(id) makeSniper:(HelloWorldLayer*)_gameLayer waypoint:(NSMutableArray*)mywaypoints;
-(id) initSniper:(HelloWorldLayer*)_gameLayer waypoint:(NSMutableArray*)mywaypoints;

@end
