# The Legend of Zelda: The Minish Cap - EU Backport
This is the source code for a The Legend of Zelda: The Minish Cap mod that I
made in 2013, which adds some changes from the North American release of the
game back into the European version, which was released several months earlier.
It has been updated to work with newer versions of ARMIPS.

If you're looking for the IPS patch, you can [download it from RHDN here.](https://www.romhacking.net/hacks/1714/)

To build, place a Zelda Minish Cap EU ROM named `input.gba` in the `_rom`
folder, as well as an ARMIPS executable `armips.exe` in the root folder, and run
`make.bat`. This has been tested with ARMIPS v0.10.0-53-g8189eae (2019-09-21).

---

## Introduction
The Legend of Zelda: The Minish Cap for the Game Boy Advance was first released
in Europe, and subsequently in Japan and North America. Since the European
version was an earlier build, there are various differences between it and the
later versions.

This patch backports the most important differences to the European version: the
third bomb bag upgrade, the fix for Eenie's Kinstone fusion and calling Zeffa
from the rooftop of the tower at Cloud Tops.

The third bomb bag not appearing in the shop is not a glitch; there is no text
or object placement data for it. I've added translations for all the different
European languages based on the Boomerang's text (which is how it was done in
the North American and Japanese versions). As for the Kinstone glitch, it is
caused by the dev team forgetting to check the fusion result before marking it
as finished in Eenie and Meenie's NPC scripts.

The bomb bag upgrade saves, and you can transfer your save to your physical
cartridge afterwards to keep it. However, this won't re-enable Eenie's Kinstone
fusion if you already missed it.

## Features
 -  The third Bomb Bag upgrade has been added, which lets you carry up to 99
    Bombs. It can be purchased from Stockwell's store after obtaining the third
    wallet upgrade and buying the Boomerang.
 -  Eenie's Kinstone fusion glitch has been fixed. In the European version, if
    you initiate a Kinstone fusion with Eenie but then cancel it, you can never
    try it again, and you won't be able to get the fourth Bottle, the Mirror
    Shield and the final Kinstone fusions.
 -  The Ocarina of Wind can now be used from the rooftop of the Wind Tribe's
    Tower in Cloud Tops (where the entrance to the Palace of Winds is).

## How to Use:
Apply the IPS file to a clean European The Legend of Zelda: The Minish Cap ROM
using your favorite IPS patching tool. The ROM should have a CRC32 of E8637292.
I recommend Lunar IPS, version 1.02 by FuSoYa for Windows users.