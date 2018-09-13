//
//  ViewController.m
//  NewsFeed
//
//  Created by Hiên on 9/11/18.
//  Copyright © 2018 Hiên. All rights reserved.
//

#import "ViewController.h"
#import "NewsFeedViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"go to news feed");
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    NewsFeedViewController *vc = [[NewsFeedViewController alloc] initWithCollectionViewLayout:layout];
    
    [self.navigationController pushViewController:vc animated:YES];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goToButton:(UIButton *)sender {
    NSLog(@"go to news feed");
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.minimumLineSpacing = 5;
    layout.minimumInteritemSpacing = 0;
    
    NewsFeedViewController *vc = [[NewsFeedViewController alloc] initWithCollectionViewLayout:layout];
    
    [self.navigationController pushViewController:vc animated:YES];
}


@end
