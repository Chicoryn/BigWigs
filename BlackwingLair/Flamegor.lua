--------------------------------------------------------------------------------
-- Module declaration
--

local mod, CL = BigWigs:NewBoss("Flamegor", 469, 1534)
if not mod then return end
mod:RegisterEnableMob(11981)
<<<<<<< HEAD
mod:SetAllowWin(true)
mod.engageId = 615

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.bossName = "Flamegor"
end
L = mod:GetLocale()
=======
>>>>>>> Move all `mod.toggleOptions` to `mod:GetOptions`

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		23339, -- Wing Buffet
		22539, -- Shadow Flame
<<<<<<< HEAD
		23342, -- Frenzy
	}
end

function mod:OnRegister()
	self.displayName = L.bossName
end

=======
		23342 -- Enrage
	}
end

>>>>>>> Move all `mod.toggleOptions` to `mod:GetOptions`
function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "WingBuffet", self:SpellName(23339))
	self:Log("SPELL_CAST_START", "ShadowFlame", self:SpellName(22539))
	self:Log("SPELL_AURA_APPLIED", "Enrage", self:SpellName(23342))
	self:Log("SPELL_DISPEL", "EnrageRemoved", "*")

	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")

	self:Death("Win", 11981)
end

function mod:OnEngage()
	self:Bar(23339, 29) -- Wing Buffet
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:WingBuffet(args)
	self:Message(23339, "red")
	self:DelayedMessage(23339, 27, "orange", CL.custom_sec:format(args.spellName, 5))
	self:Bar(23339, 32)
end

function mod:ShadowFlame(args)
	self:Message(22539, "red")
end

function mod:Enrage(args)
	self:Message(23342, "orange")
	self:Bar(23342, 10)
end

function mod:EnrageRemoved(args)
	if args.extraSpellName == self:SpellName(23342) then
		self:StopBar(23342)
		self:Message(23342, "orange", nil, CL.removed:format(args.extraSpellName))
	end
end

