typedef enum {
    TPEmployeeTypeRegular = 0,
    TPEmployeeTypeAccountant,
    TPEmployeeTypeDirector
} TPEmployeeType;

#import "_TPBaseEmployeeModel.h"

@interface TPBaseEmployeeModel : _TPBaseEmployeeModel {}

+ (id)createEmployeeWithName:(NSString *)aName;

+ (NSMutableArray *)allObjects;

// Custom logic goes here.
@end
