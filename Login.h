//
//  Login.h
//  WoundCare
//
//  Created by Sangeetha on 19/03/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Login : NSManagedObject

@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSString * staffName;
@property (nonatomic, retain) NSString * userName;

@end
