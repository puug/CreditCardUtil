//
//  CreditCardUtilTests.m
//  CreditCardUtilTests
//
//  Created by Ryan Murfitt on 27/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CreditCardUtilTests.h"
#import "CreditCardUtil.h"

@implementation CreditCardUtilTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testNil
{
    CreditCardType actual = [CreditCardUtil determineTypeFromCardNumber:nil];
    STAssertEquals(actual, Unknown, nil);
}

- (void)testEmpty
{
    CreditCardType actual = [CreditCardUtil determineTypeFromCardNumber:@""];
    STAssertEquals(actual, Unknown, nil);
}

- (void)testMastercard51
{
    CreditCardType actual = [CreditCardUtil determineTypeFromCardNumber:@"5123456789012346"];
    STAssertEquals(actual, MasterCard, nil);
}

- (void)testMastercard52
{
    CreditCardType actual = [CreditCardUtil determineTypeFromCardNumber:@"5223456789012346"];
    STAssertEquals(actual, MasterCard, nil);
}

- (void)testMastercard53
{
    CreditCardType actual = [CreditCardUtil determineTypeFromCardNumber:@"5323456789012346"];
    STAssertEquals(actual, MasterCard, nil);
}

- (void)testMastercard54
{
    CreditCardType actual = [CreditCardUtil determineTypeFromCardNumber:@"5423456789012346"];
    STAssertEquals(actual, MasterCard, nil);
}

- (void)testMastercard55
{
    CreditCardType actual = [CreditCardUtil determineTypeFromCardNumber:@"5523456789012346"];
    STAssertEquals(actual, MasterCard, nil);
}

- (void)testVisa
{
    CreditCardType actual = [CreditCardUtil determineTypeFromCardNumber:@"4123456789012"];
    STAssertEquals(actual, Visa, nil);
}

- (void)testVisaPartialOneChar
{
    CreditCardType actual = [CreditCardUtil determineTypeFromCardNumber:@"4"];
    STAssertEquals(actual, Visa, nil);
}

- (void)testAmex34
{
    CreditCardType actual = [CreditCardUtil determineTypeFromCardNumber:@"341234567890123"];
    STAssertEquals(actual, Amex, nil);
}

- (void)testAmex37
{
    CreditCardType actual = [CreditCardUtil determineTypeFromCardNumber:@"371234567890123"];
    STAssertEquals(actual, Amex, nil);
}

- (void)testDiners300
{
    CreditCardType actual = [CreditCardUtil determineTypeFromCardNumber:@"30012345678901"];
    STAssertEquals(actual, Diners, nil);
}

- (void)testDiners301
{
    CreditCardType actual = [CreditCardUtil determineTypeFromCardNumber:@"30112345678901"];
    STAssertEquals(actual, Diners, nil);
}

- (void)testDiners302
{
    CreditCardType actual = [CreditCardUtil determineTypeFromCardNumber:@"30212345678901"];
    STAssertEquals(actual, Diners, nil);
}

- (void)testDiners303
{
    CreditCardType actual = [CreditCardUtil determineTypeFromCardNumber:@"30312345678901"];
    STAssertEquals(actual, Diners, nil);
}

- (void)testDiners304
{
    CreditCardType actual = [CreditCardUtil determineTypeFromCardNumber:@"30412345678901"];
    STAssertEquals(actual, Diners, nil);
}

- (void)testDiners305
{
    CreditCardType actual = [CreditCardUtil determineTypeFromCardNumber:@"30512345678901"];
    STAssertEquals(actual, Diners, nil);
}

- (void)testDiners36
{
    CreditCardType actual = [CreditCardUtil determineTypeFromCardNumber:@"36012345678901"];
    STAssertEquals(actual, Diners, nil);
}

- (void)testMC {
    CreditCardType actual = [CreditCardUtil cardTypeForCode:@"MC"];
    STAssertEquals(actual, MasterCard, nil);
}

- (void)testAMEX {
    CreditCardType actual = [CreditCardUtil cardTypeForCode:@"AMEX"];
    STAssertEquals(actual, Amex, nil);
}

- (void)testDIN {
    CreditCardType actual = [CreditCardUtil cardTypeForCode:@"DIN"];
    STAssertEquals(actual, Diners, nil);
}

- (void)testVSA {
    CreditCardType actual = [CreditCardUtil cardTypeForCode:@"VSA"];
    STAssertEquals(actual, Visa, nil);
}

- (void)testUnkown {
    CreditCardType actual = [CreditCardUtil cardTypeForCode:@"Unknown"];
    STAssertEquals(actual, Unknown, nil);
}

- (void)testRandom {
    CreditCardType actual = [CreditCardUtil cardTypeForCode:@"aegvehrt"];
    STAssertEquals(actual, Unknown, nil);
}

- (void)testMaskCard {
    NSString* actual = [CreditCardUtil maskCard:@"1234567890" withSymbol:@"x"];
    STAssertTrue([actual isEqualToString:@"xxxxxx7890"], nil);
}

- (void)testMaskCardMaskSizeSameAsCardLength {
    NSString* actual = [CreditCardUtil maskCard:@"1234" withSymbol:@"x"];
    STAssertTrue([actual isEqualToString:@"1234"], nil);
}

- (void)testFormatCard {
    NSString* actual = [CreditCardUtil formatCard:@"1234567890" withSymbol:@"-"];
    STAssertTrue([actual isEqualToString:@"12-3456-7890"], actual);
}

- (void)testFormatCard8Length {
    NSString* actual = [CreditCardUtil formatCard:@"12345678" withSymbol:@"-"];
    STAssertTrue([actual isEqualToString:@"1234-5678"], nil);
}

- (void)testFormatAndMaskCard8Length {
    NSString* actual = [CreditCardUtil formatCard:[CreditCardUtil maskCard:@"5123456789012346" withSymbol:@"x"] 
                                       withSymbol:@"-"];
    STAssertTrue([actual isEqualToString:@"xxxx-xxxx-xxxx-2346"], nil);
}


@end
