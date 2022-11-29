#import <UIKit/UIKit.h>
#import <PhotosUI/PHPicker.h>

@interface ViewController : UIViewController <PHPickerViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *loadButton;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
