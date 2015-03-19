//
//  ReviewAssessment.h
//  WoundCare
//
//  Created by Sangeetha on 19/03/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ReviewAssessment : NSManagedObject

@property (nonatomic, retain) NSString * category_fields;
@property (nonatomic, retain) NSString * category_id;
@property (nonatomic, retain) NSString * category_name;
@property (nonatomic, retain) NSString * category_score;
@property (nonatomic, retain) NSString * category_subfield;

@end
