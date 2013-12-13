/* Copyright (c) 2012, 2013 BlackBerry Limited.
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
import bb.cascades 1.2

// A custom item used in the list on the WeatherPage
WeatherItemContainer {
    id: weatherItem
    property string tempaverage: "14"
    property string icon: "1"
    property string date: "Wed March 20 2013"
    property variant textColor: Color.create("#16B1AF")

    Container {
        preferredHeight: 201
        layout: DockLayout {
        }

        // Fill the screen in horizontal direction (see WeatherItemContainer.qml for layout).
        layoutProperties: StackLayoutProperties {
            spaceQuota: 1
        }

        // Icon image
        ImageView {
            imageSource: "asset:///images/icons/small/" + icon + ".png.amd"
            horizontalAlignment: HorizontalAlignment.Fill
        }

        Container {
            leftPadding: 17
            topPadding: 13
            verticalAlignment: VerticalAlignment.Fill

			// The date
            Label {
                text: date
                textStyle.color: textColor
                bottomMargin: 0
            }

            Container {
                leftPadding: 100

                layout: DockLayout {
                }

                layoutProperties: StackLayoutProperties {
                    spaceQuota: 1
                }
                
                // The temperature
                Label {
                    verticalAlignment: VerticalAlignment.Center
                    text: "<html><span style='color:black;font-size:x-large'><div>" + tempaverage + "\u00B0</div></span></html>"

                    // We don't want this text to be spoken when using accessibility
                    accessibilityMode: A11yMode.Collapsed
                }
            }
        }

        // A divider for the item.
        Container {
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Bottom
            background: textColor
            minHeight: 2
        }

        // Let's use this CustomA11yObject to give correct information.
        accessibility: CustomA11yObject {
            role: A11yRole.ListItem
            name: "temperature " + tempaverage + " degrees"

        }
    }
}
