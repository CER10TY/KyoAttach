This ReadMe will cover the usage of the ATV script, how it works, and other things.

How to add the actions properly:

There are two ways of adding the actions properly. The first one is via init.sqf (look up content in init.sqf in this folder), which adds the action to attach the ATV(s) to ALL US ATVs which are present at mission startup.
The second way is adding every action manually. To do this, you access attachatv.sqf.

nul = ATV addAction ["Attach ATV","attachatv.sqf"];

This is an example of what it could look like. Note that this way you have to do it manually with every ATV. 

How the script works (basic explanation):

Regardless of what option you choose, you'll end up executing attachatv.sqf. 
What the script first does is that it checks if an ATV is within 5 to 10 m of the ATV the action got called from.

IF the ATV is alone, the ATV simply gets "teleported" to the back of the Chinook. There it remains, without simulation (enablesimulation false). This prevents clipping errors and such. And also prevents the ATV from rolling out on it's own.

IF the ATV is NOT alone, another script gets executed, attach2atv.sqf.
The concept is the same, just that the second ATV gets "teleported" to the front.

NOTE: You will NOT be able to see the ATV(s) inside the Chinook, UNLESS you are in 3rd person view and look inside the Chinook this way. 
This is most likely a modeling issue (not related to the addon) which I won't be able to fix. Just keep in mind it's there.


What happens AFTER attaching the ATVs to the Chinook:

The pilot/crew gets an action to eject the ATV(s). 
It works this way: The ATV(s) get their asses kicked out of the Chinook with such a velocity it's gone in a matter of seconds and never returns. 
Alright, now seriously. It uses setVelocity to slightly kick out the ATV(s), however this is dependent on speed and height. 

If you are higher than 25 metres above the ground, a parachute will be deployed, which gets the ATV(s) safely to the ground.
Note, when using 2 ATVs, there is a delay between the pushing out of the two of them.
ATV 1 will get pushed out instantly (the one in the front), ATV 2 about 1-2 secs later (the one in the back).

If you are below 25 metres, no parachute will be deployed. Same system if you use 2 ATVs, there's a delay.
Now when you test this, keep in mind that ArmA2 has some pretty nice physics. Keep your ramp leveled if you don't want the ATV(s) to do crazy stuff like a 180 and suddenly get teleported into the parachute (which causes it to go to 0 degrees again). Even if you have your ramp leveled I can't guarantee it doesn't look retarded when you're ejecting the ATV(s). They tend to get to the ground safely, I'd say there's a 10% chance they'll blow up. Maybe less.

Pushing speed depends on the speed of the Chinook, the slower you are, the more pushing speed the ATV gets. 


Credits, Usage outside of this addon etc

Credits go to Konyo (and anybody else) who worked on the MH-47E Chinook addon itself.
Credits to tryteyker for the ATV script.

If you wish to use the ATV script for learning purposes, shoot me a PM on the BI forums (or Armaholic). For now I will not allow usage of these scripts outside of their intended purposes, and I will not give out the script to anybody who wishes to do this.


ADDITION 2014

This is now converted for proper usage with Konyo's MH-47E in ArmA3 1.18. It has some slight improvements, namely that the ATV(s) get "discarded" a few metres above ground. 
During testing I noticed that the ATVs sink into the ground and flip because they're still attached to the parachute. This caused them to flip into all kinds of unusable positions, but not anymore.

I haven't edited any parts of this manual in regards to the update, just added this notation. I've by now removed the obsolete folders within this script - the vital files remain. It is still outlined on how to use these properly in this manual, and there should be no issues.

ADDTION 31/08/2014

Two new files have been added: description.ext and the functions folder. All 2 must be properly copied over to your mission for the ON START UP ATTACHMENT to work. If you do not wish to attach the vehicles on startup, you can ignore these files.