//
//  CreditCardUtil.h
//  CreditCardUtil
//
//  Created by Ryan Murfitt on 27/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    MasterCard,
    Amex,
    Visa,
    Diners,
    Unknown
} CreditCardType;

@interface CreditCardUtil : NSObject


/**
 Given a Credit Card number, tries to determine the card type, based on the bank card rules.
 http://en.wikipedia.org/wiki/Bank_card_number
 
 If unable to parse, returns 'Unknown'
 
 Basic implementation of the algorith at http://cuinl.tripod.com/Tips/o-1.htm
 
    CARD TYPES             PREFIX            WIDTH
    American Express       34, 37            15
    Diners Club            300 to 305, 36    14
    Carte Blanche          38                14
    Discover               6011              16
    EnRoute                2014, 2149        15
    JCB                    3                 16
    JCB                    2131, 1800        15
    Master Card            51 to 55          16
    Visa                   4                 13, 16
 */
+ (CreditCardType)determineTypeFromCardNumber:(NSString *)creditCardNumber;
+ (Boolean)validateCreditCard:(CreditCardType)creditCardType forCardLength:(int)cardNumberLength;
+ (NSString*)codeForCardType:(CreditCardType)creditCardType;
+ (CreditCardType)cardTypeForCode:(NSString*)code;
+ (NSString*)maskCard:(NSString*)cardNumber withSymbol:(NSString*)symbol;
+ (NSString*)formatCard:(NSString*)cardNumber withSymbol:(NSString*)symbol;

@end
