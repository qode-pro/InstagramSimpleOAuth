//Copyright (c) 2014 Ryan Baumbach <rbaumbach.github@gmail.com>
//
//Permission is hereby granted, free of charge, to any person obtaining
//a copy of this software and associated documentation files (the "Software"),
//to deal in the Software without restriction, including
//without limitation the rights to use, copy, modify, merge, publish,
//distribute, sublicense, and/or sell copies of the Software, and to
//permit persons to whom the Software is furnished to do so, subject to
//the following conditions:
//
//The above copyright notice and this permission notice shall be
//included in all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
//MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
//LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
//OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
//WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import "InstagramUser.h"


NSString *const InstagramIDKey = @"id";
NSString *const InstagramUsernameKey = @"username";
NSString *const InstagramFullNameKey = @"full_name";
NSString *const InstagramProfilePictureKey = @"profile_picture";
NSString *const InstagramBioKey = @"bio";
NSString *const InstagramWebsiteKey = @"website";
NSString *const InstagramMediaCounterKey = @"counts.media";
NSString *const InstagramFollowsCounterKey = @"counts.follows";
NSString *const InstagramFollowersCounterKey = @"counts.followed_by";

@implementation InstagramUser

#pragma mark - Init Methods

- (instancetype)initWithDictionary:(NSDictionary *)userResponse
{
    self = [super init];
    if (self) {
        if (userResponse) {
            self.userID = userResponse[InstagramIDKey];
            self.username = userResponse[InstagramUsernameKey];
            self.fullName = userResponse[InstagramFullNameKey];
            self.profilePictureURL = [NSURL URLWithString:userResponse[InstagramProfilePictureKey]];
            
            self.bio = userResponse[InstagramBioKey];
            if (userResponse[InstagramWebsiteKey]) {
                self.website = [NSURL URLWithString:userResponse[InstagramWebsiteKey]];
            }
            self.mediaCounter = [userResponse valueForKeyPath:InstagramMediaCounterKey];
            self.followsCounter = [userResponse valueForKeyPath:InstagramFollowsCounterKey];
            self.followersCounter = [userResponse valueForKeyPath:InstagramFollowersCounterKey];
        }
    }
    return self;
}

- (instancetype)init
{
    return [self initWithDictionary:nil];
}
@end
