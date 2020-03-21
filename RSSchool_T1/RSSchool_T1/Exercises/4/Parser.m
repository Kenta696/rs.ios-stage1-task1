#import "Parser.h"

@implementation Parser

// Complete the parseString function below.
- (NSArray <NSString*>*)parseString:(NSString*)string {
    NSMutableArray* array = [[NSMutableArray alloc]init];
    NSMutableDictionary* dictionary = [[NSMutableDictionary alloc]init];
    NSRange searchRange = NSMakeRange(0, string.length);
    NSRange searchRange2 = NSMakeRange(0, string.length);
    NSRange searchRange3 = NSMakeRange(0, string.length);
    while (YES) {
        NSRange range = [string rangeOfString:@")" options:0 range:searchRange];
        if (range.location!=NSNotFound) {
            NSString*text = [string substringToIndex:range.location];
            NSRange range2 = NSMakeRange(0, text.length);
            NSRange range3 = [text rangeOfString:@"(" options:NSBackwardsSearch range:range2];
            NSString * text2 = [text substringFromIndex:range3.location+1];
            [array addObject:text2];
            NSUInteger index = range.location +1;
            searchRange.location = index;
            searchRange.length = string.length - index;
            [dictionary setObject:[NSNumber numberWithUnsignedInteger:range3.location] forKey:text2];
        }else{
            break;
        }
    }
    
    while (YES) {
        NSRange range = [string rangeOfString:@"]" options:0 range:searchRange2];
        if (range.location!=NSNotFound) {
            NSString*text = [string substringToIndex:range.location];
            NSRange range2 = NSMakeRange(0, text.length);
            NSRange range3 = [text rangeOfString:@"[" options:NSBackwardsSearch range:range2];
            NSString * text2 = [text substringFromIndex:range3.location+1];
            [array addObject:text2];
            NSUInteger index = range.location +1;
            searchRange2.location = index;
            searchRange2.length = string.length - index;
            [dictionary setObject:[NSNumber numberWithUnsignedInteger:range3.location] forKey:text2];
        }else{
            break;
        }
    }
    
    while (YES) {
        NSRange range = [string rangeOfString:@">" options:0 range:searchRange3];
        if (range.location!=NSNotFound) {
            NSString*text = [string substringToIndex:range.location];
            NSRange range2 = NSMakeRange(0, text.length);
            NSRange range3 = [text rangeOfString:@"<" options:NSBackwardsSearch range:range2];
            NSString * text2 = [text substringFromIndex:range3.location+1];
            [array addObject:text2];
            NSUInteger index = range.location +1;
            searchRange3.location = index;
            searchRange3.length = string.length - index;
            [dictionary setObject:[NSNumber numberWithUnsignedInteger:range3.location] forKey:text2];
        }else{
            break;
        }
    }
    
    
    NSArray* sortedDictionary = [dictionary keysSortedByValueUsingSelector:@selector(compare:)];
    
    NSLog(@"%@",sortedDictionary);
    return sortedDictionary;
}@end
