#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)onLoadTap:(id)sender {
    PHPickerConfiguration *configuration = [[PHPickerConfiguration alloc] init];
    // 同時選択数
    configuration.selectionLimit = 1;
    // 選択できるメディアの種類
    configuration.filter = PHPickerFilter.imagesFilter;
    PHPickerViewController *pickerViewController = [[PHPickerViewController alloc] initWithConfiguration:configuration];
    pickerViewController.delegate = self;
    [self presentViewController:pickerViewController animated:TRUE completion:nil];
}

- (void)picker:(PHPickerViewController *)picker didFinishPicking:(NSArray<PHPickerResult *> *)results {
    [picker dismissViewControllerAnimated:TRUE completion:nil];
    if (results.count == 1) {
        PHPickerResult *result = results[0];
        NSItemProvider *itemProvider = result.itemProvider;
        if (itemProvider != nil) {
            if([itemProvider canLoadObjectOfClass:[UIImage class]]) {
                [itemProvider loadObjectOfClass:[UIImage class] completionHandler:^(id <NSItemProviderReading> image, NSError *error) {
                    if ([image isKindOfClass:[UIImage class]] ) {
                        dispatch_async(dispatch_get_main_queue(), ^{
                            [_imageView setImage:image];
                        });
                    }
                }];
            }
        }
    } else {
        // 一個以上取得できたら知らん
    }
}

@end
