--------------------------------------------------------------------------------
-- Module declaration
--

local mod, CL = BigWigs:NewBoss("Vaelastrasz the Corrupt", 469)
if not mod then return end
mod:RegisterEnableMob(13020)
mod.engageId = 611

--------------------------------------------------------------------------------
-- Initialization
--

local adrenalineCount = 0

function mod:GetOptions()
	return {
		{18173, "ICON"} -- Adrenaline
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Adrenaline", 18173)

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

	self:TargetMessage(args.spellId, args.destName, "yellow", "Alarm")
	self:PrimaryIcon(args.spellId, args.destName)
	self:TargetBar(args.spellId, 20, args.destName, 67729, args.spellId) -- Explode
	self:CDBar(18173, 15,  CL.count(self:SpellName(18173), adrenalineCount + 1))
end

