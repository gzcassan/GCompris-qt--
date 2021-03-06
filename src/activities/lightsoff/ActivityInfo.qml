/* GCompris - ActivityInfo.qml
 *
 * Copyright (C) 2015 Stephane Mankowski <stephane@mankowski.fr>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, see <https://www.gnu.org/licenses/>.
 */
import GCompris 1.0

ActivityInfo {
  name: "lightsoff/Lightsoff.qml"
  difficulty: 6
  icon: "lightsoff/lightsoff.svg"
  author: "Stephane Mankowski &lt;stephane@mankowski.fr&gt;"
  //: Activity title
  title: qsTr("Lights Off")
  //: Help title
  description: qsTr("The goal is to turn off all the lights.")
//  intro: "Click on the lamps to turn them off."
  //: Help goal
  goal: qsTr("The goal is to turn off all the lights.")
  //: Help prerequisite
  prerequisite: ""
  //: Help manual
  manual: qsTr("The effect of pressing a window is to toggle the state of that window, and of its immediate vertical and horizontal neighbors. You must turn off all the lights. If you click on Tux, the solution is shown.")
  credit: qsTr("The solver algorithm is described on Wikipedia. To know more about the Lights Off game: &lt;https://en.wikipedia.org/wiki/Lights_Out_(game)&gt;")
  section: "discovery logic"
  createdInVersion: 0
  levels: "1,2,3,4,5,6,7,8,9"
}
