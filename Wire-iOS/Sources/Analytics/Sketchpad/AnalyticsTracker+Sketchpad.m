// 
// Wire
// Copyright (C) 2016 Wire Swiss GmbH
// 
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License
// along with this program. If not, see http://www.gnu.org/licenses/.
// 


#import "AnalyticsTracker+Sketchpad.h"

#import "AnalyticsTracker+Navigation.h"

static NSString *const AnalyticsTrackerNavigationSketchpad = @"sketchpad";


@implementation AnalyticsTracker (Sketchpad)

/// User entered the sketchpad
- (void)tagNavigationViewEnteredSketchpad
{
    [self tagNavigationViewEntered:AnalyticsTrackerNavigationSketchpad];
}

/// User opened, but canceled the sketchpad sending
- (void)tagNavigationViewSkippedSketchpad
{
    [self tagNavigationViewSkipped:AnalyticsTrackerNavigationSketchpad];
}

/// User did sketch an image and uploaded the image
- (void)tagSketchpadSent
{
    NSString *safeContext = self.context == nil ? @"": self.context;
    NSDictionary *attributes = @{ AnalyticsEventTypeMessageKeyState: @"sent",
                                  AnalyticsEventTypeMessageKeyKind: @"sketch",
                                  @"context": safeContext,
                                  AnalyticsEventTypeMessageKeySource: @"user"};
    
    [self tagEvent:AnalyticsEventTypeMessage attributes:attributes];
}

@end
