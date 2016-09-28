TEMPLATE = app

QT += qml quick widgets

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

include(deployment.pri)

INCLUDEPATH += engine

HEADERS += \
    GuiBridge.h \
    engine\engine.h \
    engine\Project.h \
    engine\Modules.h


SOURCES += main.cpp \
    GuiBridge.cpp    \
    engine\Project.cpp \
    engine\Modules.cpp \


#----- kuFramework ----------------------
INCLUDEPATH += ../libs/kuFramework/


HEADERS += \
        ../libs/kuFramework/float2.h	\
        ../libs/kuFramework/float3.h	\
        ../libs/kuFramework/int2.h	    \
        ../libs/kuFramework/kuArgs.h	\
        ../libs/kuFramework/kuConstants.h	\
        #kuImages_of.h	\
        ../libs/kuFramework/kuIniSettings.h	\
        ../libs/kuFramework/kuLog.h		\
        ../libs/kuFramework/kuMain.h	\
        ../libs/kuFramework/kuMath.h	\
        ../libs/kuFramework/kuPoint.h	\
        ../libs/kuFramework/kuRaster.h	\
        ../libs/kuFramework/kuRasterProc.h	\
        ../libs/kuFramework/kuRect.h	\
        ../libs/kuFramework/kuUtils.h	\
        ../libs/kuFramework/kuValueMap.h	\
        ../libs/kuFramework/kuXmlSettings.h


SOURCES += \
        ../libs/kuFramework/float2.cpp	\
        ../libs/kuFramework/kuArgs.cpp	\
        #kuImages_of.cpp	\
        ../libs/kuFramework/kuIniSettings.cpp	\
        ../libs/kuFramework/kuLog.cpp	\
        ../libs/kuFramework/kuMath.cpp	\
        ../libs/kuFramework/kuPoint.cpp	\
        ../libs/kuFramework/kuRaster.cpp	\
        ../libs/kuFramework/kuRasterProc.cpp	\
        ../libs/kuFramework/kuRect.cpp	\
        ../libs/kuFramework/kuUtils.cpp	\
        ../libs/kuFramework/kuValueMap.cpp	\
        ../libs/kuFramework/kuXmlSettings.cpp

#--------- tinyxml ----------------------
INCLUDEPATH += ../libs/kuFramework/libs/tinyxml

HEADERS += ../libs/kuFramework/libs/tinyxml/tinyxml.h
SOURCES += \
        ../libs/kuFramework/libs/tinyxml/tinyxml.cpp \
        ../libs/kuFramework/libs/tinyxml/tinyxmlerror.cpp \
        ../libs/kuFramework/libs/tinyxml/tinyxmlparser.cpp

