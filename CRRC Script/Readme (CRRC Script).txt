CRRC Attach & Eject Script Readme

Another fun script :P 
This time the Readme will be a little different because I kinda messed up the previous ATV script with all the scripts, but whatever. 
There are still two versions, the init.sqf version and addAction version.
I'll explain what every script does, how it works in general, then comes a bit of special thanks etc etc etc.

So let's start off.

The first script is the following:

attachboat.sqf
 - The main script which you will always execute (unless you know you have two boats behind eachother / besides eachother and decide to execute it's "parent" script, attach2boats.sqf).
   This script checks if there are two boats nearby and redirects the whole script to it's parent script (I love to call it parent script, you know), but not before you confirm the action by pressing the action again.
   That probably makes no sense so let me illustrate: You have 2 boats closeby eachother (20m distance max), but decided to use attachboat.sqf. What happens is it will exit attachboat.sqf and give you a hint & addAction to execute
   attach2boats.sqf which is equivalent to attachboat.sqf but it's for 2 boats.
   NOTE: IF there is crew inside the boats when using this action (IF YOU PLAN TO USE BOATCARGOSWITCH MAN YOUR BOATS BEFORE USING THIS) it will be added to an array and the crew of the boats will get an option to man their boats again (this should be done BEFORE EJECTING).
   
attach2boats.sqf
 - Equal to attachboat.sqf, you can also execute this if you know you have 2 boats closeby eachother. It does the exact same thing (it also exits the script if it only finds 1 boat, gives you a hint & addAction) as attachboat.sqf.

ejectboat.sqf 
 - The whole eject script for ONE BOAT. Basically does all the fancy magic to eject one boat and kick it off if it has crew inside it, or just give it a slight push if it doesn't so crew can enter. 
   Can't explain whole lots about this script really, not much to say. Except it also parachutes your CRRC out of the Chinook when you're above 25m. You shouldn't do that. Also, have your ramp leveled at all times, or else you get 360s and flips like madness.
   
ejectboats.sqf
 - Same as ejectboat.sqf, but for two boats. Also parachutes out the CRRCs if above 25m. So watch out. Also, the greater the speed the greater the push, especially if crew is inside.
 
boatcargoswitch.sqf
 - So as requested by the community I added this neat little script (thanks to F2k Sel for helping me out a great deal here). Since attachboat.sqf adds every unit to an array (so the crew of boat1 gets their own array, same with boat2, time to feel special :P) this script uses that array and moves everyone back to their positions in the boats. EVERYONE FROM THE BOAT CREW has to execute this action. It gets removed once there is NOBODY in the cargo of the Chinook.
 YES, this will make the action stick around if there is infantry in the Chinook whilst the Spec Ops Team or whoever gets deployed. But, who keeps infantry in their Chinook with 2 boats & 2 teams?
 

 These are the actual scripts. So onto how it works (I'll explain both sides this time, interesting for mission makers / scripters & for the regular folks)
 
How the process works (for scripters):

attachboat.sqf uses an if-statement to define whether or not there is more than one boat within range (using an array of nearestObjects), if yes it exits and executes the other script. (PARENT SCRIPT) 
Both scripts just attach the CRRCs to pre-defined positions and give the Chinook an action, which executes the eject scripts. If crew was inside these boats, boatcargoswitch gets executed. 
This script is just a check to see if there is a driver in any of the boats. If not, get the first unit in the driver seat, rest in cargo. At the end it removes itself if the cargo is empty (checked with emptyPositions "cargo").
The eject scripts work like this:
The boat(s) get moved slightly using attachTo (and a while loop) since setVelocity only causes geometry issues. DO NOT EDIT THESE SCRIPTS, YOU ARE NOT ALLOWED TO USE THIS ANYHOW, AND THIS HAAS BEEN CAREFULLY TESTED.
As soon as that is done, a couple of if-checks kick in to determine speed and height of the Chinook and use setvelocity accordingly. (unlike the ATV script values do not differ here, the ATV script has alot more variety)
As soon as the boats hit the ground it adds an action to them again and repeats the process.

How the process works (for regulars):

You get an action to attach the boat which you added the action to, IF there is a second boat closeby the script will exit, you get a hint which prompts you to execute the action again to execute the proper script.
If you have crew inside the boats (this is required if you want everything to work properly, that means if you have multiple players and want a proper insertion done) they will get moved into the cargo of the Chinook and get an action to move back into the boat (everybody in the Chinook gets this but only they can use this). Once the cargo of the Chinook is empty (THAT MEANS you should NOT have additional infantry in the cargo when planning an insertion) the action gets removed. 
If the boats get ejected with crew inside they'll be faster (15 m/s) to do a proper insertion and enable the player to directly drive without having to start the motor or anything.
If the boat does not have crew (or you planned to move crew into the boats once in the water, which also works), it will move at about 5 m/s, so very slowly. But it will move. So be quick.
Once the boat is on the ground it will conveniently add an action for you to use again.


ISSUES:

As mentioned before the action for moving into the boat will not go away unless the cargo is empty. 
Once the boats are ejected any player left behind will not automatically be moved into the boats. So count your players and make sure everybody is in.

SPECIAL THANKS TO:
F2K Sel. He's been a real help with the eject script and the cargo switch script. Thanks.

INFORMATION ABOUT SCRIPTS, REDISTRIBUTION ETC (I don't like claling it legal disclaimer obviously)

You are NOT allowed to use these scripts in any other way other than designed, that means no use outside of Konyo's MH-47E Addon.
I have no control over Konyo's MH-47E Addon, so any legal disclaimers or anything which can relate to these scripts apply.
IF you want to take a look at these scripts feel free to PM me (tryteyker) on the BI Forums or Armaholic and I will pass you these scripts (probably), BUT FOR LEARNING PURPOSES ONlY)

(hey and just incase this actually gets released as seperate script folder for mission makers, the legal disclaimer doesn't apply, since you have no use for this without konyo's addon anyway..)

ADDITION 2014

The same with the ATV script, this now works for Konyo's MH-47E made in ArmA3, tested with 1.18 and later. Improvements include the boat(s) being detached from the parachute just prior to slipping into the water, to prevent them from possibly flipping.
I've found this script to have some quirks, namely that even pilots will receive the action to move into the boats if it enters a helicopter manned - range is also not considered. Now this isn't gamebreaking, you've just got to be smart about it to not move into the boat as pilot :P
Other than that, this works perfectly fine, if you keep the usual guidelines in mind (straight helicopter when ejecting stuff, for example). So have fun!

ADDITION 31/08/2014

Two new files have been added: description.ext and the functions folder. Both are mandatory to use if you want to use the attachOnStart function. Make sure to copy it all over proper.