#import <Foundation/Foundation.h>

// VCD Categories
typedef NS_ENUM(NSInteger, VCDCategory) {
    VCDCategoryDrama,
    VCDCategoryComedy,
    VCDCategoryRomance,
    VCDCategoryAction,
    VCDCategoryThriller,
    VCDCategoryHorror
};

// VCD Languages
typedef NS_ENUM(NSInteger, VCDLanguage) {
    VCDLanguageHindi,
    VCDLanguageEnglish
};

// VCD Model class
@interface VCD : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger releaseYear;
@property (nonatomic, assign) VCDCategory category;
@property (nonatomic, assign) VCDLanguage language;
@property (nonatomic, assign) double price;

- (instancetype)initWithName:(NSString *)name
                 releaseYear:(NSInteger)releaseYear
                    category:(VCDCategory)category
                    language:(VCDLanguage)language
                       price:(double)price;

// Method to print VCD details
- (void)printDetails;

@end

// VCD Library main interface
@interface VCDLibrary : NSObject

// Library operations
- (void)addVCD:(VCD *)vcd;
- (BOOL)removeVCDWithName:(NSString *)name;

// Display operations
- (void)displayVCDsWithPrefix:(NSString *)prefix;
- (void)displayVCDsWithCategory:(VCDCategory)category;
- (void)displayAllVCDsInOrder:(BOOL)ascending;

@end
