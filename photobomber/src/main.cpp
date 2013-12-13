/* Copyright (c) 2012 BlackBerry Limited.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "photobomberapp.h"
#include <Qt/qdeclarativedebug.h>

void myMessageOutput(QtMsgType type, const char *msg)
{
    // In this function, you can write the message to any stream!
    switch (type) {
        case QtDebugMsg:
            fprintf(stderr, "Debug: %s\n", msg);
            break;
            case QtWarningMsg:
            fprintf(stderr, "Warning: %s\n", msg);
            break;
            case QtCriticalMsg:
            fprintf(stderr, "Critical: %s\n", msg);
            break;
            case QtFatalMsg:
            fprintf(stderr, "Fatal: %s\n", msg);
            abort();
        }
    }

Q_DECL_EXPORT int main(int argc, char **argv)
{
#ifndef QT_NO_DEBUG
    qInstallMsgHandler(myMessageOutput);
#endif

    // Call the main application constructor.
    Application app(argc, argv);

    // Initialize our app.
    PhotoBomberApp mainApp;

    // We complete the transaction started in the main application constructor and start the
    // client event loop here. When loop is exited the Application deletes the scene which
    // deletes all its children.
    return Application::exec();
}

