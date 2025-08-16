#import "VCDLibraryImpl.h"

@implementation VCD

- (instancetype)initWithName:(NSString *)name
                 releaseYear:(NSInteger)releaseYear
                    category:(VCDCategory)category
                    language:(VCDLanguage)language
                       price:(double)price {
    self = [super init];
    if (self) {
        _name = [name copy];
        _releaseYear = releaseYear;
        _category = category;
        _language = language;
        _price = price;
    }
    return self;
}

- (void)printDetails {
    NSString *categoryString;
    switch (self.category) {
        case VCDCategoryDrama:
            categoryString = @"Drama";
            break;
        case VCDCategoryComedy:
            categoryString = @"Comedy";
            break;
        case VCDCategoryRomance:
            categoryString = @"Romance";
            break;
        case VCDCategoryAction:
            categoryString = @"Action";
            break;
        case VCDCategoryThriller:
            categoryString = @"Thriller";
            break;
        case VCDCategoryHorror:
            categoryString = @"Horror";
            break;
    }
    
    NSString *languageString = (self.language == VCDLanguageHindi) ? @"Hindi" : @"English";
    
    NSLog(@"VCD Details:");
    NSLog(@"Name: %@", self.name);
    NSLog(@"Release Year: %ld", (long)self.releaseYear);
    NSLog(@"Category: %@", categoryString);
    NSLog(@"Language: %@", languageString);
    NSLog(@"Price: $%.2f", self.price);
    NSLog(@"------------------------");
}

@end

@implementation CVCDNode

- (instancetype)initWithVCD:(VCD *)vcd {
    self = [super init];
    if (self) {
        _vcd = vcd;
        _next = nil;
        _prev = nil;
    }
    return self;
}

@end

@implementation CVCDLibrary

#pragma mark - Initialization

- (instancetype)init {
    self = [super init];
    if (self) {
        _head = nil;
        _tail = nil;
        _count = 0;
    }
    return self;
}

#pragma mark - Library Operations

- (void)addVCD:(VCD *)vcd {
    CVCDNode *newNode = [[CVCDNode alloc] initWithVCD:vcd];
    
    if (!_head) {
        _head = newNode;
        _tail = newNode;
    } else {
        CVCDNode *current = _head;
        
        while (current && [current.vcd.name compare:vcd.name] < 0) {
            current = current.next;
        }
        
        if (!current) {
            newNode.prev = _tail;
            _tail.next = newNode;
            _tail = newNode;
        } else if (current == _head) {
            newNode.next = _head;
            _head.prev = newNode;
            _head = newNode;
        } else {
            newNode.next = current;
            newNode.prev = current.prev;
            current.prev.next = newNode;
            current.prev = newNode;
        }
    }
    
    _count++;
}

- (BOOL)removeVCDWithName:(NSString *)name {
    CVCDNode *current = _head;
    
    while (current) {
        if ([current.vcd.name isEqualToString:name]) {
            if (current.prev) {
                current.prev.next = current.next;
            } else {
                _head = current.next;
            }
            
            if (current.next) {
                current.next.prev = current.prev;
            } else {
                _tail = current.prev;
            }
            
            _count--;
            return YES;
        }
        current = current.next;
    }
    
    return NO;
}

#pragma mark - Display Operations

- (void)displayVCDsWithPrefix:(NSString *)prefix {
    NSLog(@"\nDisplaying VCDs with prefix '%@':", prefix);
    NSLog(@"================================");
    
    CVCDNode *current = _head;
    BOOL found = NO;
    
    while (current) {
        if ([current.vcd.name hasPrefix:prefix]) {
            [current.vcd printDetails];
            found = YES;
        }
        current = current.next;
    }
    
    if (!found) {
        NSLog(@"No VCDs found with prefix '%@'", prefix);
    }
}

- (void)displayVCDsWithCategory:(VCDCategory)category {
    NSString *categoryString;
    switch (category) {
        case VCDCategoryDrama: categoryString = @"Drama"; break;
        case VCDCategoryComedy: categoryString = @"Comedy"; break;
        case VCDCategoryRomance: categoryString = @"Romance"; break;
        case VCDCategoryAction: categoryString = @"Action"; break;
        case VCDCategoryThriller: categoryString = @"Thriller"; break;
        case VCDCategoryHorror: categoryString = @"Horror"; break;
    }
    
    NSLog(@"\nDisplaying VCDs in category '%@':", categoryString);
    NSLog(@"================================");
    
    CVCDNode *current = _head;
    BOOL found = NO;
    
    while (current) {
        if (current.vcd.category == category) {
            [current.vcd printDetails];
            found = YES;
        }
        current = current.next;
    }
    
    if (!found) {
        NSLog(@"No VCDs found in category '%@'", categoryString);
    }
}

- (void)displayAllVCDsInOrder:(BOOL)ascending {
    NSLog(@"\nDisplaying all VCDs in %@ order:", ascending ? @"ascending" : @"descending");
    NSLog(@"================================");
    
    if (_count == 0) {
        NSLog(@"No VCDs in the library");
        return;
    }
    
    if (ascending) {
        CVCDNode *current = _head;
        while (current) {
            [current.vcd printDetails];
            current = current.next;
        }
    } else {
        CVCDNode *current = _tail;
        while (current) {
            [current.vcd printDetails];
            current = current.prev;
        }
    }
}

@end
