# PROBE-BOARD

Magnetically coupled Z-Probe PCB sled, originally inspired and created for ![CroXY 3D Printer](https://github.com/wesc23/CroXY). The same PCB is used for the upper and lower halves. Uses 4, 1/4x1/8 axial polarised magnets, an Omron D2F snap action switch, M2 and M3 mounting screws, and some other random bits and bobs you probably have laying about.  

  ![iso](/images/ISO_View.png)  
  ![iso](/images/Left_View.png)  
  ![iso](/images/isotop.png)  
  ![iso](/images/isobtm.png)  
  ![iso](/images/board-dims.png)  

SMT components are optional on the upper PCB to create visual indicator of switch action.  

Links for boards and parts-  
PCB Board currently hosted at OSHPark.com. As of 11/20/2020, $8.70 shipped for 3 boards.  
https://oshpark.com/shared_projects/EyU9h4uk


## Parts
2 - Z-Probe PCBs - Same PCB is used for the upper and lower half
4 - 1/4x1/8 or 8mmx3mm axially magnetized #2 (or 2mm)countersunk magnets. Two magnets must have N on countersink side, two with S on countersink side.
1 - OMRON D2F-01F-A1 snap action switch
4 - M2x5 countersunk steel screws. (#2 and up to 10mm length ok)
2 - M3x8 SHCS stainless steel screws (non magnetic)
1 - 2 pin header of your choice: 2.54mm pitch straight, right angled, Dupont or JST XH connector. If using the optional SMT LED indicator, this must be a 3 pins connector.
1 - SMT LED, of whichever color makes you the happiest, (Optional). Any sized component from 0603 - 0805 - 1206 will work and can be soldered to the pads.
1 - SMT 1kOhm Resistor (Optional). Any sized component from 0603 - 0805 - 1206 will work and can be soldered to the pads. 

### Switch: 
Omron D2F-01F-A1
https://octopart.com/d2f-01f-a1-omron-1437650?r=sp

### Magnets  - 1/4" od x 1/8" thick with countersunk hole for #2 screw, Axially Magnetized so that they stick face to face. Ideally you want magnets pairs so that they mate face to face. Here are some examples - 

https://www.kjmagnetics.com/proddetail.asp?prod=R422CS-P-N52

https://www.mcmaster.com/5862K223/

### Screws for mounitng magnets:
Pilot holes are size for ~#2 sized or M2 self tapping plastic screws. Where to find 4 of them? Good question! Junked kids toys or electronics. If all else fails, through drill it and use an M2 or #2 flat head screw and nut from the hardware store. A dab of Loqtite or super glue will keep it together nicely. 

## Bottom Board Assembly: 
Solder the switch to the board, noting that the switch orientation is such that the plunger is towards the rear end of the board.

Test out your magnets for their polarity orientation.  The magnets area ideally orientated so that their poles alternate fore-aft on the board. This way, when the tool aproaches the probe in the dock, the leading magnet's polarity is same as the first magnet on the probe. Since these two magnets are of the same polarity, they are repulsed instead of attracted to each other, and the probe will only get picked up when the second pair of magnets is aligned. 

![iso](/images/mag-polarity.png)

Put a piece of paper between magnet pairs so that they slide apart easily. Try not to let the magnets slam together, they can chip. One of the magnets should have N pole up, the other S pole up. Unless they are marked, all you need to do is get two of them to stick together and place another pair adjacent. If the two pairs attract each other, flip one set over-under so that the mating pais attract, but the adjacent pairs repulse. Magnets should be cinched down snug to the pads on the PCB. You can clip the excess tails of the pins if desire. If you are using a right angle header mounted to the underside of the top board, you might need to clip them for clearance.  

## Top Board Assembly: 
If not using the surface mounted LED you may use a 2 pin header of your choice soldered to the 2.54mm pitch holes maked SIG-GND. Install the two magnets onto the top board with M2 countersunk screws. The magnets polarities should be opposite that of the bottom board such that the two boards stick together.

Attach the top board to your tool with M3 screws via the thru holes provided. 


## Optional LED's

The top board can be populated with an LED to indicate when the probe has triggered. The SMT pads are provided in pairs on the top & bottom faces of the board, and on each side of the board. This way, the LED can be located on either side, on the top or bottom of the top board. The LED will not work on the bottom probe board. The top board will require a VCC connection to use the LED and thus will require a 3 pin header.  

Solder an SMT LED of your choice to the pad that will be most visible when triggered. Pads are sized for 1206 SMT components, but it is possible to install an SMT as small as 0603 onto the pads with careful soldering. Pay attention to LED polarity as you install it -polarity symbols have been placed on the board at each location. Next solder a 1kOhm SMT resistor to the corresponding pads on the oppsosite face of the board on the same side. If in doubt as to which set of pads to install the resistor to, probe the LED for continutiy through the via.   


Example probe dock and .step files of assembled boards included for you convenience.


![iso](/images/PROBE-BOARD.png)
![iso](/images/Probe_Docked.png)
![iso](/images/Probe_Docked.png)
![iso](/images/Left-Probe.png)
