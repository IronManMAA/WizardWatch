//
//  Wizard.m
//  WizardWatch
//
//  Created by Marco Almeida on 11/30/16.
//  Copyright © 2016 THE IRON YARD. All rights reserved.
//

#import "Wizard.h"

@implementation Wizard

+ (Wizard *) aWizardWithDictionary:(NSDictionary *)aWizardDictionary;

{
    Wizard *aWizard = nil;
    // nil means nothing which is not the same as zero
    if (aWizardDictionary)
        // if groceryItemDictionary exists do the following
    {
        aWizard = [[Wizard alloc] init];
        // allocate memory in the computer and initiolize for the anItem object
        aWizard.name = aWizardDictionary[@"name"];
        // name of the dictionary key (red) was giving the same name as de attribute name.
        aWizard.house = aWizardDictionary[@"house"];
    }
    return aWizard;
}


@end


