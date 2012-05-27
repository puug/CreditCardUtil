//
//  CreditCardUtil.m
//  CreditCardUtil
//
//  Created by Ryan Murfitt on 27/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CreditCardUtil.h"

@interface CreditCardUtil (PrivateMethods)
+ (CreditCardType)determineTypeFromCardNumber:(NSString *)creditCardNumber;
+ (CreditCardType)validateCreditCard:(CreditCardType)creditCardType forCardNumber:(NSString*)creditCardNumber;
@end

@implementation CreditCardUtil

+ (CreditCardType)validCardTypeFromCardNumber:(NSString *)creditCardNumber {
    CreditCardType unvalidatedType = [self determineTypeFromCardNumber:creditCardNumber];
    return [self validateCreditCard:unvalidatedType forCardNumber:creditCardNumber];
}

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

+ (CreditCardType)validateCreditCard:(CreditCardType)creditCardType forCardNumber:(NSString*)creditCardNumber {
    CreditCardType result = Unknown;
    int cardNumberLength =  [creditCardNumber length];
    switch (creditCardType) {
        case Amex:
            result = (cardNumberLength == 15) ? Amex : Unknown;
            break;
        case Diners:
            result = (cardNumberLength == 14) ? Diners : Unknown;
            break;
        case MasterCard:
            result = (cardNumberLength == 16) ? MasterCard : Unknown;
            break;
        case Visa:
            result = (cardNumberLength == 13 || cardNumberLength == 16) ? Visa : Unknown;
            break;
        default:
            break;
    }
    return result;
}



@end
