KyoAttach
=========

Attach scripts for Konyo's MH-47E ArmA 3 Addon


Todo List
=========

* Create function to allow ATVs/CRRCs directly inside the helicopter on mission start.
* Port over individual scripts to functions, to allow for more modular development.
* Various other small bug fixes.

Known Bugs
=========

* [u]Actions added via addAction will remain visible and take effect at all times, even if the vehicle is far away from the helicopter.[/u] - Squished with v1.1

Changelog 
=========

v1.0
* Initial Release

v1.1 
* Added: Distance check, so actions will disappear if vehicle is further than 30m from the Chinook.
* Added: Function (TRT_fnc_attachOnStart) to immediately attach vehicle(s) to helicopter on mission startup. More info in the Readme.
* Added: Command List, listing all relevant commands in a quick fashion.
* Known issue: ATVs are stuck inside helicopter floor when attached to the Chinook. Should have no lasting effect when ejecting.