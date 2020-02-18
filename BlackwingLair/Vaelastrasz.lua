--------------------------------------------------------------------------------
-- Module declaration
--

local mod, CL = BigWigs:NewBoss("Vaelastrasz the Corrupt", 469)
if not mod then return end
mod:RegisterEnableMob(13020)
mod:SetAllowWin(true)
mod.engageId = 611

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.bossName = "Vaelastrasz the Corrupt"
	L.pull_trigger = "Too late, friends! Nefarius' corruption has taken hold...I cannot...control myself."

	L.engage = "Engage"
	L.engage_bar = "Pull"
	L.engage_desc = "Warn for when combat starts."
	L.engage_icon = "spell_fire_fireball02"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

local adrenalineCount = 0

function mod:GetOptions()
	return {
		{18173, "ICON"}, -- Burning Adrenaline
		"engage",
	}
end

function mod:OnRegister()
	self.displayName = L.bossName
end

function mod:OnBossEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:Log("SPELL_AURA_APPLIED", "Adrenaline", self:SpellName(18173))

	self:Death("Win", 13020)
end

function mod:OnEngage()
	adrenalineCount = 0

	self:CDBar(18173, 15,  CL.count:format(self:SpellName(18173), 1))
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:CHAT_MSG_MONSTER_YELL(_, msg)
	if msg:find(L.pull_trigger) then
		self:Bar("engage", 43, L.engage_bar, L.engage_icon)
	end
end

function mod:Adrenaline(args)
	adrenalineCount = adrenalineCount + 1

	self:TargetMessage(18173, args.destName, "yellow", "Alarm")
	self:PrimaryIcon(18173, args.destName)
	self:CDBar(18173, 15,  CL.count:format(self:SpellName(18173), adrenalineCount + 1))
	self:TargetBar(18173, 20, args.destName) -- Explode
end

