//
//  loadingLayer.h
//  Element Of Defense
//
//  Created by Hua Dong on 13-05-03.
//
//

#import "CCLayer.h"
#import "CCScene.h"
@interface loadingLayer : CCScene{
    int targetSence;
    int fromSence;
    NSUserDefaults* prefs;
}

+(id) loadSence:(NSString* )dir from:(int) f to:(int) t;
-(id) initWithSence:(NSString* )dir from:(int) f to:(int) t;
-(void) updateItemList;

@end
