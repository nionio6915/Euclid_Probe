# EUCLID PROBE

A highly accurate, magneticaly coupled Z-Probe that is not affected by bed temp, bed material, magnetism or surface treatment. The probe can be configured to be used as Z endstop, be manually or automatically deployed via gcode macros, and takes advantage of the firmware's probe pickup detection scheme to ensure pickup/release. It uses screw attached magnets for both mechanical coupling and for electrical contact. The Z-Probe circuit is completed when the probe is attached. 

  
[Parts](https://github.com/nionio6915/Euclid_Probe/blob/main/README.md#parts)  
[Switches](https://github.com/nionio6915/Euclid_Probe/blob/main/README.md#switch)  
[Magnets](https://github.com/nionio6915/Euclid_Probe/blob/main/README.md#magnets)  
[Screws for mounting magnets](https://github.com/nionio6915/Euclid_Probe/blob/main/README.md#screws-for-mounitng-magnets)  
  

<li>[Board Assembly](https://github.com/nionio6915/Euclid_Probe/blob/main/README.md#bottom-board-assembly)</li>)</li>
    <ul>
    <li>[Bottom Board](https://github.com/nionio6915/Euclid_Probe/blob/main/README.md#bottom-board-assembly)</li>
    <li>[Top Board](https://github.com/nionio6915/Euclid_Probe/blob/main/README.md#top-board-assembly)</li>
    <li>{Otional LED's](https://github.com/nionio6915/Euclid_Probe/blob/main/README.md#optional-leds)</li>
    </ul>
<li>[Firmware Configuration](https://github.com/nionio6915/Euclid_Probe/blob/main/README.md#firmware-configuration)</li>
    <ul>
    <li>[RepRap Version 2.x](https://github.com/nionio6915/Euclid_Probe/blob/main/README.md#duet-2--reprap-firmware-2x)</li>
    <li>[RepRap Version 3.x](https://github.com/nionio6915/Euclid_Probe/blob/main/README.md#duet-3--reprap-firmware-3x)</li>
    <li>[Smoothieware](https://github.com/nionio6915/Euclid_Probe/blob/main/README.md#smoothieware)</li>
    <li>[Probe Calibration](https://github.com/nionio6915/Euclid_Probe/blob/main/README.md#probe-calibration)</li>
    </ul>

<li>[Reference Models & Info](https://github.com/nionio6915/Euclid_Probe/blob/main/README.md#reference-info)</li>
<li>[Ordering Boards](https://github.com/nionio6915/Euclid_Probe/blob/main/README.md#oshpark)</li>
</ul>

Screws are used to postivley attach the magnets to the component PCB's. The unique dock design securely captures the probe, providing secure and reliable docking and undocking. As of 7/5/2021, in the process df switch proving, the test printer has sucessivly made over 50,000 deploy and retracts without a docking failure.  

The initial design and foundations were laid when the author purchased a Wanhao Duplicator and wanted a 'semi-automtic probe' but was limited by the then current firmware.  The Euclid Probe was was then ressurected for use with RepRap Firmware and ![CroXY 3D Printer](https://github.com/wesc23/CroXY), and then adapted to ![Eustathios-Spider V2](https://github.com/eclsnowman/Eustathios-Spider-V2). It has since been successfully been implemented on ![Railcore](railcore.org) and Wanhao duplicator i3 printers.  Various mount files are included in the CAD and stl folders.

Discussion and support is available as a subgroup to the CroXY Discord- https://discord.gg/jfnVrUx2uK

Calibrating the Probe and setting Z offset: See the section below. 

The same PCB is used for both the upper and lower half, and uses 4, 1/4x1/8 axialy polarized magnets, an SPDT snap action switch, M2 & M3 mounting screws, and some other random bits and bobs you probably have laying about.  

The parts list specifies an Omron snap action switch: the most common subminiature size of the Omron D2F switch series, but almost any subminature switch will work. The circuit only uses the Normally Closed (NC) half of the switch as a momentary pushbutton. Testing has shown that other switches of the same package size will work and their repetability is good enough for use as a Z probe.  Reliability testing has shown name brand switches to have a standard of deviation of the trigger point on the order of 0.002mm, and no-name aliExpress and ebay generics to be be 0.004mm- a full order of magnitude better than BLTouch and inductive probes and similar variants.  

The operating temperature range of most mainstream switches of this class are 80°C, so theoretically the probe should function in a heated chamber of 60°C.  

![CC-BY-NC-SA](/images/88x31.png)</br>
**Creative Commons Attribution- NonCommercial - ShareAlike  
CC BY-NC-SA**  

Assembled board coupled together<br>  
![iso view](/images/ISO_View1.png)<br>  

![iso view](/images/ISO_View3.png)<br>  
  
[left view](/images/Left_View.png)<br>  
  Side view of stacking boards<br>  
  
  Isometric view of KiCAD model with JST-XH connector and M3 Screws & heatserts<br>
  ![isotop](/images/isotop.png)<br> 

  Isometric view of underside of KiCAD model with JST-XH connector. M3 Screws & heatserts are modeled for reference, and optional diodes and resistors installed<br>
  ![isotop](/images/isotop2.png)<br> 
  
  Isometric view of KiCAD model of assembled bottom board<br> 
  ![isobtm](/images/isobtm.png)<br> 

  Isometric view of underside KiCAD model of assembled bottom board<br> 
  ![isobtm](/images/isobtm2.png)<br> 

  Board Dimensions  
  ![boarddims](/images/board-dims.png)<br> 
  
SMT components are optional on the upper PCB to create visual indicator of switch action. 

Links for boards and parts- 
PCB Board currently hosted at OSHPark.com. As of 11/20/2020, $3.10 shipped for 3 boards.  
https://oshpark.com/shared_projects/k646v9BY

Plans to sell boards and kits direct to end users is in progress. 6/14/2021. 


## Parts
<ol>
  <li>2 - Z-Probe PCBs - Same PCB is used for the upper and lower half.</li>  
  <li>4 - 1/4x1/8 axially magnetized countersunk magnets. Two magnets must have N on countersink side, two with S on countersink side.</li>  
  <li>1 - OMRON D2F snap action switch. There are multiple variants in the series, but the D2F-5 are of the higher carying capacity and are reputed to be the most precise, repeatable devices. </li>  
  <li>4 - M2x5 countersunk steel screws. (2-56 x 3/8 and M2-8 to 10mm length ok)</li>  
  <li>2 - M3 screws to attach the board to the carriage. Stainless steel button head cap screws (non magnetic) are prefered. Regualr cap screws have an interference issue with the heads being as tall or taller than the magnets.</li>  
  <li>1 - 2 pin header of your choice: 2.54mm pitch straight, right angled, Dupont or JST XH connector. If using the optional SMT LED indicator, this must be a 3 pins connector.</li>  
  <li>1 - SMT LED- Optional. Ones with Vf of ~2.2v are best (red, yellow, orange and pale green). Any sized component from 0603 - 0805 - 1206 will work and can be soldered to the pads.  </li>  
  <li>1 - SMT 1kOhm Resistor (Optional). Any sized component from 0603 - 0805 - 1206 will work and can be soldered to the pads.   </li>  
</ol>

### Switch:   
Omron D2F-5 is the more common higher force, 5A swtich. All the swtiches in the same series use the same basic module with different levers. Sometimes the pin plunger variant is out of stock- remove the lever from a -5L or -5L3 one and use the remaining switch.  
https://octopart.com/search?q=D2F-5&currency=USD&specs=0
Other manufacturers' SPDT switches may work as long as they match the footprint. Early prototypes were fabricated from recycled Makerbot endstop switches that had damaged levers. They were of generic/unknown origin but worked just fine.   

### Magnets
1/4" od x 1/8" thick with countersunk hole for #2 screw, Axially Magnetized so that they stick face to face. Ideally you want magnets pairs so that they mate face to face. Here are some examples -   

https://www.kjmagnetics.com/proddetail.asp?prod=R422CS-P-N52  

https://www.mcmaster.com/5862K223/  

### Screws for mounitng magnets
Pilot holes in the PCB are sized for 2-56 or M2x0.4 self tapping plastic screws. Where to find 4 of them? Good question!   
Junked kids toys or electronics. If all else fails, through drill it and use an M2 or 2-56 flat head screw and nut from the hardware store. A dab of Loctite or super-glue will keep it together nicely.  Hobby shops often have these litle screws too. 

![Trim Craft Aviation RC](https://www.trimcraftaviationrc.com/) is a known good supplier for small lots of heatserts and Imperial and Metric fasteners in Steel, Stanless Steel, and Nylon.   

## Bottom Board Assembly:   
Solder the switch to the board, noting that the switch orientation is such that the COM terminal is towards the rear end of the board: this is usually the side with the switch plunger. You can clip the excess tails of the pins if desire. If you are using a right angle header mounted to the underside of the top board, you might need to clip them for clearance. It is suggested that you put on a piece of Kapton tape or similar to insulate the exposed terminals. Nail polish or model enamel works well too. 

![Bottom Silk](/images/SolderMaskBtm.png)

[b]Test out your magnets for their polarity and proper orientation.[/b]  The magnets area ideally orientated so that their poles alternate fore-aft on the board. This way, when the tool aproaches the probe in the dock, the leading magnet's polarity is same as the first magnet on the probe it encounters. Since these two magnets are of the same polarity, they are repulsed instead of attracted to each other, and the probe will pass this magnet and only get picked up when the pairs of magnets are aligned.   

![iso](/images/mag-polarity0.png)  

One of the magnets should have N pole up, the other S pole up. Unless they are marked, all you need to do is get two of them to stick together and place another pair adjacent. Put a piece of paper between magnets so that they can be easily slid apart. Try not to let the magnets slam together, they can chip. If the two pairs are attracted to each other, flip one set over-under so that the mating pairs attract, but the adjacent pairs repulse.  

Magnets should be cinched down snug to the pads on the PCB. If you are using thru-bolts, you will want to Use a dab of some sort of thread locker for good measure. Loctite is a common example, but you sould also use a drop of nail polish, hair spray, or even white glue when installing the nut. A drop of superglue, (CA) can be dabbed to the screw at the nut were it sticks out as well.      

## Top Board Assembly:   
If not using the surface mounted LED you may use a 2 pin header of your choice soldered to the 2.54mm pitch holes marked GND-SIG, or a 3-pin JST-XH connector in the holes marked GND-SIG-VCC. 

Install the two magnets onto the top board with M2 countersunk screws. The magnet's polarities should be opposite that of the bottom board.  

![top Silk](/images/SolderMaskTop.png)

The mounting holes in the PCB are sized for tapping the PCB with an M3 tap, else thru drill it for the fastener of your choice. The heatserts shown in the renderings are a suggestion, not a requirement. They were modeled into the design to attempt to maintain adequate material allowance and clearances for their use.     

## Optional LED's  

The top board can be populated with an LED and resistor to indicate when the probe has triggered.  

The SMT pads are provided in pairs on both faces of the board. This way, the LED can be located on either side to provide the best visibility depending on the mounting. The top board will require a VCC connection to use the LED and thus will require a 3 pin header. **The LED will not work on the bottom probe board.** 

Solder an SMT LED to the pad where it will be most visible when triggered.  The recommended LED should be a yellow or green one with a low current draw to reduce the load on the controller MCU. Pay attention to **cathode mark** and the LED polarity symbols as you install it. you can instal the LED on whichever position that suits you best as long as you install the resistor on the remaining pair of pads. Verify the datasheet of your components to ensure the proper orientation. Pads are sized for 1206 SMT components, but it is possible to install an SMT as small as 0603 onto the pads with careful soldering.

If you need a reminder of how the polarity is marked and how the SMT components are marked, a page like this might be helpful. http://www.talkingelectronics.com/ChipDataEbook-1d/html/SM-LEDs.html 

Next solder a 1kOhm SMT resistor to the empty pair of pads on the same side of the board. If in doubt as to which set of pads to install the resistor to, probe the LED for continutiy through the vias.    

![LED Insatll](/images/LED_Install.png)

## Probe Calibration
Quick notes, to be expanded on later-
 - Assign Z probe offset SMALLER than you will actually use to stop the probe HIGHER off the bed. 
 - Home Z
 - Probe the bed at a given point, X100 Y100. 
 - Jog the bed/nozzle down to a feeler gauge of known thickness. 0.2mm is ideal, 0.008 is close (0.207mm)    
   - Stainless steel feelers are recommened even thought they cost more because stainless steel is non-magnetic.    
   - 0.2mm - 1/2"x12" as an example https://www.mcmaster.com/2300A9/   $2.88    
   - 0.008in - 1/2x12" https://www.mcmaster.com/19875A39/ $2.88        
 - Once you touch off the nozzle on the feeler gauge, use G92 to set the height:    
       G92 Z0.2
 - Reprobe the SAME spot a few times and average the values: G30 S-1 for example in RRF  to probe and report the trigger height. The result is the Z probe offset value to use in your config.   
       G31 ...Z2.956 

 - If you really want to get fancy, you can use a g-code macro like this to have the system do it for you probing 10 points and doing the math.
   ```
    ; ***
    ; findZprobeoffset.g
    ; ***
    M291 P"Probe will be tested 10 times and return mean and standard deviation. Ok or Cancel?" R"WARNING" S3 ; User must click OK or cancel.
    G28 X Y
    M401
    G28 Z
    G1 X100 Y100 Z12   ; travel to X,Y of probe point 12mm above bed
    G30 P0 Z-9999
    G30 P1 Z-9999
    G30 P2 Z-9999
    G30 P3 Z-9999
    G30 P4 Z-9999
    G30 P5 Z-9999
    G30 P6 Z-9999
    G30 P7 Z-9999
    G30 P8 Z-9999
    G30 P9 Z-9999 S-1
    M402
   ``` 

## Reference Info 

OpenSCAD model of the board is included. Example probe dock and .step files of assembled boards included for you convenience.  This image of the step is a bit convoluted with things populated in different spots- its an artifact of KiCAD and how it generates step files. 

![iso](/images/PROBE-BOARD.png)  
![Probe docked in Frame mounted fixed dock](/images/Probe_Docked.png)  
![Probe in dock ready position](/images/Front-Undocked.png)
![iso](/images/Front-Probe.png)  
![iso](/images/Probe_Dock_Fixed.png)  
![iso](/images/2020Rail_Mount.png)  

## Firmware Configuration

You need to estalibsh the probe position relative to the nozzle in your firmware. The following image showing the probe location is used in the examples below. <br> 
To deploy and trieve probe: work in progress

![probe-offsets.jpg](/images/probe-offsets.png)

### Duet 2 / RepRap Firmware 2.x 
Probe is configured as P5 (from RepRapFirmware 1.14) as a normally closed switch for bed probing between the In and Gnd pins of the Z-probe connector (Duet 0.8.5 and Duet 2 WiFi).<br>  
https://duet3d.dozuki.com/Wiki/Gcode#Section_M558_Set_Z_probe_type<br>

    ; Mag Probe Settings  
    M558 P5 H8 F300 T9000 A1 S.01	                ; set Z probe type to P5 for NC switch
                                                            ; H dive height of 8mm, F300 probing speed 6mm/sec, T9000 travel speed 150mm/sec,   
                                                            ; A number of probes 1, S0.01 max tolerance of 0.01 
    ;
    G31 K0 P500 X-16.4 Y-29.4 Z0.90                        ; CHECK for LOOSE things first! set Z probe trigger value, offset and trigger height.  Higher numbers makes nozzle closer to bed  
                                                            ; switch plunger is 16.4mm to the LEFT and 29.27 in FRONT of the nozzle
                                                            ; switch triggers 0.90mm BELOW nozzle
                                                            ; https://duet3d.dozuki.com/Wiki/Test_and_calibrate_the_Z_probe#Section_Fine_tuning_the_trigger_height
                                                            ; baby stepping - if you have to move the nozzle closer to the bed, increase the G31 Z
                                                            ; if you have to move the nozzle away from the bed, decrease the G31 Z value by the amount of baby stepping used.
    ;

<br>


### Duet 3 / RepRap Firmware 3.x

P5 selects normally closed switch for bed probing between the In and Gnd pins of the Z-probe connector. <br>
The pullup resistor on the Z probe input is disabled by default, but it needs to be enabled. Enable it by prefixing the input pin (C parameter) with the ^ character. Enable pullup resistor with ^ if using Duet 2, running RRF3, using the Z probe input pin, and the probe type is a switch. <br>

https://duet3d.dozuki.com/Wiki/Gcode#Section_M558_in_RepRapFirmware_Num_3<br>  


  

    ; Mag Probe Settings
    ;
    M558 K0 P5 C"^zprobe.in" H8 F300 60 T9000 A3 S0.01      ; K0 for probe 0, P5 for NC switch, C for input pin, ^ for enabling the native pullup resistor on Duet2 hardware running RRF3  
                                                            ; H dive height of 8mm, F300 probing speed 6mm/sec, T9000 travel speed 150mm/sec,   
                                                            ; A3 number of probes 1, S0.01 max tolerance of 0.01 
    ;
    G31 K0 P500 X-16.4 Y-29.4 Z0.90                         ; CHECK for LOOSE things first! set Z probe trigger value, offset and trigger height.  Higher numbers makes nozzle closer to bed
                                                            ; switch plunger is 16.4mm to the LEFT and 29.27 in FRONT of the nozzle
                                                            ; switch triggers 0.9mm BELOW nozzle
                                                            ; https://duet3d.dozuki.com/Wiki/Test_and_calibrate_the_Z_probe#Section_Fine_tuning_the_trigger_height
                                                            ; baby stepping - if you have to move the nozzle closer to the bed, increase the G31 Z
                                                            ; if you have to move the nozzle away from the bed, decrease the G31 Z value by the amount of baby stepping used.
    ;
    ;

### Smoothieware  
Currently testing.

### OSHPark
Magnetically coupled Z-Probe PCB sled, originally inspired and created for CroXY 3D Printer. Same PCB is used for upper and lower half. Uses 4, 1/4x1/8 or 8mmx3mm ring magnets, and an Omron D2F snap action switch, M3 mounting screws, and some other random bits and bobs you probably have laying about. more info at http://git.io/JkzZL
