# Gnulium
A Graphical Ui for managing scripts and ideas!

####
![](https://img.shields.io/badge/Language-C++-yellow.svg) ![](https://img.shields.io/badge/Licence-GPL--3.0-blue.svg)

## Preview
!["gnulium"](http://uupload.ir/files/mzr7_screenshot_from_2017-12-30_15-54-10.png "gnulium")


### Introduction

'Arc Menu is a Gnome shell extension designed to replace the standard menu found in Gnome 3 this application menu extension has  some added benefits over the standard menu found in Gnome 3, these include the long awaited search functionality as well as quick access to files on your system and also the current logged in user along with quick access to the software centre and system settings and other features which can be accessed from the settings menu.


## Features
1. You Can Search TvShows According to Their Name.
2. Show TvShow Name, Genres, Rating, Status, Premiered, Next Episode and so many Cool Features.
3. You Can Add TvShows To Your Favourite List.
4. See List Of Actors And Crews.
5. There Is SubMenu For Show Details Of Seasons In Seasons/Episodes part.
6. And Finally See The Schedule Box.(Enter a Desired Time And See Episode List.)


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

    `git, qt5-base, qt5-quickcontrols2, qt5-charts, jcal-git`
    
3. clone the repo:

    `git clone https://github.com/LinArcX/Gnulium/`
    
4. go to cloned directory and make the project with qmake build tools:

    `cd Gnulium`
    
    `qmake`
    
    `make`
    
5. run the application:
    `./gnulium`

##
### Dependencies

__Please note:__ For Arc-Menu to work properly, your GNOME Desktop must have the
following dependencies installed.

|On Arch based systems||On Ubuntu/Debian based systems||
|-----|:-----:|-----|:-----:|
|git|![](https://github.com/LinxGem33/Neon/blob/master/artwork/done.svg.png?raw=true)|git|![](https://github.com/LinxGem33/Neon/blob/master/artwork/done.svg.png?raw=true)
|gnome-tweak-tool|![](https://github.com/LinxGem33/Neon/blob/master/artwork/done.svg.png?raw=true)|gnome-tweak-tool|![](https://github.com/LinxGem33/Neon/blob/master/artwork/done.svg.png?raw=true)
|gnome-menus|![](https://github.com/LinxGem33/Neon/blob/master/artwork/done.svg.png?raw=true)
|gnome-session|![](https://github.com/LinxGem33/Neon/blob/master/artwork/done.svg.png?raw=true)


##
### What's next for Arc Menu?

My first initial priority was to get this extension stable enough to upload to extensions.gnome.org as it had to be ported to work with the gnome shell eco system, now the first stage of development is over features are now being added and I'm pleased to announce a new member of the team [lexruee](https://github.com/lexruee) and now a lead developer in the design and development of this extension hopefully more features are planned for future development and a lot has already been implemented.
##
### Development Roadmap !

If your interested to see the current development cycle of Arc menu or the current status of a particular feature in development then head over to the new Development Roadmap page which will give you a idea of what’s planned or what’s currently being developed by the Arc menu team the link is below.

Please see the: [Development Roadmap Page](https://github.com/LinxGem33/Arc-Menu/issues/42)


##
### Wiki Guide

If you have any issues with regard to Arc menu and your unsure of a certain feature or just want to know more about Arc menu, then the Arc menu wiki guide is a good place to start.

Please refer to the Arc menu [Wiki Guide](https://github.com/LinxGem33/Arc-Menu/wiki) 

##
### Bugs

Bugs should be reported [here](https://github.com/LinArcX/Gnulium/issues) on the Github issues page.

##
### Conduct

There are basic rules of conduct that should be followed at all times by everyone participating in the discussions.  While this is generally a relaxed environment, please remember the following:

- Do not insult, harass, or demean anyone.
- Do not intentionally multi-post an issue.
- Do not use ALL CAPS when creating an issue report.
- Do not repeatedly update an open issue remarking that the issue persists.

**Remember**: Just because the issue you reported was reported here does not mean that it is an issue with Arc menu. As well, should your issue not be resolved immediately, it does not mean that a resolution is not being researched or tested. Patience is always appreciated.
##

Please refer to the Wiki section for a guide on: [Reporting Bugs](https://github.com/LinxGem33/Arc-Menu/wiki/Reporting-Bug's)

Please note that without any information about your system, the Arc Menu Team can only speculate what the problem is.
So, please provide us information about your GNU/Linux distribution and the GNOME Shell version. Otherwise, we are not able to try and solve your problem.

##
### License & Terms ![](https://github.com/LinxGem33/IP-Finder/blob/master/screens/Copyleft-16.png?raw=true)

Arc Menu is available under the terms of the GPL-2.0 license See [`COPYING`](https://github.com/LinxGem33/Arc-Menu/blob/master/COPYING) for details.
##

### Credits

This extension leverages some of the work from [Zorin OS menu](https://zorinos.com/).

Additional credits: This extension also leverages the work from [Giovanni Campagna ](https://git.gnome.org//browse/gnome-shell-extensions) gnome Application Menu used in [Gnome 3](https://www.gnome.org/) to allow the menu to be embedded in the Gnome main panel.
##

### Project Developers

#### @[LinxGem33](https://github.com/LinxGem33) - **Founder** - **Developer** - Digital Art Designer
> Hi I'm LinxGem33 aka Andy and the founder of Arc menu, my role on the project is to manage and plan the technical and digital production and distribution of the Arc menu software, as you can imagine I’m a open source and Linux software enthusiast as well as a digital art designer and GTK3 theme developer,I also like to contribute to other projects where i can.  

#### @[lexruee](https://github.com/lexruee) - **Lead Project Developer** - UI/UX Designer
> Hi I’m lexruee aka Alex and the lead software developer and UI/UX designer on the Arc menu project, my role on the project is to manage and develop the code base and software integrity of Arc menu I’m also responsible for the UI/UX design and implimentation of the Arc menu software, I'm also a passionate programmer, hacker, and tinkerer. But I'm also a single Board Computer and GNU/Linux enthusiast. Besides all that I also like mountainbiking and reading. 

##
### Technical Advisors


##

### Pull Requests

#### Thanks to the following people for contributing via pull requests:

- @[fishears](https://github.com/fishears/Arc-Menu) (1) compiling the schema's (2) Added suspend button and re-order buttons
- @[JasonLG1979](https://github.com/JasonLG1979)  (1) menu style fix, (2) Asynchronously set an icon and handle errors
- @[itmitica](https://github.com/itmitica) (1) icon symbolic

#### Bug Fixes:

- @[JasonLG1979](https://github.com/JasonLG1979) (1) menu style fix
- @[lexruee](https://github.com/lexruee/Arc-Menu) (1) correctly restore the Activities button
##
#### Please refer to the Wiki section for a [Translation Guide](https://github.com/LinxGem33/Arc-Menu/wiki/Translation-Guide)

|Contributor|Language|Translated|Contributor|Language|Translated|
|:-----|:-----|:-----:|:-----|:-----|:-----:|
|@[h3r0n](https://github.com/h3r0n)|Italian|![](https://github.com/LinxGem33/Neon/blob/master/artwork/done.svg.png?raw=true)|@[megasyl](https://github.com/megasyl) > updated by @[16NoCo](https://github.com/16NoCo)|French|![](https://github.com/LinxGem33/Neon/blob/master/artwork/done.svg.png?raw=true)
|@[pkomur](https://github.com/pkomur) > updated by @[Ixoos](https://github.com/Ixoos)|Polish|![](https://github.com/LinxGem33/Neon/blob/master/artwork/done.svg.png?raw=true)|@[madaramost](https://github.com/madaramost)|Arabic|![](https://github.com/LinxGem33/Neon/blob/master/artwork/done.svg.png?raw=true)
|@[danielstuart14](https://github.com/danielstuart14)|Brazilian portuguese|![](https://github.com/LinxGem33/Neon/blob/master/artwork/done.svg.png?raw=true)||Chinese|
|@[zakkak](https://github.com/zakkak)|Greek|![](https://github.com/LinxGem33/Neon/blob/master/artwork/done.svg.png?raw=true)|@[mjtullio](https://github.com/mjtullio)|Spanish|![](https://github.com/LinxGem33/Neon/blob/master/artwork/done.svg.png?raw=true)
|@[mrprobot](https://github.com/mrprobot)|German|![](https://github.com/LinxGem33/Neon/blob/master/artwork/done.svg.png?raw=true)|@[saisasidhar](https://github.com/saisasidhar)|Hindi|![](https://github.com/LinxGem33/Neon/blob/master/artwork/done.svg.png?raw=true)
||Portuguese|||Bengali||
|@[elsieholmes](https://github.com/elsieholmes)|Russian|![](https://github.com/LinxGem33/Neon/blob/master/artwork/done.svg.png?raw=true)||Japanese||
||Swedish|||Dutch||
|@[neynefes](https://github.com/neynefes)|Turkish|![](https://github.com/LinxGem33/Neon/blob/master/artwork/done.svg.png?raw=true)||Javanese||
|@[elsieholmes](https://github.com/elsieholmes)|Ukrainian|![](https://github.com/LinxGem33/Neon/blob/master/artwork/done.svg.png?raw=true)|@[PSSGCSim](https://github.com/PSSGCSim)|Czech|![](https://github.com/LinxGem33/Neon/blob/master/artwork/done.svg.png?raw=true)
|@[ipanamski](https://github.com/ipanamski)|Bulgarian|![](https://github.com/LinxGem33/Neon/blob/master/artwork/done.svg.png?raw=true)|@[muhfajar](https://github.com/muhfajar) > updated by @[emhaye](https://github.com/emhaye)|Indonesian|![](https://github.com/LinxGem33/Neon/blob/master/artwork/done.svg.png?raw=true)
|@[artnay](https://github.com/artnay)|Finnish|![](https://github.com/LinxGem33/Neon/blob/master/artwork/done.svg.png?raw=true)|@[Lrss](https://github.com/Lrss)|Danish|![](https://github.com/LinxGem33/Neon/blob/master/artwork/done.svg.png?raw=true)|

