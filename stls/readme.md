## Repository of stl's for probe adapters and probe docks. 

CAD files in the CAD directory. 

Docks and adapters are designed to be printed at either 0.2mm or 0.3mm layer heights. The probe dock stl's are offered with both Print In Place supports and withought. The best probe deployment results seem to be had by printing the probe dock upside-down: in the event that the PCB bears against the top of the dock when being deployed, this would be the best, top surface of your print. The bottom of the well surface can be a little rough and uneven.  

Note: there is a 5x5mm pocket to insert an optional magnet or ferrous object to retain the probe in the dock. It is not required. This was utilized in early stages of development and remains a legacy for now. 

**The design of your dock is critical to the sucessfull attaching and detaching of the probe.** The Euclid Probe dock utilizes a well, so that when the probe is stripped from the carraige, it is retained by the stops. Upon probe pickup, the probe PCB must clear the exit slots. Adjust the elevation of either the carraige in the deployment gcode or adjust the dock so that in the coupled condition, the probe will slide out without interference.   

## Mounts
**BLTouch Adapter Mount**
![BL Touch Adapter](/images/BLT_Adapter.png)   

**Fixed Frame Dock**
2 Piece design, uses M3 screws and captive nuts to couple the parts. Vertical slots in the mount provide adjustability.     
![Probe docked in Frame mounted fixed dock](/images/Probe_Docked.png)  

**Movable Bed Dock**  
Uses long style, double taper heatserts for assembly. Mounts to the end of a 2020 bed support rail and is adjustable for height. Allows for interchangeble beds to fit under the mount. Requires a change the Z probe offset constant by the bed thickness on the fly. ( G31 Z-(bed thickness) )     
![2020 BBed Mount](/images/2020Rail_Mount.png) 

**Dock stub for grafting into your own printer design the business end you need.**  
![Grafting Stub](/images/Grafting_Stub.png)  

**Omron / Fotec Adapter mount**   
![Omron-Fotek](/images/OmronFotec.png)  

**Omron / Fotec 90 Degree Rotation Adapter mount**   
![Omron-Fotek](/images/OmronFotec90.png)  

**Railcore Dock & Carriage Adapter**  
Dock based on work originally developed by FeNix. Mount attaches to the carraige plate and is slotted for adjustability. 
Railcore dock is a 2 piece design for adjustability, still under development due to all the variations of Railcore design. Provided with both heatsert and tapped hole options.  
![iso](/images/RailCoreE3DV6x2.png)
![iso](/images/RailCoreSchema.png)
![iso](/images/images/RailCoreDock0.png)

**Voron Afterburner V4 User Mod**  
Recessed mount for Euclid probe inte the bottom of the carraige parts, pushing the probed frurther back in Y direction. 
![iso](/images/afterburner-1.8.png) 

**Voron 2.4 Frame Mount**  
This mount mounts to the main frame of the printer. Users are cautioned that the probe will always be in the plane of the motion system, and there is always a prossibility of errant probe pickup compared to the bed mounted dock below.   
![iso](/images/Voron2.4_FrameMount.png)  
![iso](/images/Voron2.4_XRailMount.png)  

**Voron 2.4 Bed Rail Mount**
This mount attaches to the print bed mounting rail. The potential for errant probe pickup is reduced to the Z elevation of the magnet strengths.   
![iso](/images/Voron2.4BedMount.png)   
![iso](/images/Voron2.4BedMount2.png)   
