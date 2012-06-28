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
import "Common"

// ImagePaint is typically used for tileable images. A tileable
// image is one that can be repeated as a pattern over a surface.
// This is illustrated in this recipe by showing how a Container
// background can be filled with tiled image patterns.
RecipePage {
    RecipeContainer {
        
        background: recipeBackground.imagePaint
        
        attachedObjects: [
            
		     // The image paint defining which image to paint with and which 
		     // repeat pattern that should be used (both X and Y direction in this 
		     // case. The provided image need to have a width and height that
		     // is a power of two, due to hardware limitations. Furthermore the image
		     // has to be accompanied by a meta file (with file ending .amd)
		     // with the "repeatable" property set to true. Please note that the 
		     // .png ending has been dropped on the image in order for the matching 
		     // images/imagepaint/Tile_nistri_16x16.amd file to be found. 
		     ImagePaintDefinition {
                id: recipeBackground
                imageSource: "asset:///images/imagepaint/Tile_nistri_16x16"
                repeatPattern: RepeatPattern.XY
            }
        ]
        
        Container {
            layout: StackLayout {
                topPadding: 50
                rightPadding: topPadding
                leftPadding: rightPadding
            }
            
            // A drop down control with a couple of different tile images, all of 
            // various power of two dimensions.
            DropDown {
                id: dropdown
                title: "Select tile"
                Option {
                    text: "Nistri"
                    imageSource: "asset:///images/imagepaint/Tile_nistri_16x16"
                }
                Option {
                    text: "Pyamas"
                    imageSource: "asset:///images/imagepaint/Tile_pyamas_16x16"
                }
                Option {
                    text: "Tactile Stripes"
                    imageSource: "asset:///images/imagepaint/Tile_tactile_stripes_16x16"
                }
                Option {
                    text: "White Stripes"
                    imageSource: "asset:///images/imagepaint/Tile_white_stripes_16x16"
                }
                Option {
                    text: "Scribble Light"
                    imageSource: "asset:///images/imagepaint/Tile_scribble_light_256x256"
                }
                Option {
                    text: "Light Toast"
                    imageSource: "asset:///images/imagepaint/Tile_light_toast_128x128"
                }
                Option {
                    text: "Tile Gplay"
                    imageSource: "asset:///images/imagepaint/Tile_gplay_256x256"
                }
                
                onSelectedIndexChanged: {
                    // Change tiling image for the paint to the one specified by the options imageSource.
                    var option = dropdown.at(selectedIndex);
                    recipeBackground.imageSource  = option.imageSource
                }
            }
        }
    }
}
