//
//  PatientDetails.h
//  WoundCare
//
//  Created by Sangeetha on 19/03/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface PatientDetails : NSManagedObject

@property (nonatomic, retain) NSString * admit_dt;
@property (nonatomic, retain) NSString * admit_md;
@property (nonatomic, retain) NSString * age;
@property (nonatomic, retain) NSString * chart_status;
@property (nonatomic, retain) NSString * entry_number;
@property (nonatomic, retain) NSString * facility_name;
@property (nonatomic, retain) NSString * mmi;
@property (nonatomic, retain) NSString * mrn;
@property (nonatomic, retain) NSString * patient_name;
@property (nonatomic, retain) NSString * room_number;
@property (nonatomic, retain) NSString * sex;
@property (nonatomic, retain) NSString * staff_name;
@property (nonatomic, retain) NSString * staff_userid;
@property (nonatomic, retain) NSString * submit_dt;
@property (nonatomic, retain) NSString * consult_type;
@property (nonatomic, retain) NSString * dob;

@end
