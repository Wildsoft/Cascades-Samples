/* Copyright (c) 2012 Research In Motion Limited.
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
import bb.cascades 1.0

// Here we are importing a file with a JavaScript in used to generate the texts for the poem.
import "poemgenerator.js" as PoemGenerator

Page {
    Container {
        layout: AbsoluteLayout {
        }

        // Background image.
        ImageView {
            imageSource: "asset:///images/background.png"
        }

        ImageButton {
            defaultImageSource: "asset:///images/rubber.png"
            pressedImageSource: "asset:///images/rubber_depressed.png"
            disabledImageSource: "asset:///images/rubber.png"

            layoutProperties: AbsoluteLayoutProperties {
                positionX: 900
                positionY: 510
            }

            // Touch signal handler for horn-bulb (button), ordinarily for an image
            // button one would use the onClicked handler for this, but since it
            // makes more sense for the notes when the bulb is pressed and wind blows 
            // through the straw, this is where animations are triggered.            
            onTouch: {
                if (event.isDown ()) {

                    // The hide animations are triggered in the hideNote function in Note.qml.
                    note1.hideNote ();
                    note2.hideNote ();
                    note3.hideNote ();

                    // Change the rotation on the notes as they are blown away.
                    note1.rotationZ = 0;
                    note2.rotationZ = -40;
                    note3.rotationZ = 40;
                }
            }
        }

        // For the three notes building up the poem a Note component defined in Note.qml is used.
        Note {
            id: note1
            property int initialRotation: 0
            layoutProperties: AbsoluteLayoutProperties {
                positionX: 94
                positionY: 184
            }
            showAnimStartX: (- note1.layoutProperties.positionX - 238)

            // The Note component emits a signal called newNote, we connect to it in the first
            // note only and trigger all the show animations here (its emitted when the hide animation has ended).
            onNewNote: {

                // The show animation is started by calling the showNote function in Note.qml (it is not
                // possible to trigger animations using id:s if they reside in a separate QML document).
                showNote ();

                // The note is animated back to its original rotation using implicit animations.
                rotationZ = initialRotation;

	 	        // Update the poem while the note is not visible on screen.
                note1.poem = PoemGenerator.generatePoemLine (1);
            }
        }

        // The second note <verb> + <adverb>
        Note {
            id: note2
            property int initialRotation: -12
            layoutProperties: AbsoluteLayoutProperties {
                positionX: 472
                positionY: 183
            }
            rotationZ: initialRotation
            showAnimStartX: (- note2.layoutProperties.positionX - 238)
            onNewNote: {
                showNote ();
                rotationZ = initialRotation;
                note2.poem = PoemGenerator.generatePoemLine (2);
            }
        }

        // The third note <preposition> + <noun>
        Note {
            id: note3
            property int initialRotation: -5
            layoutProperties: AbsoluteLayoutProperties {
                positionX: 826
                positionY: 147
            }
            rotationZ: initialRotation
            showAnimStartX: (- note3.layoutProperties.positionX - 238)
            onNewNote: {
                showNote ();
                rotationZ = initialRotation;
                note3.poem = PoemGenerator.generatePoemLine (3);
            }
        }
    }

    // When the Page is completely created we call the updatePoem function.
    onCreationCompleted: {
        note1.poem = PoemGenerator.generatePoemLine (1);
        note2.poem = PoemGenerator.generatePoemLine (2);
        note3.poem = PoemGenerator.generatePoemLine (3);
    }
}
