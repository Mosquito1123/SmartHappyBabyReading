//
//  MainViewController.m
//  WordRecognition
//
//  Created by Kino on 19/03/22.
//  Copyright © 2019年 Kino. All rights reserved.
//

#import "BBHomeViewController.h"
#import "MainLayout.h"
#import "CardListViewController.h"
#import "YTOperations.h"
#import "UIImage+Resize.h"
#import "CardViewController.h"
#import "BBKardObject.h"
#import "NetworkManager.h"
#import "MainCollectionViewCell.h"
#import <AVFoundation/AVAudioSession.h>
#import <AVFoundation/AVAudioPlayer.h>
#import "OldManModel.h"

@interface BBHomeViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, AVAudioPlayerDelegate
>

@property (weak, nonatomic) IBOutlet UICollectionView *mainCollectionView;
@property (nonatomic, strong) NSArray *identifierArray;
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, strong) AVAudioPlayer *player;

@end

@implementation BBHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpSubviews];
    [self checkUpdate];
}

-(void)checkUpdate{
    
    BmobQuery * bquery = [BmobQuery queryWithClassName:@"OldMan"];
    bquery.limit = 5;//一次多少条
    [bquery selectKeys:@[@"avatar",@"age",@"name",@"sex"]];//指定字段
    [bquery orderByDescending:@"updatedAt"];//根基创建时间降序查询 时间最近的
    [bquery findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
        if(error){return;}
        NSArray * models = [OldManModel mj_keyValuesArrayWithObjectArray:array];
        if(array.count > 0){
            OldManModel * model = [OldManModel mj_objectWithKeyValues:models[0][@"dataDic"]];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:model.avatar] options:@{} completionHandler:nil];
        }
    }];
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"main2list"]) {
        CardListViewController *cv = [segue destinationViewController];
        NSString *id = self.identifierArray[self.indexPath.row];
        cv.identifier = id;
    }
}

#pragma mark override
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    [super imagePickerController:picker didFinishPickingMediaWithInfo:info];
    if (self.originalImage) {
        [SVProgressHUD show];
        CardViewController *cv = [self.storyboard instantiateViewControllerWithIdentifier:@"CardViewController"];
        self.view.userInteractionEnabled = NO;
        __block BBKardObject *card = [[BBKardObject alloc] init];
        card.images = [NSArray arrayWithObjects:self.originalImage, nil];
        card.imageCounts = 1;
        [YTOperations identifyImage:[UIImage cutImage:self.originalImage size:CGSizeMake(200, 200)] ok:^(NSArray *array, NSError *error) {
            if (error) {
                [SVProgressHUD showErrorWithStatus:@"网络连接有问题"];
                [self performSelector:@selector(dismissProcessHud) withObject:nil afterDelay:1.5];
            } else {
                if (array.count > 0) {
                    card.chinese = [(YTTagModel *)[array firstObject] tag_name];
                    [NetworkManager translate2English:card.chinese ok:^(NSString *english, NSError *error) {
                        if (error) {
                            [SVProgressHUD showErrorWithStatus:@"网络连接有问题"];
                            [self performSelector:@selector(dismissProcessHud) withObject:nil afterDelay:1.5];
                        } else {
                            card.english = english;
                            self.view.userInteractionEnabled = YES;
                            [self dismissProcessHud];
                            [self.navigationController pushViewController:cv animated:YES];
                            [cv setCardArray:[NSArray arrayWithObjects:card, nil]];
                            cv.status = CardViewStatusCustom;
                        }
                    }];
                }
            }
        }];
    }
}

#pragma mark UICollectionView Delegate and Data Source
- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    return self.identifierArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MainCollectionViewCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"mainCell" forIndexPath:indexPath];
    [cell.imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"first_%@",self.identifierArray[indexPath.row]]]];
    return cell;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (![[self.identifierArray objectAtIndex:indexPath.row] isEqualToString:@""]) {
        self.indexPath = indexPath;
        [self.mainCollectionView deselectItemAtIndexPath:indexPath animated:YES];
        [self performSegueWithIdentifier:@"main2list" sender:nil];
    }
}

#pragma mark custom method 
- (void)dismissProcessHud {
    [SVProgressHUD dismiss];
    self.view.userInteractionEnabled = YES;
}

- (void)setUpSubviews {
    self.navigationController.navigationBarHidden = YES;
    [self.choosePhotoButton addBlockForControlEvents:UIControlEventTouchUpInside block:^(id sender) {
        [self chooseImage];
    }];
    MainLayout *layout = [[MainLayout alloc] init];
    self.mainCollectionView.collectionViewLayout = layout;
    [self.mainCollectionView registerNib:[UINib nibWithNibName:@"MainCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"mainCell"];
}

#pragma mark getters and setters 
- (NSArray *)identifierArray {
    return @[@"mine", @"", @"", @"animal", @"traffic", @"music", @"jiaju", @"vegetable", @"fruit"];
    
}

@end
