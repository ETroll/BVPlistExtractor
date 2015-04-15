//
//  main.m
//  PlistExtractor
//

#import <Foundation/Foundation.h>
#import "BVPlistExtractor.h"

static void test(NSString *path) {
    @autoreleasepool {
        NSURL *url = [NSURL fileURLWithPath:path];
        NSError *error = nil;
        id plist = BVExtractPlist(url, &error);
        NSLog(@"\n%@\n\n%@\n\n%@\n-----\n", url, plist, error);
    }
}

int main (int argc, const char * argv[])
{
    @autoreleasepool {
        test(@"/tmp/i386.out");
        test(@"/tmp/x86_64.out");
        test(@"/tmp/fat.out");
    }
    return 0;
}