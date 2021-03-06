//
//  DCUser.m
//  duracity
//
//  Created by RIEUX Alexandre on 17/02/2014.
//  Copyright (c) 2014 RIEUX Alexandre. All rights reserved.
//

#import "DCUser.h"

@implementation DCUser

static DCUser* _currentUser = nil;

+(DCUser*)currentUser{
    static dispatch_once_t once;
    static id currentUser;
    dispatch_once(&once, ^{
        currentUser = [[self alloc] init];
    });
    return currentUser;
}

- (void)fillWithDictionary:(NSDictionary *)dico
{
        
        self.iduser = [dico objectForKey:@"id"];
        self.name = [dico objectForKey:@"name"];

}

- (NSDictionary *) getUserForUpdateLoc{
    
    NSDictionary *userSetting = [NSDictionary dictionaryWithObjectsAndKeys:self.idTraject,@"idTraject",self.longitude,@"longitude",self.latitude,@"latitude",self.vitesse,@"vitesse", nil];
    
    return userSetting;
}


@end