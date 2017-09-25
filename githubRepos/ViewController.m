//
//  ViewController.m
//  githubRepos
//
//  Created by Jaison Bhatti on 2017-09-25.
//  Copyright © 2017 Jaison Bhatti. All rights reserved.
//

#import "ViewController.h"
#import "repoTableViewCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableVIew;

@property (nonatomic, strong) NSArray *repos;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self loadData];
}

-(NSURL*)apiURL {
    return [NSURL URLWithString:@"https://api.github.com/users/jbhatti/repos"];
}

- (void)loadData {
    //    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:self.apiURL];
    //    [request addValue:@"foo" forHTTPHeaderField:@"hello"];
    //    [request setHTTPMethod:@"POST"];
    NSURLSessionTask *task =
    [[NSURLSession sharedSession]
     dataTaskWithURL:[self apiURL]
     completionHandler:^(NSData* data, NSURLResponse* response, NSError* error) {
         
         if (error) { // 1
             //Handle the error
             NSLog(@"error: %@", error.localizedDescription);
             return;
         }
         
         NSError *jsonError = nil;
         NSArray *repos = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError]; // 2
         
         if (jsonError) { // 3
             //Handle the error
             NSLog(@"jsonError: %@", jsonError.localizedDescription);
             return;
         }
         
         // If we reached this point, we have successfully retrieved the JSON from the API
         NSMutableArray *infoRepo = [[NSMutableArray alloc] init];
         for (NSDictionary *repo in repos) { // 4
             [infoRepo addObject:repo[@"name"]];
             NSString *repoName = repo[@"name"];
             NSLog(@"repo: %@", repoName);
         }
         
         self.repos = [NSArray arrayWithArray:infoRepo];
         
         
         [[NSOperationQueue mainQueue] addOperationWithBlock:^{
             [self.tableVIew reloadData];
         }];
     }];
     

    // Always remember to start the task after creating it!
    [task resume];
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.repos.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    repoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"repoCell"];
    [cell configureWithPerson:self.repos[indexPath.row]];
    
    return cell;
}



@end
