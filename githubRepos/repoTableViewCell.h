//
//  repoTableViewCell.h
//  githubRepos
//
//  Created by Jaison Bhatti on 2017-09-25.
//  Copyright © 2017 Jaison Bhatti. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface repoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

- (void)configureWithPerson:(NSString*)name;

@end
