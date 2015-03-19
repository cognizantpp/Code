//
//  CoreDataHelper.m
//  SampleDB
//
//  Created by Sangeetha on 16/03/15.
//  Copyright (c) 2015 Sangeetha. All rights reserved.
//

#import "CoreDataHelper.h"
#import "Login.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>

@interface CoreDataHelper ()


@end

@implementation CoreDataHelper

+(instancetype)sharedInstance{
    static CoreDataHelper *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
    
}
-(void)insertIntoContextForEntity:(NSString *)login withUsername:(NSString *)username andPassword:(NSString *)password
{
    //NSEntityDescription *entity = [NSEntityDescription entityForName:@"Login" inManagedObjectContext:[self managedObject]];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Login" inManagedObjectContext:self.managedObjectContext];
    
    Login *loginEntity = [[Login alloc]initWithEntity:entity insertIntoManagedObjectContext:self.managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"Login"];
    // Specify criteria for filtering which objects to fetch
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"userName BEGINSWITH[cd] ", username];
    [fetchRequest setPredicate:predicate];
    // Specify how the fetched objects should be sorted
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"userName"
                                                                   ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"Error");
    }
    loginEntity = (Login *)[fetchedObjects firstObject];
    
    
}
-(BOOL)validateUserId:(NSString *)userid andpassword:(NSString *)password{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Login" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    // Specify criteria for filtering which objects to fetch
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K like %@", @"userName",userid];
    [fetchRequest setPredicate:predicate];
    // Specify how the fetched objects should be sorted
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"userName"
                                                                   ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"can't fetch");
    }
    else{
        for (Login *theUser in fetchedObjects) {
            NSLog(@"user %@",theUser.userName);
            if([theUser.userName isEqualToString:userid]){
                if([theUser.password isEqualToString:password]){
                    return YES;
                }
            }
        }
    }
    return NO;
}

/*+(NSManagedObjectContext *)managedObject
{
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    return appDelegate.managedObjectContext;
    
}*/
@end
