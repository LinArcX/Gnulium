For install gnulium in other distro, you have two options:
1. Install corresponding dependencies in ubuntu package center

|ubuntu packages|
| --- |
|[git](https://packages.debian.org/stretch/git)
|qt5-default|![](https://github.com/LinxGem33/Neon/blob/master/artwork/done.svg.png?raw=true)
|qml-module-qtquick-controls2|![](https://github.com/LinxGem33/Neon/blob/master/artwork/done.svg.png?raw=true)
|qml-module-qtquick-controls|![](https://github.com/LinxGem33/Neon/blob/master/artwork/done.svg.png?raw=true)
|qml-module-qtcharts|![](https://github.com/LinxGem33/Neon/blob/master/artwork/done.svg.png?raw=true)
|jcal|![](https://github.com/LinxGem33/Neon/blob/master/artwork/done.svg.png?raw=true)
|qml|![](https://github.com/LinxGem33/Neon/blob/master/artwork/done.svg.png?raw=true)
|qt5-qmake|![](https://github.com/LinxGem33/Neon/blob/master/artwork/done.svg.png?raw=true)
|qtbase5-dev|![](https://github.com/LinxGem33/Neon/blob/master/artwork/done.svg.png?raw=true)
|qt5-style-plugins|![](https://github.com/LinxGem33/Neon/blob/master/artwork/done.svg.png?raw=true)

2. Search all .so files and install their libraries. please search these _.so_ files in package centers like:
[debian package center](https://www.debian.org/distrib/packages)
or
[ubuntu package center](https://packages.ubuntu.com/)

| .so file | ubuntu package |
| --- | --- |
| glinux-vdso.so.1 | --- |
| libQt5QuickControls2.so.5 | [libqt5quickcontrols2-5](https://packages.ubuntu.com/artful/libqt5quickcontrols2-5) |
| libQt5Quick.so.5 | [libqt5quick5](https://packages.ubuntu.com/artful/libqt5quick5) |
| libQt5Charts.so.5 | [libqt5charts5](https://packages.ubuntu.com/artful/libqt5charts5) |
| libQt5Widgets.so.5 | [libqt5widgets5](https://packages.ubuntu.com/artful/libqt5widgets5) |
| libQt5Gui.so.5 | [libqt5gui5](https://packages.ubuntu.com/artful/libqt5gui5) |
| libQt5Qml.so.5 | [libqt5qml5](https://packages.ubuntu.com/artful/libqt5qml5) |
| libQt5Network.so.5 | [libqt5network5](https://packages.ubuntu.com/artful/libqt5network5) |
| libQt5Core.so.5 | [libqt5core5a](https://packages.ubuntu.com/artful/libqt5core5a) |
| libGL.so.1 | [libgl1](https://packages.ubuntu.com/artful/libgl1) |
| libpthread.so.0 | [libc6](https://packages.ubuntu.com/artful/libc6) |
| libstdc++.so.6 | [lib32stdc++6](https://packages.ubuntu.com/artful/lib32stdc%2B%2B6) |
| libm.so.6 | [libc6](https://packages.ubuntu.com/artful/libc6) |
| libgcc_s.so.1 |  |
| libc.so.6 | [libc6](https://packages.ubuntu.com/artful/libc6) |
| libQt5QuickTemplates2.so.5 | [libqt5quicktemplates2-5](https://packages.ubuntu.com/artful/libqt5quicktemplates2-5) |
| libpng16.so.16 | [libpng16-16](https://packages.ubuntu.com/artful/libpng16-16) |
| libharfbuzz.so.0 | [libharfbuzz0b](https://packages.ubuntu.com/artful/libharfbuzz0b) |
| libz.so.1 | [zlib1g](https://packages.ubuntu.com/artful/zlib1g) |
| libssl.so.1.1 | [libssl1.0.0](https://packages.ubuntu.com/artful/libssl1.0.0) |
| libcrypto.so.1.1 | [libssl1.0.0](https://packages.ubuntu.com/artful/libssl1.0.0) |
| libsystemd.so.0 | [libsystemd0](https://packages.ubuntu.com/artful/libsystemd0) |
| libicui18n.so.60 | [libicu-dev](https://packages.ubuntu.com/artful/libicu-dev) |
| libicuuc.so.60 | [libicu-dev](https://packages.ubuntu.com/artful/libicu-dev) |
| libpcre2-16.so.0 | [libpcre2-16-0](https://packages.ubuntu.com/artful/libpcre2-16-0) |
| libdouble-conversion.so.1 | [libdouble-conversion1](https://packages.ubuntu.com/artful/libdouble-conversion1) |
| libdl.so.2 | [libc6](https://packages.ubuntu.com/artful/libc6) |
| libglib-2.0.so.0 | [libglib2.0-0](https://packages.ubuntu.com/artful/libglib2.0-0) |
| /lib64/ld-linux-x86-64.so.2 | [libc6](https://packages.ubuntu.com/artful/libc6) |
| libGLX.so.0 | [libglx0](https://packages.ubuntu.com/artful/libglx0) |
| libX11.so.6 |  |
| libXext.so.6 |  |
| libGLdispatch.so.0 |  |
| libfreetype.so.6 |  |
| libgraphite2.so.3 |  |
| libgcrypt.so.20 |  |
| librt.so.1 |  |
| liblzma.so.5 |  |
| liblz4.so.1 |  |
| libicudata.so.60 |  |
| libpcre.so.1 |  |
| libxcb.so.1 |  |
| libbz2.so.1.0 |  |
| libgpg-error.so.0 |  |
| libXau.so.6 |  |
| libXdmcp.so.6 |  |