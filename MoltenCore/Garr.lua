
--------------------------------------------------------------------------------
-- Module declaration
--

local mod, CL = BigWigs:NewBoss("Garr", 409)
if not mod then return end
mod:RegisterEnableMob(12057)
mod:SetAllowWin(true)
mod.engageId = 666

--------------------------------------------------------------------------------
-- Locals
--

local fireswornDead = 0

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.firesworn = "Firesworn"
	L.firesworn_desc = "Warn for when a Firesworn is killed."
	L.firesworn_icon = "inv_stone_10"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"firesworn",
		19492, -- Antimagic Pulse
	}
end

function mod:OnEngage()
	fireswornDead = 0
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "Pulse", self:SpellName(19492))

	self:Death("Win", 12057)
	self:Death("FireswornDeaths", 12099)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:FireswornDeaths(args)
	fireswornDead = fireswornDead + 1

	self:Message("firesworn", "green", nil, CL.add_killed:format(fireswornDead, 8), "inv_stone_10")
end

function mod:Pulse(args)
	self:Bar(19492, 18)
end

