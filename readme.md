bCombat AI MOD v0.16 [SP] for ARMA3
DEVELOPMENT BUILD
=========================================

WARNING
-----------------------------------------

Latest Stable version of bCombat is available here:

+   http://forums.bistudio.com/showthread.php?171436-OPEN-BETA-SP-bCombat-infantry-AI-Mod

Please avoid directly installing GitHub project sources, unless you exactly know what you're doing.


INTRODUCTION
-----------------------------------------

bCombat is an ArmA 3 infantry AI enhancement mod in form of addon, still under development.
It's currently Single Player. CBA is this only requirement.


REQUIREMENTS
-----------------------------------------

+   Download and install latest CBA distribution, get it from here: http://dev-heaven.net/projects/cca/files


INSTALLATION
-----------------------------------------

Please remove any existing bCombat installations:
delete "@bcombat" folder as well as "userconfig\bcombat_config.hpp" configuration file.

+   Extract the bCombat zip package anywhere.
+  [Users downloading mod from GitHub]: you have to rename "bCombat-master" folder to "@bcombat"
+   Move "@bcombat" folder from extraction location to your ArmA 3 main folder ( usually: <Your Steam Path>\steamapps\common\Arma 3\ )
+   Move "userconfig" folder from "@bcombat" folder to your ArmA 3 main folder.

	Please doublecheck "bcombat_config.hpp" file exists within the path:
  
		<Your Arma 3 main folder>\userconfig\bcombat\bcombat_config.hpp

+   Launch ArmA 3 and activate bCombat from "Configure / Expansions" menu.



DESCRIPTION
-----------------------------------------

bCombat aims to achieve both a more aware and human-alike infantry AI.
It features an unique ecosystem, including an event-driven AI morale / skill system as well as many optional AI enhancements.

Highlights:

+	Morale system driving dynamically AI behavour and skills.
+	AI behaviour is affected by many environmental events (spotted enemies, explosions, bullets whizzling by, ricochets, wounds, casualties, ...).
+	Modular mod architecture: optional features may be toggled on/off or tweaked at will.
+   Reduced (excessive) AI firing accuracy.
+   AI units proactively lay suppressive fire and suffer sensible morale / skill penalty when suppressed.
+   Increased AI survivability: better use of cover, movement and suppressive fire lead to longer firefights. 
+	Player led AI units require far less micro-management on the battlefield.


FEATURES
-----------------------------------------

Core features include:

+   Full-featured morale system: morale affects both AI behaviour and combat effectiveness. AI will act aggressively or passively depending on circumstances.
+   Event driven AI behaviour: any environmental events such as enemies inbound, heard gunfire, suppressive fire, nearby explosions and ricochets or casualties have an effect on AI behaviour.
+   Real-time suppression effects: bCombat relies on (included) bDetect framework for accessing real-time ballistic information on any bullets flying by on the battlefield.
+   Automatic, gunfire aware stance handling: units will crouch, sprint or go prone according to situation
+   Enhanced fire & movement routines

Optional (toggleable) features include, as of v0.15:

+   Custom move to cover behaviour
+   Aggressive return fire / fire back behaviour
+   Mutual covering behaviour
+   Suppressive fire behaviour
+   Specialized suppressive / overwatch behaviour
+   Custom fleeing behaviour
+   Surrendering behaviour
+   CQB enhancements
+   Enhanced hearing: units do hear gunfire and explosions at distance
+   Investigate behaviour: units alerted by casualties or gunfire may move to nearby places to investigate enemy presence
+   Enhanced grenade throwing: very short to long distance, includes blind throwing over obstacles
+   Smoke grenade throwing
+   Automatic formation tightening feature
+   Faster movement feature
+   Friendly fire damage capping
+ 	Custom damage multiplier
+   And more ...

All this is delivered pre-configured and ready to go, while it can be tweaked at will via its own configuration file (config.sqf).


FORUM THREAD
-----------------------------------------

+   http://forums.bistudio.com/showthread.php?171436-OPEN-BETA-SP-bCombat-infantry-AI-Mod


SCREENHOTS
-----------------------------------------

+   https://dl-web.dropbox.com/get/Public/careful.jpg?w=AADzxJyXlsdJbmRb2Db3jdUdobPcPgBlMXDR07sf3HY1Yg
+   https://dl-web.dropbox.com/get/Public/go.jpg?w=AACqMXzYSDCLlWpqai1hGdGCjZVP9IMscxTLGnR4K9eudw
+   https://dl-web.dropbox.com/get/Public/grenade2.jpg?w=AABqPlPntP9Hu7x-N0I7tdChqhXlnfgIoxc9e3EtT18dlg


VIDEOS
----------------------------------------

+   http://www.youtube.com/watch?v=vGKy2fEPwD8
+   http://www.youtube.com/watch?v=GZ3PC-mrGE4
+   http://www.youtube.com/watch?v=8u8bUqCppG4


CREDITS
----------------------------------------

bCombat was created by Fabrizio_T.
It's dedicated to the OFP/ARMA community and to BIS.
This mod wouldn't have seen the light without the support of the testers:

+   Mustangdelta
+   Lordprimate
+   ebarstad 
+   TheCapulet 
+   Mr_Centipede 
+   Katipo66
+   gammadust
+   RAINF
+   gagi
+   Kremator
+   SavageCDN 
+   stun
+   froggyluv
+   The Hebrew Hammer
+   bravo409
+   GDSN
+   willywonka

A final thanks to talented modders who over time inspired this work:

+   TonyRanger
+   Kronzky
+   Monsada
+   Solus
+   SNKMAN
+   Rg7621
+   Protegimus 
+   Sickboy
+	zGuba


FEEDBACK
----------------------------------------

Any constructive feedback is welcome, as long as expressed in polite and mature manner.


DISCLAIMER
----------------------------------------

The modification is provided as is, without warranty of any kind.
Author is not responsible for any direct, indirect, incidental or consequential damage of any kind, without limitation.