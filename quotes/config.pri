# Auto-generated by IDE. Any changes made by user will be lost!
BASEDIR =  $$quote($$_PRO_FILE_PWD_)

device {
    CONFIG(debug, debug|release) {
        SOURCES +=  $$quote($$BASEDIR/src/customsqldatasource.cpp) \
                 $$quote($$BASEDIR/src/main.cpp) \
                 $$quote($$BASEDIR/src/quotesapp.cpp)

        HEADERS +=  $$quote($$BASEDIR/src/customsqldatasource.h) \
                 $$quote($$BASEDIR/src/quotesapp.h)
    }

    CONFIG(release, debug|release) {
        SOURCES +=  $$quote($$BASEDIR/src/customsqldatasource.cpp) \
                 $$quote($$BASEDIR/src/main.cpp) \
                 $$quote($$BASEDIR/src/quotesapp.cpp)

        HEADERS +=  $$quote($$BASEDIR/src/customsqldatasource.h) \
                 $$quote($$BASEDIR/src/quotesapp.h)
    }
}

simulator {
    CONFIG(debug, debug|release) {
        SOURCES +=  $$quote($$BASEDIR/src/customsqldatasource.cpp) \
                 $$quote($$BASEDIR/src/main.cpp) \
                 $$quote($$BASEDIR/src/quotesapp.cpp)

        HEADERS +=  $$quote($$BASEDIR/src/customsqldatasource.h) \
                 $$quote($$BASEDIR/src/quotesapp.h)
    }
}

INCLUDEPATH +=  $$quote($$BASEDIR/src)

CONFIG += precompile_header

PRECOMPILED_HEADER =  $$quote($$BASEDIR/precompiled.h)

lupdate_inclusion {
    SOURCES +=  $$quote($$BASEDIR/../src/*.c) \
             $$quote($$BASEDIR/../src/*.c++) \
             $$quote($$BASEDIR/../src/*.cc) \
             $$quote($$BASEDIR/../src/*.cpp) \
             $$quote($$BASEDIR/../src/*.cxx) \
             $$quote($$BASEDIR/../assets/*.qml) \
             $$quote($$BASEDIR/../assets/*.js) \
             $$quote($$BASEDIR/../assets/*.qs) \
             $$quote($$BASEDIR/../assets/720x1280/*.qml) \
             $$quote($$BASEDIR/../assets/720x1280/*.js) \
             $$quote($$BASEDIR/../assets/720x1280/*.qs) \
             $$quote($$BASEDIR/../assets/720x1280/images/*.qml) \
             $$quote($$BASEDIR/../assets/720x1280/images/*.js) \
             $$quote($$BASEDIR/../assets/720x1280/images/*.qs) \
             $$quote($$BASEDIR/../assets/QuotePage/*.qml) \
             $$quote($$BASEDIR/../assets/QuotePage/*.js) \
             $$quote($$BASEDIR/../assets/QuotePage/*.qs) \
             $$quote($$BASEDIR/../assets/QuotesListPage/*.qml) \
             $$quote($$BASEDIR/../assets/QuotesListPage/*.js) \
             $$quote($$BASEDIR/../assets/QuotesListPage/*.qs) \
             $$quote($$BASEDIR/../assets/images/*.qml) \
             $$quote($$BASEDIR/../assets/images/*.js) \
             $$quote($$BASEDIR/../assets/images/*.qs) \
             $$quote($$BASEDIR/../assets/models/*.qml) \
             $$quote($$BASEDIR/../assets/models/*.js) \
             $$quote($$BASEDIR/../assets/models/*.qs) \
             $$quote($$BASEDIR/../assets/sql/*.qml) \
             $$quote($$BASEDIR/../assets/sql/*.js) \
             $$quote($$BASEDIR/../assets/sql/*.qs)

    HEADERS +=  $$quote($$BASEDIR/../src/*.h) \
             $$quote($$BASEDIR/../src/*.h++) \
             $$quote($$BASEDIR/../src/*.hh) \
             $$quote($$BASEDIR/../src/*.hpp) \
             $$quote($$BASEDIR/../src/*.hxx)
}

TRANSLATIONS =  $$quote($${TARGET}.ts)
