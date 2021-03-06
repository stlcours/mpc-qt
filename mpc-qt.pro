#-------------------------------------------------
#
# Project created by QtCreator 2015-04-12T18:21:51
#
#-------------------------------------------------

QT       += core gui network widgets

QMAKE_CXXFLAGS += -Wall

TARGET = mpc-qt
TEMPLATE = app

CONFIG += c++14

unix:!macx:QT += x11extras dbus
unix:!macx:LIBS += $$QMAKE_LIBS_DYNLOAD

!win32:CONFIG += link_pkgconfig
!win32:PKGCONFIG += mpv

win32:LIBS += -L$$PWD/mpv-dev/lib/ -llibmpv -lpowrprof
win32:INCLUDEPATH += $$PWD/mpv-dev/include
win32:DEPENDPATH += $$PWD/mpv-dev

TRANSLATIONS += translations/mpc-qt_it.ts

isEmpty(QMAKE_LUPDATE) {
    win32:QMAKE_LUPDATE = $$[QT_INSTALL_BINS]\\lupdate.exe
    else:QMAKE_LUPDATE = $$[QT_INSTALL_BINS]/lupdate
    unix {
        !exists($$QMAKE_LUPDATE) { QMAKE_LUPDATE = lupdate-qt5 }
    } else {
        !exists($$QMAKE_LUPDATE) { QMAKE_LUPDATE = lupdate }
    }
}

isEmpty(QMAKE_LRELEASE) {
    win32:QMAKE_LRELEASE = $$[QT_INSTALL_BINS]\\lrelease.exe
    else:QMAKE_LRELEASE = $$[QT_INSTALL_BINS]/lrelease
    unix {
        !exists($$QMAKE_LRELEASE) { QMAKE_LRELEASE = lrelease-qt5 }
    } else {
        !exists($$QMAKE_LRELEASE) { QMAKE_LRELEASE = lrelease }
    }
}

lupdate.input = TRANSLATIONS
lupdate.output = translations/%{QMAKE_FILE_IN}.ts
lupdate.commands = $${QMAKE_LUPDATE} -locations none -no-ui-lines $$_PRO_FILE_
lupdate.CONFIG += no_link target_predeps
lrelease.input = TRANSLATIONS
lrelease.output = resources/translations/${QMAKE_FILE_BASE}.qm
lrelease.commands = $$QMAKE_LRELEASE ${QMAKE_FILE_IN} -qm resources/translations/${QMAKE_FILE_BASE}.qm
lrelease.CONFIG += no_link target_predeps
QMAKE_EXTRA_COMPILERS += lupdate lrelease

unix {
    isEmpty(PREFIX) {
        PREFIX=/usr/local
    }
    DEFINES += MPCQT_PREFIX=\\\"$$PREFIX\\\"

    target.path = $$PREFIX/bin

    docs.files = DOCS/ipc.md
    docs.path = $$PREFIX/share/doc/mpc-qt/

    translations.files = resources/translations
    translations.path = $$PREFIX/share/mpc-qt/

    shortcut.files = mpc-qt.desktop
    shortcut.path = $$PREFIX/share/applications/

    logo.files = images/icon/mpc-qt.svg
    logo.path = $$PREFIX/share/icons/hicolor/scalable/apps/

    scripts.files = external/mpv-stats/stats.lua
    scripts.path = $$PREFIX/share/mpc-qt/scripts/

    INSTALLS += target docs shortcut logo scripts translations
}

unix:!macx:SOURCES += platform/unix_qscreensaver.cpp \
                      ipcmpris.cpp
unix:!macx:HEADERS += platform/unix_qscreensaver.h \
                      ipcmpris.h

win32:SOURCES += platform/win_qscreensaver.cpp
win32:HEADERS += platform/win_qscreensaver.h

macx:SOURCES += platform/mac_qscreensaver.cpp
macx:HEADERS += platform/mac_qscreensaver.h

SOURCES += main.cpp\
    mpvwidget.cpp \
    mainwindow.cpp \
    qdrawnslider.cpp \
    playlist.cpp \
    qdrawnplaylist.cpp \
    manager.cpp \
    helpers.cpp \
    playlistwindow.cpp \
    storage.cpp \
    settingswindow.cpp \
    qactioneditor.cpp \
    qdrawnstatus.cpp \
    ipcjson.cpp \
    openfiledialog.cpp \
    platform/qabstractscreensaver.cpp \
    qscreensaver.cpp \
    propertieswindow.cpp \
    platform/unify.cpp \
    paletteeditor.cpp \
    favoriteswindow.cpp

HEADERS  += \
    mpvwidget.h \
    mainwindow.h \
    qdrawnslider.h \
    playlist.h \
    qdrawnplaylist.h \
    manager.h \
    main.h \
    helpers.h \
    playlistwindow.h \
    storage.h \
    settingswindow.h \
    qactioneditor.h \
    qdrawnstatus.h \
    ipcjson.h \
    openfiledialog.h \
    platform/qabstractscreensaver.h \
    qscreensaver.h \
    propertieswindow.h \
    platform/unify.h \
    paletteeditor.h \
    favoriteswindow.h

FORMS    += \
    mainwindow.ui \
    playlistwindow.ui \
    settingswindow.ui \
    openfiledialog.ui \
    propertieswindow.ui \
    favoriteswindow.ui

RESOURCES += \
    res.qrc

OTHER_FILES += \
    LICENSE \
    README.md \
    generate-localinstall-desktop.py \
    DOCS/codebase2.svg \
    DOCS/codebase.svg

DISTFILES += \
    DOCS/ipc.md \
    mpc-qt.desktop
