#import "../include/VCDLibrary.h"

// Node class for doubly linked list
@interface CVCDNode : NSObject

@property (nonatomic, strong) VCD *vcd;
@property (nonatomic, strong) CVCDNode *next;
@property (nonatomic, strong) CVCDNode *prev;

- (instancetype)initWithVCD:(VCD *)vcd;

@end

// Private interface for VCDLibrary implementation
@interface CVCDLibrary : VCDLibrary

@property (nonatomic, strong) CVCDNode *head;
@property (nonatomic, strong) CVCDNode *tail;
@property (nonatomic, assign) NSUInteger count;

// Regular init method
- (instancetype)init;

@end
