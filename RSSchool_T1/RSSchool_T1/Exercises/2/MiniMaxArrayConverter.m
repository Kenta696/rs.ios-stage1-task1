#import "MiniMaxArrayConverter.h"

@implementation MiniMaxArrayConverter

// Complete the convertFromArray function below.
- (NSArray<NSNumber*>*)convertFromArray:(NSArray<NSNumber*>*)array {
    NSMutableArray* newArray = [[NSMutableArray alloc]init];
    NSMutableArray* convertArray = [NSMutableArray arrayWithArray:array];
    for (NSUInteger i = 0;i<[convertArray count]; i++) {
        NSNumber* value = [convertArray objectAtIndex:i];
        NSNumber* zeroValue = [NSNumber numberWithInt:0];
        [convertArray replaceObjectAtIndex:i withObject:zeroValue];
        NSNumber* summ = [convertArray valueForKeyPath:@"@sum.self"];
        [newArray addObject:summ];
        [convertArray replaceObjectAtIndex:i withObject:value];
        
    }
    NSArray*sortedArray = [newArray sortedArrayUsingSelector:@selector(compare:)];
    
    NSNumber*maxValue = [sortedArray lastObject];
    NSNumber*minValue = [sortedArray firstObject];
    NSArray* results = [NSArray arrayWithObjects:minValue,maxValue,nil];
    
    return results;
}
@end
