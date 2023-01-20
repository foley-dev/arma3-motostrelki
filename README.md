# Motostrelki

![Loading screen](https://raw.githubusercontent.com/foley-dev/arma3-motostrelki/assets/screenshots/loading.jpg)

*Assault through objectives as Russian motor rifles*

## About

* Co-op
* Map: **Chernarus (Autumn)**
* Player count: **28**
* Typical duration: **50 min – 2h**
* [Mod dependencies](https://raw.githubusercontent.com/foley-dev/arma3-motostrelki/assets/tour_modset.html) (load into Arma 3 Launcher)

## Scripting highlights

* A "live-action" mission intro cutscene `scripts/server/looters.sqf`
* Surrender action allowing the highest-ranking player to end the mission at any point after they've dropped their weapons 
`scripts/Foley_surrender.sqf`
* Scripted AI behaviour `scripts/server/ai.sqf`
    * Dynamically deployed infantry and vehicles ready to converge on contested objectives (integrated with LAMBS AI mod)
    * Enemy composition and strength configurable in mission parameters
    * Tractors stalking the invading forces
* Audio-visual cues in the game world when each task is completed `scripts/server/tasks.sqf`
* Randomized loadouts representing mismatched equipment and randomized but consistent armbands `scripts/player/loadout.sqf`
* **Dynamic post-processing** to achieve rainy, desaturated effect which gets more and more depressing with time `scripts/player/postProcessing.sqf`

## Screenshots

![Screenshot](https://raw.githubusercontent.com/foley-dev/arma3-motostrelki/assets/screenshots/1.jpg)

![Screenshot](https://raw.githubusercontent.com/foley-dev/arma3-motostrelki/assets/screenshots/2.jpg)

![Screenshot](https://raw.githubusercontent.com/foley-dev/arma3-motostrelki/assets/screenshots/3.jpg)

![Screenshot](https://raw.githubusercontent.com/foley-dev/arma3-motostrelki/assets/screenshots/4.jpg)

![Screenshot](https://raw.githubusercontent.com/foley-dev/arma3-motostrelki/assets/screenshots/5.jpg)


## Playable slots

### Komandir (Platoon HQ)

* Platoon Leader
* Platoon Medic
* BTR Gunner
* BTR Driver - Mechanic

### Adin (Squad 1)

* Squad Leader
* Team Leader
* Autorifleman (RPK)
* Grenadier (RPG-7)
* Grenadier Assistant
* Rifleman - Medic
* BTR Gunner
* BTR Driver - Mechanic

### Dva (Squad 2)

* Squad Leader
* Team Leader
* Autorifleman (RPK)
* Grenadier (RPG-7)
* Grenadier Assistant
* Marksman (SVD)
* BTR Gunner
* BTR Driver - Mechanic

### Tri (Squad 3)

* Squad Leader
* Team Leader
* Autorifleman (RPK)
* Grenadier (RPG-7)
* Grenadier Assistant
* Rifleman - Medic
* BTR Gunner
* BTR Driver - Mechanic
