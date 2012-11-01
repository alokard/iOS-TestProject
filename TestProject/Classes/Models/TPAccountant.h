
typedef enum {
    TPAccountantTypeSalaries = 0,
    TPAccountantTypeItems
} TPAccountantType;

#import "_TPAccountant.h"

@interface TPAccountant : _TPAccountant {}

// Custom logic goes here.
@property (nonatomic, getter=type, setter=setType:) TPAccountantType type;


@end
