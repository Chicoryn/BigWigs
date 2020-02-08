--------------------------------------------------------------------------------
-- Module declaration
--

local mod, CL = BigWigs:NewBoss("Flamegor", 469)
if not mod then return end
mod:RegisterEnableMob(11981)
mod.engageId = 615

--------------------------------------------------------------------------------
-- Initialization
--

local enrageCount = 0

function mod:GetOptions()
	return {
		23339, -- Wing Buffet
		22539, -- Shadow Flame
		23342 -- Enrage
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "WingBuffet", 23339)
	self:Log("SPELL_CAST_START", "ShadowFlame", 22539)
	self:Log("SPELL_AURA_APPLIED", "Enrage", 23342)
	self:Log("SPELL_DISPEL", "EnrageRemoved", "*")

	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")

	self:Death("Win", 11981)
end

function mod:OnEngage()
	self:Bar(23339, 29) -- Wing Buffet
	enrageCount = 0
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:WingBuffet(args)
	self:Message(args.spellId, "red")
	self:DelayedMessage(args.spellId, 27, "orange", CL.custom_sec:format(args.spellName, 5))
	self:Bar(args.spellId, 32)
end

function mod:ShadowFlame(args)
	self:Message(args.spellId, "red")
end

function mod:Enrage(args)
	enrageCount = enrageCount + 1
	self:Message(args.spellId, "orange", nil, CL.count(args.spellName, enrageCount))
	self:Bar(args.spellId, 10, CL.count(args.spellName, enrageCount + 1))
end

function mod:EnrageRemoved(args)
	if args.extraSpellId == 23342 then
		self:StopBar(23342)
		self:Message(23342, "orange", nil, CL.removed:format(args.extraSpellName))
	end
end

