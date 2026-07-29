video tutorial on how to build shaders https://drive.google.com/file/d/1OJ6DQsqpc6q6Oh0YTC0Xr6ygSpyzaop0/view?usp=drive_link

<img width="627" height="189" alt="mrwang" src="https://github.com/user-attachments/assets/28170d31-0b6c-4789-a89d-5996bbcee44c" />\
download https://discord.com/channels/844591537430069279/1271123311300055051/1471984616964358174

C:\Users\(name)\wad\launcher-used\Minecraft-1.26.0.2\data\renderer\materials

what happens if you delete these files

Actor.material.bin - disable most entities (horses excluded), decorated pots, conduits, chests, shulker boxes, copper golem, signs, hanging signs, piston head, bell, enchanting table book\
ActorBanner.material.bin - disable only banners\
ActorGlint.material.bin - disable enchanted armor, splash potions

ItemInHandColor.material.bin\
ItemInHandTextured.material.bin\
ItemInHandColorGlint.material.bin\
disable items the player is holding (first person and other players), dropped items

RenderChunk - disable blocks, fog (water, lava, etc)

BlockOutlineSelection.material.bin\
BlockSelectionOutline.material.bin\
BlockSelectionOverlay.material.bin\
BlockSelectionOverlayBlockEntity.material.bin\
disable https://minecraft.wiki/w/Hitbox#Interaction_box only if outline selection is disabled

Cracks.material.bin\
CracksBlockEntity.material.bin\
disable https://minecraft.wiki/w/Breaking progress

FlameBillboard.material.bin\
Flipbook.material.bin\
disable flipbook textures

Particle.material.bin\
Weather.material.bin\
disable particles and rain (doesnt disable lightning)

ShadowOverlay.material.bin\
ShadowVolume.material.bin\
disable entity shadows

EndPortal.material.bin\
Stars.material.bin\
SunMoon.material.bin\
disable endportal, stars, sun and moon

key points\
non solid color (has shading) / solid color (no shading)\
follow light level / fixed light level or ignores light level completely
