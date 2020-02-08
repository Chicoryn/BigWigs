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
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

local adrenalineCount = 0

function mod:GetOptions()
	return {
		{18173, "ICON"}, -- Burning Adrenaline
	}
end

function mod:OnRegister()
	self.displayName = L.bossName
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Adrenaline", self:SpellName(18173))

	self:Death("Win", 13020)
end

function mod:OnEngage()
	adrenalineCount = 0

	self:CDBar(18173, 15,  CL.count(self:SpellName(18173), 1))
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Adrenaline(args)
	adrenalineCount = adrenalineCount + 1

	self:TargetMessage(18173, args.destName, "yellow", "Alarm")
	self:PrimaryIcon(18173, args.destName)
	self:TargetBar(18173, 20, args.destName, 67729, 18173) -- Explode
	self:CDBar(18173, 15,  CL.count(self:SpellName(18173), adrenalineCount + 1))
end

