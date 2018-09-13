//
//  NewsFeedViewController.m
//  NewsFeed
//
//  Created by Hiên on 9/11/18.
//  Copyright © 2018 Hiên. All rights reserved.
//

#import "NewsFeedViewController.h"
#import <ComponentKit/ComponentKit.h>
#import "NewsFeedComponent.h"
#import "FeedContext.h"
#import "Feed.h"

@interface NewsFeedViewController () <CKComponentProvider, UICollectionViewDelegateFlowLayout>
@property (nonatomic) CKCollectionViewDataSource *dataSource;
@end

@implementation NewsFeedViewController

- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout {
    if (self = [super initWithCollectionViewLayout:layout]) {
        self.title = @"News Feed";
        self.collectionView.backgroundColor = [UIColor colorWithWhite:0.95f alpha:1.0f];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSSet<NSString *> *imageNames = [[NSSet alloc] initWithObjects:@"g-0", @"g-1", @"g-2", @"g-3", @"g-4", nil];
 
    self.collectionView.delegate = self;
    FeedContext *context = [[FeedContext alloc] initWithImageNames:imageNames];
    
    // Size configuration
    CKComponentFlexibleSizeRangeProvider *sizeRangeProvider = [CKComponentFlexibleSizeRangeProvider providerWithFlexibility:CKComponentSizeRangeFlexibleHeight];
    const CKSizeRange sizeRange = [sizeRangeProvider sizeRangeForBoundingSize:self.collectionView.bounds.size];
    CKDataSourceConfiguration *configuration = [[CKDataSourceConfiguration alloc] initWithComponentProvider:[self class] context:context sizeRange:sizeRange];
    
    // Create data source
    _dataSource = [[CKCollectionViewDataSource alloc] initWithCollectionView:self.collectionView supplementaryViewDataSource:nil configuration:configuration];
    
    CKDataSourceChangeset *initialChangeset = [[[CKDataSourceChangesetBuilder transactionalComponentDataSourceChangeset] withInsertedSections:[NSIndexSet indexSetWithIndex:0]] build];
    [_dataSource applyChangeset:initialChangeset mode:CKUpdateModeAsynchronous userInfo:nil];
    
    
    // Initial data    
    NSMutableDictionary<NSIndexPath *, Feed *> *items = [[NSMutableDictionary alloc] init];
    NSArray<NSString *> *users = [NSArray arrayWithObjects:
                                  @"Rylai Crestfal",
                                  @"Lina Inverse",
                                  @"Lanaya",
                                  @"Mirana", nil];
    NSArray<NSString *> *textContents = [NSArray arrayWithObjects:
                                         @"I'll kill you and take away your soul. You can't escape from me bitch.",
                                         @"I am a beacon of knowledge blazing out across a black sea of ignorance.",
                                         @"Someone once told me I needed to face fear to get over it, and I thought well why not take a step further and cut my fear into little pieces then set my fear on fire then throw the hot ash of my fear into a lake and then poison the lake. Simple!",
                                         @"It's true, I have the soul of a poet. I just can't remember where I put it.",
                                         @"If you werent so damned dead id shoot you again.",
                                         @"Although I don't fear dying, I still would rather not.",
                                         @"I steal your life - Someone else already stole your face.",
                                         @"If you want peace, prepare for war. If you want war, also prepare for war. The lesson is, ALWAYS prepare for war.",
                                         @"They said my bark was worse then my bite........... I wonder what that means..........", nil];
    NSArray<NSString *> *imageUrls = [NSArray arrayWithObjects:
                                      @"https://avavatar.ru/images/original/3/mhesCQc0xlq7DgTp.jpg",
                                      @"https://avavatar.ru/images/original/3/USBpK8A24j9LwMDQ.jpg",
                                      @"https://avavatar.ru/images/original/2/m5fCD2RDI09iAOwQ.jpg",
                                      @"https://avavatar.ru/images/original/2/CcQarP4G8ErNPL0g.jpg",
                                      @"https://avavatar.ru/images/original/2/haQXzvSe1RtWg3sU.jpg", nil];
    NSInteger numOfItems = 10;
    for (NSInteger i=0; i<numOfItems; i++) {
        NSString *user = [users objectAtIndex:arc4random_uniform((uint32_t)users.count)];
        NSString *content = [textContents objectAtIndex:arc4random_uniform((uint32_t)textContents.count)];
        uint32_t rand = arc4random_uniform((uint32_t)(imageUrls.count + 10));
        NSString *imageUrl = (rand < imageUrls.count) ? [imageUrls objectAtIndex:rand] : nil;
        Feed *feed = [[Feed alloc] initWithContent:content media:imageUrl user:user atTime:@"Today"];
        [items setObject:feed forKey:[NSIndexPath indexPathForRow:i inSection:0]];
    }
    
    CKDataSourceChangeset *changeset = [[[CKDataSourceChangesetBuilder transactionalComponentDataSourceChangeset] withInsertedItems:items] build];
    [_dataSource applyChangeset:changeset mode:CKUpdateModeAsynchronous userInfo:nil];
    
    
    NSLog(@"dadada");
}


#pragma mark - <CKComponentProvider>

+ (CKComponent *)componentForModel:(id<NSObject>)model context:(id<NSObject>)context {
    Feed *feed = model;
    return [NewsFeedComponent newWithFeed:model context:context];
}


#pragma mark - <UICollectionViewDelegateFlowLayout>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize size = [_dataSource sizeForItemAtIndexPath:indexPath];
    return size;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

@end
