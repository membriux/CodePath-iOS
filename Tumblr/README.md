# Lab 1 & 2 - *Tumblr*

**Tumblr** is a photo browsing app using the [The Tumblr API](https://www.tumblr.com/docs/en/api/v2#posts).

Time spent: **2 + 2** hours spent in total

## User Stories

The following **required** user stories are complete:

Lab 1
- [x] User can scroll through a feed of images returned from the Tumblr API (5pts)

Lab 2
- [x] User can tab an image to view a larger image in a detail view (5pts)

The following **stretch** user stories are implemented:

Lab 1
- [ ] User sees an alert when there's a networking error (+1pt)
- [ ] While poster is being fetched, user see's a placeholder image (+1pt)
- [ ] User sees image transition for images coming from network, not when it is loaded from cache (+1pt)
- [ ] Customize the selection effect of the cell (+1pt)

Lab 2
- [x] Add Avatar and Publish Dates (+2pt)
- [ ] Zoomable Photo View (+2pt)
- [ ] Infinite Scrolling (+2pt)


The following **additional** user stories are implemented:

- [x] Users can click on the photo and be taken to another view showing the single picture.
- [x] Users can see the date and time when the image was uploaded to tumblr

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1.I had trouble installing alamofire because there were many different versions and xcode has updated. 
2. The images weren't loading completely. The cells would have the height of a spaghetti but once I started scrolling the images would adjust the height. This issue occurred due to the settings of "content mode" of UIIMageView

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://github.com/membriux/iOSCodePath/blob/tumblr/Tumblr/walkthrough.gif' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app.

## License

    Copyright [2018] [Guillermo Sanchez]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
