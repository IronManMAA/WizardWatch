//
//  Wizard.h
//  WizardWatch
//
//  Created by Marco Almeida on 11/30/16.
//  Copyright © 2016 THE IRON YARD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Wizard : NSObject


@property (nonatomic) NSString *name;
@property (nonatomic) NSString *house;
+ (Wizard *) aWizardWithDictionary:(NSDictionary *)aWizardDictionary;

@end
