#import "BillCounter.h"

@implementation BillCounter

// Complete the following fuction
- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {
    NSMutableArray* array =[NSMutableArray arrayWithArray:bill];
    [array removeObjectAtIndex:index];
    NSNumber* sumForAnn = [array valueForKeyPath:@"@sum.self"];
    NSInteger  annSum = [sumForAnn integerValue]/2;
    NSInteger givenSum = [sum integerValue];
    if ( annSum == givenSum) {
        return  @"Bon Appetit";
    } else {
        return [NSString stringWithFormat:@"%ld", givenSum - annSum];
    }
}
@end
