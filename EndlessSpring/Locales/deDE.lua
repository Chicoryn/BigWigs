
local L = BigWigs:NewBossLocale("Protectors of the Endless", "deDE")
if not L then return end
if L then
	L.under = "%s unter %s!"
	L.heal = "%s Heilung"
end

L = BigWigs:NewBossLocale("Tsulong", "deDE")
if L then
	L.engage_yell = "Ihr gehört hier nicht hin! Die Wasser müssen beschützt werden... Ich werde euch verteiben oder abschlachten!"
	L.kill_yell = "Ich danke euch Fremde, ihr habt mich befreit."

	L.phases = "Phasen"
	L.phases_desc = "Warnung für Phasenwechsel"

	L.sunbeam_spawn = "Neuer Sonnestrahl!"
end

L = BigWigs:NewBossLocale("Lei Shi", "deDE")
if L then
	L.hp_to_go = "Noch %d%%"

	L.special = "Nächste Spezialfähigkeit"
	L.special_desc = "Warnung für nächste Spezialfähigkeit"

	L.custom_off_addmarker = "Protector Marker"
	L.custom_off_addmarker_desc = "Marks Animated Protectors during Lei Shi's Protect.\n|cFFFF0000Only 1 person in the raid should have this enabled to prevent marking conflicts.|r\n|cFFADFF2FTIP: If the raid has chosen you to turn this on, quickly mousing over all of the Protectors is the fastest way to mark them.|r"
end

L = BigWigs:NewBossLocale("Sha of Fear", "deDE")
if L then
	L.fading_soon = "%s läuft bald ab"

	L.swing = "Hauen"
	L.swing_desc = "Zählt den den Schwüngen vorangehenden Thrash."

	L.throw = "Wurf!"
	L.ball_dropped = "Ball abgeworfen!"
	L.ball_you = "Du hast den Ball!"
	L.ball = "Ball"

	L.cooldown_reset = "Deine Abklingzeiten wurden zurückgesetzt!"

	L.ability_cd = "Fähigkeiten-Abklingzeit"
	L.ability_cd_desc = "Zeigt die nächste(n) mögliche(n) Fähigkeit(en) an."

	L.strike_or_spout = "Stoß oder Fontäne"
	L.huddle_or_spout_or_strike = "Kauern oder Fontäne oder Stoß"
end

