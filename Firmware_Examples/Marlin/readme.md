Marlin configuration is highly dependent on the controller board used. the following is a general outline of the hardware definition only. 
The full probe deployment and retraction, part of the Configuration.h and Config_adv, are illustrated in the Ender3 config files. 
## For the most up to date information, see www.euclidprobe.com

//===========================================================================
//============================== Endstop Settings ===========================
//===========================================================================
// @section homing

// Specify here all the endstop connectors that are connected to any endstop or probe.
// Almost all printers will be using one per axis. Probes will use one or more of the
// extra connectors. Leave undefined any used for non-endstop and non-probe purposes.
#define USE_XMIN_PLUG
#define USE_YMIN_PLUG
#define USE_ZMIN_PLUG
...
#define USE_ZMAX_PLUG // ENABLE IF USING Z_MAX FOR PROBE

......................

// Mechanical endstop with COM to ground and NC to Signal uses "false" here (most common setup).
...
#define Z_MIN_PROBE_ENDSTOP_INVERTING false // Set to true to invert the logic of the probe.

......................

//===========================================================================
//============================= Z Probe Options =============================
//===========================================================================
// @section probes

//
// See https://marlinfw.org/docs/configuration/probes.html
//

/**
 * Enable this option for a probe connected to the Z-MIN pin.
 * The probe replaces the Z-MIN endstop and is used for Z homing.
 * (Automatically enables USE_PROBE_FOR_Z_HOMING.)
 */
// #define Z_MIN_PROBE_USES_Z_MIN_ENDSTOP_PIN // 

...

/**
 * Z_MIN_PROBE_PIN
 *
 * Define this pin if the probe is not connected to Z_MIN_PIN.
 * If not defined the default pin for the selected MOTHERBOARD
 * will be used. Most of the time the default is what you want.
 *
 *  - The simplest option is to use a free endstop connector.
 *
 *  - RAMPS 1.3/1.4 boards may use the 5V, GND, and Aux4->D32 pin:
 *    - For simple switches connect...
 *      - normally-closed switches to GND and D32.
 *      - normally-open switches to 5V and D32.
 */
#define Z_MIN_PROBE_PIN PA4 // Pin 32 is the RAMPS default
                            // Our Ender-3 test printer with Creality 4.2.2 controller
                            // uses the filament runout sensor connector 

......................
The best way we have found to deploy Euclid Probe under Marlin is with the Allen Probe scheme built into Marlin. The predefined sequence of points and movements to deploy and retract work well natively without any additions.
Following is the probe definition only.

//
// For Z_PROBE_ALLEN_KEY see the Delta example configurations.
//
/**
 * Allen key retractable z-probe as seen on many Kossel delta printers - https://reprap.org/wiki/Kossel#Automatic_bed_leveling_probe
 * Deploys by touching z-axis belt. Retracts by pushing the probe down. Uses Z_MIN_PIN.
 */
#define Z_PROBE_ALLEN_KEY

......................
/
// For Z_PROBE_ALLEN_KEY see the Delta example configurations.
//
// 
/**
 * Allen key retractable z-probe as seen on many Kossel delta printers - https://reprap.org/wiki/Kossel#Automatic_bed_leveling_probe
 * Deploys by touching z-axis belt. Retracts by pushing the probe down. Uses Z_MIN_PIN.
 */
#define Z_PROBE_ALLEN_KEY

#if ENABLED(Z_PROBE_ALLEN_KEY)
  // 2 or 3 sets of coordinates for deploying and retracting the spring loaded touch probe on G29,
  // if servo actuated touch probe is not defined. Uncomment as appropriate for your printer/probe.

  #define Z_PROBE_ALLEN_KEY_DEPLOY_1 { 165, 50, 10 }  // Dock side approach position
  #define Z_PROBE_ALLEN_KEY_DEPLOY_1_FEEDRATE XY_PROBE_FEEDRATE

  #define Z_PROBE_ALLEN_KEY_DEPLOY_2 { 165, 14, 0 }  // Mount over dock position for probe coupling
  #define Z_PROBE_ALLEN_KEY_DEPLOY_2_FEEDRATE (XY_PROBE_FEEDRATE)/10

  #define Z_PROBE_ALLEN_KEY_DEPLOY_3 { 130, 14, 0 } // Translate probe out of dock 
  #define Z_PROBE_ALLEN_KEY_DEPLOY_3_FEEDRATE XY_PROBE_FEEDRATE

  #define Z_PROBE_ALLEN_KEY_DEPLOY_4 { 130, 14, 15 } // Vertically lift probe up to clear bed & dock 
  #define Z_PROBE_ALLEN_KEY_DEPLOY_4_FEEDRATE XY_PROBE_FEEDRATE

  #define Z_PROBE_ALLEN_KEY_STOW_1 { 130, 14.0, 10.0 } // Move the probe into X,Y dock approach position
  #define Z_PROBE_ALLEN_KEY_STOW_1_FEEDRATE XY_PROBE_FEEDRATE

  #define Z_PROBE_ALLEN_KEY_STOW_2 { 130, 14.0, 0.0 } // Move probe down to dock entry position
  #define Z_PROBE_ALLEN_KEY_STOW_2_FEEDRATE (XY_PROBE_FEEDRATE)/10

  #define Z_PROBE_ALLEN_KEY_STOW_3 { 165.0, 14.0, 0.0 } // Move probe into dock
  #define Z_PROBE_ALLEN_KEY_STOW_3_FEEDRATE XY_PROBE_FEEDRATE

  #define Z_PROBE_ALLEN_KEY_STOW_4 { 165.0, 50.0, 0.0 } // Swipe probe off of mount 
  #define Z_PROBE_ALLEN_KEY_STOW_4_FEEDRATE XY_PROBE_FEEDRATE

#endif // Z_PROBE_ALLEN_KEY


......................

......................
