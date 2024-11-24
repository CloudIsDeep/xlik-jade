--- 底层技能 隐身
--[[
    使用 Unit:isInvisible() 判断是否隐身
    options = {
        whichUnit 目标单位
        duration 持续时间
        model 点特效路径
    }
]]
---@param options {whichUnit:Unit,duration:number,model:string}|abilityBuffAddon
---@return void
function ability.invisible(options)
    sync.must()
    local whichUnit = options.whichUnit
    if (false == class.isObject(whichUnit, UnitClass) or whichUnit:isDead()) then
        return
    end
    local duration = options.duration or 0
    effector.unit(options.model, whichUnit, 0)
    Buff({
        key = "invisible",
        object = whichUnit,
        signal = buffSignal.up,
        name = options.name,
        icon = options.icon,
        description = options.description,
        duration = duration,
        ---@param buffObj Unit
        purpose = function(buffObj)
            superposition.plus(buffObj, "invisible")
        end,
        ---@param buffObj Unit
        rollback = function(buffObj)
            superposition.minus(buffObj, "invisible")
        end,
    })
end

--[[
    模版技能 取消隐身
    options = {
        whichUnit 目标单位
        model 点特效路径
    }
]]
---@param options {whichUnit:Unit,model:string}
---@return void
function ability.unInvisible(options)
    sync.must()
    local whichUnit = options.whichUnit
    if (false == class.isObject(whichUnit, UnitClass) or whichUnit:isDead()) then
        return
    end
    effector.unit(options.model, whichUnit, 0)
    BuffClear(whichUnit, { key = "invisible" })
end