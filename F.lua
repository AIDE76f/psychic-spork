--[[
    BANK TYCOON: FAST PRODUCTION SCRIPT
    Target: Sets all Staff/Employee production speed to 0.1s
]]

local targetSpeed = 0.1
local targetName = "ProductionSpeed" -- الاسم الشائع لقيمة السرعة في مابات التايكون

local function optimizeStaff()
    for _, item in ipairs(workspace:GetDescendants()) do
        -- البحث عن الموظفين أو الآلات التي تحتوي على قيمة سرعة الإنتاج
        if item.Name == targetName and (item:IsA("NumberValue") or item:IsA("IntValue")) then
            if item.Value ~= targetSpeed then
                local oldVal = item.Value
                item.Value = targetSpeed
                print(`[!] تم تسريع الموظف: من {oldVal} إلى {targetSpeed} في {item:GetFullName()}`)
            end
        end
    end
end

-- تشغيل الفحص فور تشغيل السكربت
optimizeStaff()

-- مراقبة الماب: إذا اشتريت موظف جديد، سيتم تعديله تلقائياً
workspace.DescendantAdded:Connect(function(newObject)
    if newObject.Name == targetName and (newObject:IsA("NumberValue") or newObject:IsA("IntValue")) then
        task.wait(0.5) -- انتظار بسيط للتأكد من تحميل القيمة في الماب
        newObject.Value = targetSpeed
        print(`[+] تم تعديل سرعة الموظف الجديد تلقائياً: {newObject:GetFullName()}`)
    end
end)

print("Your Bank! Speed Hack Loaded Successfully.")
