//
//  Treatment.h
//  WoundCare
//
//  Created by Sangeetha on 19/03/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Treatment : NSManagedObject

@property (nonatomic, retain) NSString * category_id;
@property (nonatomic, retain) NSString * category_name;
@property (nonatomic, retain) NSString * category_fields;

@end
