//
//  repoTableViewCell.m
//  githubRepos
//
//  Created by Jaison Bhatti on 2017-09-25.
//  Copyright © 2017 Jaison Bhatti. All rights reserved.
//

#import "repoTableViewCell.h"

@implementation repoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureWithPerson:(NSString *)name
{
    self.nameLabel.text = name;
}

@end
