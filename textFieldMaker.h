//
//  textFieldMaker.h
//  ZombieDefense
//
//  Created by Hua Dong on 13-08-25.
//
//

#import "CCNode.h"

@interface textFieldMaker : CCNode

+(UITextField*) getTextField:(int) x y:(int) y height:(int) h width:(int) w gate:(id) g;


@end
