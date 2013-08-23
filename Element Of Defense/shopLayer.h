//
//  shopLayer.h
//  ZombieDefense
//
//  Created by Hua Dong on 13-08-23.
//
//

#import "CCLayer.h"
#import "CCScene.h"
@interface shopLayer : CCLayer{
    CGSize size;
}

+(CCScene*) scene;
-(void) goBack:(id) sender;

@end
