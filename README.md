# Gnulium ![](https://img.shields.io/badge/Language-C++%20Qml-pink.svg) ![](https://img.shields.io/badge/Licence-GPL--3.0-blue.svg)
A Graphical Ui for managing scripts and ideas!

## Preview
!["gnulium"](http://uupload.ir/files/mzr7_screenshot_from_2017-12-30_15-54-10.png "gnulium")


### Introduction

Gnulium is a Gnome shell extension designed to replace the standard menu found in Gnome 3 this application menu extension has  some added benefits over the standard menu found in Gnome 3, these include the long awaited search functionality as well as quick access to files on your system and also the current logged in user along with quick access to the software centre and system settings and other features which can be accessed from the settings menu.


## Features
1. You Can Search TvShows According to Their Name.
2. Show TvShow Name, Genres, Rating, Status, Premiered, Next Episode and so many Cool Features.
3. You Can Add TvShows To Your Favourite List.
4. See List Of Actors And Crews.
5. There Is SubMenu For Show Details Of Seasons In Seasons/Episodes part.
6. And Finally See The Schedule Box.(Enter a Desired Time And See Episode List.)


##
### What's next for Arc Menu?

My first initial priority was to get this extension stable enough to upload to extensions.gnome.org as it had to be ported to work with the gnome shell eco system, now the first stage of development is over features are now being added and I'm pleased to announce a new member of the team [lexruee](https://github.com/lexruee) and now a lead developer in the design and development of this extension hopefully more features are planned for future development and a lot has already been implemented.


##
|About Gnulium|Histogram|
|:-----:|:-----:|
|![](http://uupload.ir/files/7ezv_screenshot_from_2017-12-30_15-54-17.png?raw=true)|![](http://uupload.ir/files/u8jq_screenshot_from_2017-12-30_15-54-24.png?raw=true)|
|Click image to enlarge|Click image to enlarge|

## Installation

### Arch
1. if you have arch, life is easy:). just go to AUR: 

    `packer -S gnulium`

### Build From Source
2. in other linux distro install these dependencies first:

|On Arch based systems||On Ubuntu/Debian based systems||
|-----|:-----:|-----|:-----:|
|git|![](https://github.com/LinxGem33/Neon/blob/master/artwork/done.svg.png?raw=true)|git|![](https://github.com/LinxGem33/Neon/blob/master/artwork/done.svg.png?raw=true)
|qt5-base|![](https://github.com/LinxGem33/Neon/blob/master/artwork/done.svg.png?raw=true)|?|![](https://github.com/LinxGem33/Neon/blob/master/artwork/done.svg.png?raw=true)
|qt5-quickcontrols2|![](https://github.com/LinxGem33/Neon/blob/master/artwork/done.svg.png?raw=true)|?|![](https://github.com/LinxGem33/Neon/blob/master/artwork/done.svg.png?raw=true)
|qt5-charts|![](https://github.com/LinxGem33/Neon/blob/master/artwork/done.svg.png?raw=true)|?|![](https://github.com/LinxGem33/Neon/blob/master/artwork/done.svg.png?raw=true)
|jcal-git|![](https://github.com/LinxGem33/Neon/blob/master/artwork/done.svg.png?raw=true)|?|![](https://github.com/LinxGem33/Neon/blob/master/artwork/done.svg.png?raw=true)

    `git, qt5-base, qt5-quickcontrols2, qt5-charts, jcal-git`
    
3. clone the repo:

    `git clone https://github.com/LinArcX/Gnulium/`
    
4. go to cloned directory and make the project with qmake build tools:

    `cd Gnulium`
    
    `qmake`
    
    `make`
    
5. run the application:
    `./gnulium`


## Contributing
1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D


## Bugs
Bugs should be reported [here](https://github.com/LinArcX/Gnulium/issues) on the Github issues page.


## VisitUs
[bbs.archusers.ir](http://bbs.archusers.ir/index.php)


## Credits
LinArcX
Github Repo:[https://github.com/LinArcX](https://github.com/LinArcX)
E-Mail:linarcx@gmail.com


## Special Thanks
[esasharahi](https://github.com/esasharahi)


## License
Gnulium is available under the terms of the [`GPL-3.0`](https://github.com/LinArcX/Gnulium/blob/master/LICENSE) license.
