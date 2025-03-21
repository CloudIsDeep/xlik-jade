--- 恢复生命监听器
---@param obj Unit
monitor.create(
    "hp_regen",
    0.2,
    function(obj)
        local regen = 0.2 * obj:hpRegen()
        local v = 0
        if (regen >= 0) then
            obj:hpCur("+=" .. regen)
        else
            obj:hpCur("-=" .. regen)
        end
    end,
    function(obj)
        return obj:isDead() or nil == obj:hpRegen() or 0 == obj:hpRegen()
    end)

--- 恢复魔法监听器
---@param obj Unit
monitor.create(
    "mp_regen",
    0.3,
    function(obj)
        local regen = 0.3 * obj:mpRegen()
        local v = 0
        if (regen >= 0) then
            obj:mpCur("+=" .. regen)
        else
            obj:mpCur("-=" .. regen)
        end
    end,
    function(obj)
        return obj:isDead() or nil == obj:mpRegen() or 0 == obj:mpRegen()
    end)