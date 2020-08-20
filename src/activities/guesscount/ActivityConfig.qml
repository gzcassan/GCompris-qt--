/* GCompris - ActivityConfig.qml
 *
* Copyright (C) 2020 Deepak Kumar <deepakdk2431@gmail.com>
 *
 * Authors:
 *   Deepak Kumar <deepakdk2431@gmail.com>
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation; either version 3 of the License, or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with this program; if not, see <https://www.gnu.org/licenses/>.
 */
import QtQuick 2.6
import GCompris 1.0

import "../../core"
import "guesscount.js" as Activity

Item {
    id: activityConfiguration
    property Item background
    property alias modeBox: modeBox
    width: if(background) background.width
    property var availableModes: [
        { "text": qsTr("Admin"), "value": "admin" },
        { "text": qsTr("BuiltIn"), "value": "builtin" }
    ]

    Column {
        id: column
        spacing: 10 * ApplicationInfo.ratio
        width: activityConfiguration.width
        GCComboBox {
            id: modeBox
            model: availableModes
            background: activityConfiguration.background
            label: qsTr("Select your mode")
        Row {
            id: labels
            spacing: 20
            anchors {
                top: modeBox.bottom
                topMargin: 5
            }
            visible: modeBox.currentIndex == 0
            Repeater {
                model: 2
                Row {
                    spacing: 10
                    Rectangle {
                        id: label
                        width: column.width*0.3
                        height: column.height/3
                        radius: 20.0;
                        color: modelData ? "green" : "red"
                        GCText {
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            fontSize: smallSize
                            text: modelData ? qsTr("Selected") : qsTr("Not Selected")
                        }
                    }
                }
            }
        }
        Rectangle {
            width: parent.width
            color: "transparent"
            height: parent.height/1.25-labels.height-modeBox.height
            anchors {
                top: labels.bottom
                topMargin: 5
            }
            ListView {
                id: adminModeLevels
                anchors.fill: parent
                visible: modeBox.currentIndex == 0
                spacing: 5
                model: Activity.numberOfLevel
                clip: true
                delegate: Admin {
                    id: level
                    level: modelData
                    levelOperators: Activity.saveLevelArr()
                    width: activityConfiguration.width
                    height: activityConfiguration.height/10
                }
            }
        }
    }
  }
    property var dataToSave

    function setDefaultValues() {

        if(dataToSave["mode"] === undefined) {
            dataToSave["mode"] = "builtin";
            modeBox.currentIndex = 1
        }
        for(var i = 0 ; i < availableModes.length ; i++) {
            if(availableModes[i].value === dataToSave["mode"]) {
                modeBox.currentIndex = i;
                break;
            }
        }
    }

    function saveValues() {
        var newMode = availableModes[modeBox.currentIndex].value;
        dataToSave = {"mode": newMode, "levelArr": Activity.saveLevelArr()};
    }
}
