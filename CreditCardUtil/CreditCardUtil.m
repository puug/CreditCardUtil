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
    if (creditCardNumber && creditCardNumber.length > 0) {
        int oneDigitPrefix = [[creditCardNumber substringToIndex:1] intValue];
        if (oneDigitPrefix == 4) {
            return Visa;
        }
        
        if (creditCardNumber.length > 1) {
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
            
            if (creditCardNumber.length > 2) {
                int threeDigitPrefix = [[creditCardNumber substringToIndex:3] intValue];
                if (threeDigitPrefix >= 300 && threeDigitPrefix <= 305) {
                    return Diners;
                }
            }
        }
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

+ (NSString*)maskCard:(NSString*)cardNumber withSymbol:(NSString*)symbol {
    NSMutableString *maskedCard = [[NSMutableString alloc] init];
    for (int i = 0; i < cardNumber.length; i++) {
        if (i < cardNumber.length - 4) {
            [maskedCard appendString:symbol];
        } else {
            [maskedCard appendString:[NSString stringWithFormat:@"%C", [cardNumber characterAtIndex:i]]];
        }
    }
    return maskedCard;
}

+ (NSString*)formatCard:(NSString*)cardNumber withSymbol:(NSString*)symbol {
    NSMutableString *formattedCard = [[NSMutableString alloc] init];
    for (int i = cardNumber.length-1; i >= 0; i--) {
        if (i > 0 && i < (cardNumber.length-1) && (i + cardNumber.length)%4 == 0) {
            //Prepend a dash
            [formattedCard insertString:symbol atIndex:0];
        }
        [formattedCard insertString:[NSString stringWithFormat:@"%C", [cardNumber characterAtIndex:i]] atIndex:0];
    }
    return formattedCard;
}

@end
