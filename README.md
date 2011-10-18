# BVPlistExtractor

BVPlistExtractor exports BVExtractPlist(), a function that extracts a plist
that has been embedded in the \__TEXT __info_plist section of a binary file.
It's known to support i386 binaries, x86_64 binaries, and fat/universal
binaries containing at least one of i386 and x86_64.

# Usage

Copy BVPlistExtractor.{h,m} into your project. Then:

    #import "BVPlistExtractor.h"

    id plist = BVExtractPlist(url, NULL);

(at the moment there's no error reporting)

# Licence

BVPlistExtractor is released under the MIT licence.
