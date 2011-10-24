NSData *BV_FUNCTION_NAME`'(char *addr, long bytes_left, char *segname, char *sectname, NSError **error) {
    NSData *data = nil;
    char *base_macho_header_addr = addr;
    struct `mach_header'BV_STRUCT_SUFFIX *mh = NULL;
    struct load_command *lc = NULL;
    struct `segment_command'BV_STRUCT_SUFFIX *sc = NULL;
    struct `section'BV_STRUCT_SUFFIX *sect = NULL;

    long bytes_left_from_macho_header = bytes_left;

    if (bytes_left < sizeof(struct `mach_header'BV_STRUCT_SUFFIX)) return nil;
    
    mh = (struct `mach_header'BV_STRUCT_SUFFIX *)addr;
    addr += sizeof(struct `mach_header'BV_STRUCT_SUFFIX);
    bytes_left -= sizeof(struct `mach_header'BV_STRUCT_SUFFIX);
    
    for (int icmd = 0; icmd < mh->ncmds; icmd++) {
        if (bytes_left < 0) goto END_FUNCTION;
        
        lc = (struct load_command *)addr;
        
        if (lc->cmdsize == 0) continue;
        bytes_left -= lc->cmdsize;
        if (bytes_left < 0) goto END_FUNCTION;
        
        if (lc->cmd != LC_SEGMENT) {
            addr += lc->cmdsize;
            continue;
        }
        
        // It's a segment
        sc = (struct `segment_command'BV_STRUCT_SUFFIX *)addr;
        
        if (strcmp(segname, sc->segname) != 0 || sc->nsects == 0) {
            addr += lc->cmdsize;
            continue;
        }
        
        // It's the segment we want and it has at least one section
        // Section data follows segment data
        addr += sizeof(struct `segment_command'BV_STRUCT_SUFFIX);

        for (int isect = 0; isect < sc->nsects; isect++) {
            bytes_left -= sizeof(struct `section'BV_STRUCT_SUFFIX);
            if (bytes_left < 0) goto END_FUNCTION;

            sect = (struct `section'BV_STRUCT_SUFFIX *)addr;
            addr += sizeof(struct `section'BV_STRUCT_SUFFIX);
            
            if (strcmp(sectname, sect->sectname) != 0) continue;
            
            // It's the section we want
            if (bytes_left_from_macho_header < (sect->offset + sect->size)) goto END_FUNCTION;
            data = [NSData dataWithBytes:(base_macho_header_addr + sect->offset) length:sect->size];
            goto END_FUNCTION;
        }
    }
    
END_FUNCTION:
    return data;
}