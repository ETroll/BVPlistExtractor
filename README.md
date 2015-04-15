# BVPlistExtractor

BVPlistExtractor exports BVExtractPlist(), a function that extracts a plist
that has been embedded in the \__TEXT __info_plist section of a binary file.
It's known to support i386 Mach-O binaries, x86_64 Mach-O binaries, and
fat/universal binaries containing at least one of i386 Mach-O and x86_64 Mach-O.

# Usage

Copy BVPlistExtractor.{h,m} into your project. Then:

    #import "BVPlistExtractor.h"

    NSError *error = nil;
    id plist = BVExtractPlist(url, &error);
    if (plist) {
        if ([plist isKindOfClass:[NSDictionary class]]) {
            NSDictionary *plistDict = plist;
            …
        }
    }
    else NSLog(@"Error whilst extracting plist: %@", error);

(at the moment error reporting is experimental)

# Licence

BVPlistExtractor is released under the MIT licence.
