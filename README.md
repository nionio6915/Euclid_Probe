# PROBE-BOARD

This magneticaly coupled Z-Probe probe takes advantage of RepRapFirmware's probe pickup detection scheme and uses magnets for both mechanical cooupling and as electrical contacts. The Z-Probe circuit is completed when the probe is picked up.  This magnetically coupled Z-Probe PCB sled was originally inspired by and created for ![CroXY 3D Printer](https://github.com/wesc23/CroXY), and then apapted to ![Eustathios-Spider V2](https://github.com/eclsnowman/Eustathios-Spider-V2).

The same PCB is used for both the upper and lower half, and uses 4, 1/4x1/8 axial polarised magnets, an Omron D2F snap action switch, M2 & M3 mounting screws, and some other random bits and bobs you probably have laying about.  

The parts list specifies an Omron snap action switch. The subminiature size of the Onron DF2 switches, their trigger point repeatability and overall reliablility makes them ideally suited for Z-Probed use.   The circuit only uses the Normally Closed (NC) half of the switch as a momentary pushbutton, as no other submitiature packaged SPST momentary swtich was found to be as reliable as the Omron.

  ![iso view](/images/ISO_View.png) 
  ![left view](/images/Left_View.png)
  ![isotop](/images/isotop.png)
  ![isobtm](/images/isobtm.png) 
  ![baorddims](/images/board-dims.png) 

SMT components are optional on the upper PCB to create visual indicator of switch action. 

Links for boards and parts- 
PCB Board currently hosted at OSHPark.com. As of 11/20/2020, $3.10 shipped for 3 boards.  
https://oshpark.com/shared_projects/B1YqnYo3


## Parts
<ol>
  <li>2 - Z-Probe PCBs - Same PCB is used for the upper and lower half.</li>  
  <li>4 - 1/4x1/8 axially magnetized countersunk magnets. Two magnets must have N on countersink side, two with S on countersink side.</li>  
  <li>1 - OMRON D2F-01F-A1 snap action switch</li>  
  <li>4 - M2x5 countersunk steel screws. (2-56 x 3/8 and M2-8 to 10mm length ok)</li>  
  <li>2 - M3 screws to attach the board to the carriage. Stainless steel button head cap screws (non magnetic) are prefered. Regualr cap screws have an interference issue with the heads being as tall or taller than the magnets.</li>  
  <li>1 - 2 pin header of your choice: 2.54mm pitch straight, right angled, Dupont or JST XH connector. If using the optional SMT LED indicator, this must be a 3 pins connector.</li>  
  <li>1 - SMT LED- Optional. Ones with Vf of ~2.2v are best (red, yellow, orange and pale green). Any sized component from 0603 - 0805 - 1206 will work and can be soldered to the pads.  </li>  
  <li>1 - SMT 1kOhm Resistor (Optional). Any sized component from 0603 - 0805 - 1206 will work and can be soldered to the pads.   </li>  
</ol>

### Switch:   
Omron D2F-01F-A1  
https://octopart.com/d2f-01f-a1-omron-1437650?r=sp   
Others may work as long as they match the footprint. Early prototypes were fabricated from recycled Makerbot endstop switches that had damaged levers.   

### Magnets
1/4" od x 1/8" thick with countersunk hole for #2 screw, Axially Magnetized so that they stick face to face. Ideally you want magnets pairs so that they mate face to face. Here are some examples -   

https://www.kjmagnetics.com/proddetail.asp?prod=R422CS-P-N52  

https://www.mcmaster.com/5862K223/  

### Screws for mounitng magnets
Pilot holes are size for 2-56 M2x0.4 self tapping plastic screws. Where to find 4 of them? Good question! Junked kids toys or electronics. If all else fails, through drill it and use an M2 or 2-56 flat head screw and nut from the hardware store. A dab of Loctite or super-glue will keep it together nicely.  

![Trim Craft Aviation RC](https://www.trimcraftaviationrc.com/) is a known good supplier for small lots of heatserts and Imperial and Metric fasteners in Steel, Stanless Steel, and Nylon.   

## Bottom Board Assembly:   
Solder the switch to the board, noting that the switch orientation is such that the plunger is towards the rear end of the board. You can clip the excess tails of the pins if desire. If you are using a right angle header mounted to the underside of the top board, you might need to clip them for clearance.

Test out your magnets for their polarity and proper orientation.  The magnets area ideally orientated so that their poles alternate fore-aft on the board. This way, when the tool aproaches the probe in the dock, the leading magnet's polarity is same as the first magnet on the probe it encounters. Since these two magnets are of the same polarity, they are repulsed instead of attracted to each other, and the probe will pass this magnet and only get picked up when the pairs of magnets are aligned.   

![iso](/images/mag-polarity.png)  

One of the magnets should have N pole up, the other S pole up. Unless they are marked, all you need to do is get two of them to stick together and place another pair adjacent. Put a piece of paper between magnets so that they can be easily slid apart. Try not to let the magnets slam together, they can chip. If the two pairs are attracted to each other, flip one set over-under so that the mating pairs attract, but the adjacent pairs repulse.  

Magnets should be cinched down snug to the pads on the PCB. If you are using thru-bolts, you will want to Use a dab of some sort of thread locker for good measure. Loctite is a common example, but you sould also use a drop of nail polish, hair spray, or even white glue when installing the nut. A drop of superglue, (CA) can be dabbed to the screw at the nut were it sticks out as well.      

## Top Board:   
If not using the surface mounted LED you may use a 2 pin header of your choice soldered to the 2.54mm pitch holes maked SIG-GND. Install the two magnets onto the top board with M2 countersunk screws. The magnets polarities should be opposite that of the bottom board such that the two boards stick together.  

Attach the top board to your tool with M3 screws via the thru holes provided.   

## Optional LED's  

The top board can be populated with an LED to indicate when the probe has triggered. The SMT pads are provided in pairs on the top & bottom faces of the board, and on each side of the board. This way, the LED can be located on either side, on the top or bottom of the top board. The LED will not work on the bottom probe board. The top board will require a VCC connection to use the LED and thus will require a 3 pin header.    

Solder an SMT LED of your choice to the pad that will be most visible when triggered. Pads are sized for 1206 SMT components, but it is possible to install an SMT as small as 0603 onto the pads with careful soldering. Pay attention to LED polarity as you install it -polarity symbols have been placed on the board at each location. Next solder a 1kOhm SMT resistor to the corresponding pads on the oppsosite face of the board on the same side. If in doubt as to which set of pads to install the resistor to, probe the LED for continutiy through the via.    


## Reference Info 

OpenSCAD model of the board is included. Example probe dock and .step files of assembled boards included for you convenience.  

![iso](/images/PROBE-BOARD.png)  
![iso](/images/Probe_Docked.png)  
![iso](/images/Front-Probe.png)  
![iso](/images/Left-Probe.png)  

## Firmware Configuration
### Duet 2 / RepRap Firmware 2.x 
Probe is configured as P5 (from RepRapFirmware 1.14) as a normally closed switch for bed probing between the In and Gnd pins of the Z-probe connector (Duet 0.8.5 and Duet 2 WiFi).<br>  
https://duet3d.dozuki.com/Wiki/Gcode#Section_M558_Set_Z_probe_type<br>
<br>
`; Mag Probe Settings  
; RRF2 was M558 P5 H8 F320 T12000 A1 S.01 ; set Z probe type to switch and the dive height + speeds.    
G31 K0 P500 X-16.4 Y-29.27 Z2.50                        ; CHECK for LOOSE things first! set Z probe trigger value, offset and trigger height.  Higher numbers makes nozzle closer to bed  
                                                        ; switch plunger is 16.4mm to the LEFT and 29.27 in FRONT of the nozzle  
;`
<br>
### Duet 3 / RepRap Firmware 3.x
P5 selects normally closed switch for bed probing between the In and Gnd pins of the Z-probe connector. 
The pullup resistor on the Z probe input is disabled by default, but it needs to be enabled. Enable it by prefixing the input pin (C parameter) with the ^ character. Enable pullup resistor with ^ if using Duet 2, running RRF3, using the Z probe input pin, and the probe type is a switch. 

`; Mag Probe Settings

M558 K0 P5 C"^zprobe.in" H8 F300 60 T9000 A3 S0.01      ; K0 for probe 0, P5 for NC switch, C for input pin, ^ for enabling the native pullup resistor on Duet2 hardware running RRF3  
                                                        ; H dive height of 8mm, F300 probing speed 6mm/sec, T9000 travel speed 150mm/sec,   
                                                        ; A3 number of probes 1, S0.01 max tolerance of 0.01 
;
G31 K0 P500 X-16.4 Y-29.27 Z2.50                        ; CHECK for LOOSE things first! set Z probe trigger value, offset and trigger height.  Higher numbers makes nozzle closer to bed
                                                        ; switch plunger is 16.4mm to the LEFT and 29.27 in FRONT of the nozzle
;`
