//
//  CreditCardUtil.m
//  CreditCardUtil
//
//  Created by Ryan Murfitt on 27/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CreditCardUtil.h"

@interface CreditCardUtil (PrivateMethods)
@end

@implementation CreditCardUtil

+ (CreditCardType)determineTypeFromCardNumber:(NSString *)creditCardNumber {
    int oneDigitPrefix = [[creditCardNumber substringToIndex:1] intValue];
    if (oneDigitPrefix == 4) {
        return Visa;
    }
    
    int twoDigitPrefix = [[creditCardNumber substringToIndex:2] intValue];
    switch (twoDigitPrefix) {
        case 34:
        case 37:
            return Amex;
        case 36:
            return Diners;
        case 51:
        case 52:
        case 53:
        case 54:
        case 55:
            return MasterCard;
        default:
            break;
    }
    
    int threeDigitPrefix = [[creditCardNumber substringToIndex:3] intValue];
    if (threeDigitPrefix >= 300 && threeDigitPrefix <= 305) {
        return Diners;
    }
    
    return Unknown;
}

+ (Boolean)validateCreditCard:(CreditCardType)creditCardType forCardLength:(int)cardNumberLength {
    Boolean result = NO;
    switch (creditCardType) {
        case Amex:
            result = (cardNumberLength == 15);
            break;
        case Diners:
            result = (cardNumberLength == 14);
            break;
        case MasterCard:
            result = (cardNumberLength == 16);
            break;
        case Visa:
            result = (cardNumberLength == 13 || cardNumberLength == 16);
            break;
        default:
            break;
    }
    return result;
}

+ (NSString*)codeForCardType:(CreditCardType)creditCardType {
    switch (creditCardType) {
        case Amex:
            return @"AMEX";
        case Diners:
            return @"DIN";
        case MasterCard:
            return @"MC";
        case Visa:
            return @"VSA";
        default:
            return nil;
    }
}

@end
