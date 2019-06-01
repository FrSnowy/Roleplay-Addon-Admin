function DM_REGISTER_COMMANDS()
    local function recieveTargetName ()
        return UnitName("target") or nil;
    end;

    local function NotifyPrivate (prefix, target, value)
        if (target == nil) then print("У вас нет цели");
        else SendAddonMessage(prefix..' '..value, nil, "WHISPER", target);
        end;
    end;

    local function NotifyParty (prefix, target, value)
        SendAddonMessage(prefix..' '..value, nil, "RAID");
    end;

    local function RegisterExperienceCommands()
        SlashCmdList['giveExpCommand'] = function(msg)
            NotifyPrivate("S1", recieveTargetName(), msg or 0);
        end;
        SlashCmdList['giveExpCommandRaid'] = function(msg)
            NotifyParty("S1", recieveTargetName(), msg or 0);
        end;

        SLASH_giveExpCommand1 = '/give_exp';
        SLASH_giveExpCommandRaid1 = '/give_exp_raid';
        SLASH_giveExpCommandRaid2 = '/give_exp_r';
    end;

    local function RegsterLevelControllCommanads()
        SlashCmdList['setLevelCommand'] = function(msg)
            NotifyPrivate('S2', recieveTargetName(), msg or nil);
        end;

        SLASH_setLevelCommand1 = '/set_level';
    end;

    local function RegsterInfoCommand()
        SlashCmdList['getInfoCommand'] = function(msg)
            NotifyPrivate('S3', recieveTargetName(), UnitName("player"));
        end;

        SLASH_getInfoCommand1 = '/get_info';
    end;

    local function RegisterHealthControllCommands()
        SlashCmdList['setHealthCommand'] = function(msg)
            NotifyPrivate('S4', recieveTargetName(), msg or nil);
        end;

        SLASH_setHealthCommand1 = '/add_health';
        SLASH_setHealthCommand2 = '/add_hp';
    end;

    local function RegisterBattleControllCommands()
        SlashCmdList['startBattleCommand'] = function(msg)
            NotifyPrivate('S5', recieveTargetName(), 1);
        end;
        SlashCmdList['startBattleCommandRaid'] = function(msg)
            NotifyParty("S5", recieveTargetName(), 1);
        end;
        SlashCmdList['endBattleCommand'] = function(msg)
            NotifyPrivate('S5', recieveTargetName(), 0);
        end;
        SlashCmdList['endBattleCommandRaid'] = function(msg)
            NotifyParty("S5", recieveTargetName(), 0);
        end;

        SLASH_startBattleCommand1 = '/battle_start';
        SLASH_endBattleCommand1 = '/battle_end';
        SLASH_startBattleCommandRaid1 = '/battle_start_raid';
        SLASH_startBattleCommandRaid2 = '/battle_start_r';
        SLASH_endBattleCommandRaid1 = '/battle_end_raid';
        SLASH_endBattleCommandRaid2 = '/battle_end_r';
    end;

    local function RegisterRestoreHPCommand()
        SlashCmdList['restoreHpCommand'] = function(msg)
            NotifyPrivate('S6', recieveTargetName(), msg or nil);
        end;

        SlashCmdList['restoreHpCommandRaid'] = function(msg)
            NotifyParty('S6', recieveTargetName(), msg or nil);
        end;

        SLASH_restoreHpCommand1 = '/restore_health';
        SLASH_restoreHpCommand2 = '/restore_hp';
        SLASH_restoreHpCommand3 = '/res_health';
        SLASH_restoreHpCommand4 = '/res_hp';
        SLASH_restoreHpCommandRaid1 = '/restore_health_raid';
        SLASH_restoreHpCommandRaid2 = '/restore_hp_raid';
        SLASH_restoreHpCommandRaid3 = '/res_health_raid';
        SLASH_restoreHpCommandRaid4 = '/res_hp_raid';
        SLASH_restoreHpCommandRaid5 = '/restore_health_r';
        SLASH_restoreHpCommandRaid6 = '/restore_hp_r';
        SLASH_restoreHpCommandRaid7 = '/res_health_r';
        SLASH_restoreHpCommandRaid8 = '/res_hp_r';
    end;

    local function RegisterMusicCommands()
        local function isAllFilled(msg, category, trackNumber)
            if (msg == '') then
                print('Не указана категория и номер трека');
                return false;
            end;

            if (not(category == 'tvr') and not(category == 'epc') and not(category == 'pcf') and not(category == 'dng') and not(category == 'btl')) then
                print('Неверная категория. Доступные: tvr, epc, pcf, dng, btl');
                return false;
            end;

            local tracksByCategory = {
                tvr = 10,
                epc = 10,
                pcf = 11,
                btl = 12,
                dng = 13,
            };

            if (tonumber(trackNumber) < 1 or tonumber(trackNumber) > tracksByCategory[category]) then
                print ('Неверный номер трека');
                return false;
            end;

            return true;
        end;
        SlashCmdList['playMusicCommand'] = function(msg)
            local category, trackNumber = strsplit(' ', msg);
            if (isAllFilled(msg, category, trackNumber)) then NotifyPrivate('S7', recieveTargetName(), category..'_'..trackNumber) end;
        end;

        SlashCmdList['playMusicCommandRaid'] = function(msg)
            local category, trackNumber = strsplit(' ', msg);
            if (isAllFilled(msg, category, trackNumber)) then NotifyParty('S7', recieveTargetName(), category..'_'..trackNumber) end;
        end;

        SlashCmdList['stopMusicCommand'] = function(msg)
            NotifyPrivate('S8', recieveTargetName(), '');
        end;

        SlashCmdList['stopMusicCommandRaid'] = function(msg)
            NotifyParty('S8', recieveTargetName(), '');
        end;
        SLASH_playMusicCommand1 = '/play_music';
        SLASH_playMusicCommandRaid1 = '/play_music_raid';
        SLASH_playMusicCommandRaid2 = '/play_music_r';
        SLASH_stopMusicCommand1 = '/stop_music';
        SLASH_stopMusicCommandRaid1 = '/stop_music_raid';
        SLASH_stopMusicCommandRaid2 = '/stop_music_r';
    end;

    local function RegisterBarrierCommands()
        SlashCmdList['setBarrierCommand'] = function(msg)
            NotifyPrivate('S9', recieveTargetName(), msg or nil);
        end;

        SlashCmdList['setBarrierCommandRaid'] = function(msg)
            NotifyParty('S9', recieveTargetName(), msg or nil);
        end;

        SLASH_setBarrierCommand1 = '/add_barrier';
        SLASH_setBarrierCommand2 = '/add_br';

        SLASH_setBarrierCommandRaid1 = '/add_barrier_raid';
        SLASH_setBarrierCommandRaid2 = '/add_barrier_r';
        SLASH_setBarrierCommandRaid3 = '/add_br_raid';
        SLASH_setBarrierCommandRaid4 = '/add_br_r';
    end;

    local function RegisterDamageCommands()
        SlashCmdList['damageCommand'] = function(msg)
            local damage = math.abs(tonumber(msg));
            NotifyPrivate('S10', recieveTargetName(), damage);
        end;

        SlashCmdList['damageCommandRaid'] = function(msg)
            local damage = math.abs(tonumber(msg));
            NotifyParty('S10', recieveTargetName(), damage);
        end;

        SLASH_damageCommand1 = '/damage';
        SLASH_damageCommand2 = '/dmg';

        SLASH_damageCommandRaid1 = '/damage_raid';
        SLASH_damageCommandRaid2 = '/damage_r';
        SLASH_damageCommandRaid3 = '/dmg_raid';
        SLASH_damageCommandRaid4 = '/dmg_r';
    end;

    local function RegisterKickCommands()
        SlashCmdList['kickCommand'] = function(msg)
            NotifyPrivate('SK', recieveTargetName(), '');
        end;

        SLASH_kickCommand1 = '/gamekick';
    end;

    local function RegisterEffectCommands()
        local function isAllFilled(msg, category, trackNumber)
            if (msg == '') then
                print('Не указана категория и номер эффекта');
                return false;
            end;

            if (not(category == 'whisper') and not(category == 'scream')) then
                print('Неверная категория. Доступные: whisper, scream');
                return false;
            end;

            local tracksByCategory = {
                whisper = 3,
                scream = 2,
            };

            if (tonumber(trackNumber) < 1 or tonumber(trackNumber) > tracksByCategory[category]) then
                print ('Неверный номер эффекта');
                return false;
            end;

            return true;
        end;

        SlashCmdList['effectCommand'] = function(msg)
            local category, trackNumber = strsplit(' ', msg);
            if (isAllFilled(msg, category, trackNumber)) then NotifyPrivate('S11', recieveTargetName(), category..'_'..trackNumber) end;
        end;
        
        SlashCmdList['effectCommandRaid'] = function(msg)
            local category, trackNumber = strsplit(' ', msg);
            if (isAllFilled(msg, category, trackNumber)) then NotifyParty('S11', recieveTargetName(), category..'_'..trackNumber) end;
        end;

        SLASH_effectCommand1 = '/play_effect';
        SLASH_effectCommand2 = '/play_ef';
        SLASH_effectCommandRaid1 = '/play_effect_raid';
        SLASH_effectCommandRaid2 = '/play_effect_r';
        SLASH_effectCommandRaid3 = '/play_ef_raid';
        SLASH_effectCommandRaid4 = '/play_ef_r';
    end;

    RegisterExperienceCommands();
    RegsterLevelControllCommanads();
    RegsterInfoCommand();
    RegisterHealthControllCommands();
    RegisterBattleControllCommands();
    RegisterRestoreHPCommand();
    RegisterMusicCommands();
    RegisterBarrierCommands();
    RegisterDamageCommands();
    RegisterKickCommands();
    RegisterEffectCommands();
end;

function DM_REGISTER_PANELS()
    local texts = {
        panels = {
            main = {
                title = "Сюжеты",
            },
            addPlot = {
                content = "Добавить",
            },
            plot = {
                title = "Новый сюжет",
                name = "Название сюжета:",
                description = "Краткое описание:",
                submit = "Сохранить",
            },
        },
    };

    STIK_MAIN_PANEL_OFFSET = 0;

    local function createAddPlotPanel(parent)
        local AddPlotPanel = CreateFrame("Button", "AddPlotPanel", parent);
            AddPlotPanel:Show();
            AddPlotPanel:EnableMouse();
            AddPlotPanel:SetWidth(256);
            AddPlotPanel:SetHeight(64);
            AddPlotPanel:SetToplevel(true);
            AddPlotPanel:SetBackdropColor(0, 0, 0, 1);
            AddPlotPanel:SetFrameStrata("FULLSCREEN_DIALOG");
            AddPlotPanel:SetPoint("CENTER", parent, "TOP", 0, -260);
            AddPlotPanel:SetNormalTexture("Interface\\AddOns\\STIK_DM\\IMG\\panel-background.blp");
            AddPlotPanel:SetHighlightTexture("Interface\\AddOns\\STIK_DM\\IMG\\panel-background-hover.blp");
            AddPlotPanel:SetScript("OnClick", function() AddPlotView:Show(); end);

        local AddPlotIcon = CreateFrame("Button", "AddPlotPanelIcon", AddPlotPanel);
            AddPlotIcon:Show();
            AddPlotIcon:SetWidth(16);
            AddPlotIcon:SetHeight(16);
            AddPlotIcon:SetToplevel(true);
            AddPlotIcon:SetBackdropColor(0, 0, 0, 1);
            AddPlotIcon:SetFrameStrata("FULLSCREEN_DIALOG");
            AddPlotIcon:SetPoint("LEFT", AddPlotPanel, "LEFT", 16, -8);
            AddPlotIcon:SetNormalTexture("Interface\\AddOns\\STIK_DM\\IMG\\add.blp");

        local AddPlotText = AddPlotPanel:CreateFontString(nil, "OVERLAY", "GameFontHighlight");
            AddPlotText:SetPoint("LEFT", AddPlotPanel, "LEFT", 48, -8);
            AddPlotText:SetText(texts.panels.addPlot.content);
            AddPlotText:Show();

        return AddPlotPanel;
    end;

    local function createPlotPanel(parent, plot, index)
        local PlotPanel = CreateFrame("Button", "AddPlotPanel", parent);
            PlotPanel:Show();
            PlotPanel:EnableMouse();
            PlotPanel:SetWidth(226);
            PlotPanel:SetHeight(64);
            PlotPanel:SetToplevel(true);
            PlotPanel:SetBackdropColor(0, 0, 0, 1);
            PlotPanel:SetFrameStrata("FULLSCREEN_DIALOG");
            PlotPanel:SetPoint("CENTER", parent, "TOP", 0, -60 - 45 * (index - 1 - STIK_MAIN_PANEL_OFFSET));
            PlotPanel:SetNormalTexture("Interface\\AddOns\\STIK_DM\\IMG\\plot-background.blp");
            PlotPanel:SetHighlightTexture("Interface\\AddOns\\STIK_DM\\IMG\\plot-background.blp");

        local PlotName = PlotPanel:CreateFontString(nil, "OVERLAY", "GameFontHighlight");
            PlotName:SetPoint("LEFT", PlotPanel, "LEFT", 0, -8);
            PlotName:SetText(plot.name);
            PlotName:Show();
    end;

    local function createMainPanel()
        if (MainPanelSTIK_DM) then
            MainPanelSTIK_DM:Hide();
        end;

        local MainPanelSTIK_DM = CreateFrame("Frame", "MainPanelSTIK_DM", UIParent);
            MainPanelSTIK_DM:Show();
            MainPanelSTIK_DM:EnableMouse();
            MainPanelSTIK_DM:SetWidth(320);
            MainPanelSTIK_DM:SetHeight(320);
            MainPanelSTIK_DM:SetToplevel(true);
            MainPanelSTIK_DM:SetBackdropColor(0, 0, 0, 1);
            MainPanelSTIK_DM:SetFrameStrata("FULLSCREEN_DIALOG");
            MainPanelSTIK_DM:SetPoint("CENTER", UIParent, "CENTER", 0, 0);
            MainPanelSTIK_DM:SetBackdrop({
                bgFile = "Interface\\AddOns\\STIK_DM\\IMG\\main-panel-background.blp",
                edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
                tile = false, tileSize = 32, edgeSize = 32,
                insets = { left = 12, right = 12, top = 12, bottom = 12 },
            });

        local MainPanelTitle = MainPanelSTIK_DM:CreateFontString(nil, "OVERLAY", "GameFontHighlight");
            MainPanelTitle:SetPoint("CENTER", MainPanelSTIK_DM, "TOP", 0, -25);
            MainPanelTitle:SetText(texts.panels.main.title);
            MainPanelTitle:SetFontObject(GameFontNormal);
            MainPanelTitle:SetTextHeight(14);
            MainPanelTitle:Show();

        local DMCloseButton = CreateFrame("Button", "DMCloseButton", MainPanelSTIK_DM, "UIPanelButtonTemplate");
            DMCloseButton:SetPoint("CENTER", AddPlotView, "TOP", 130, -25);
            DMCloseButton:SetHeight(24);
            DMCloseButton:SetWidth(32);
            DMCloseButton:SetText('x');
            DMCloseButton:RegisterForClicks("AnyUp");
            DMCloseButton:SetScript("OnClick", function() MainPanelSTIK_DM:Hide(); end);

        if (#plots > 4) then
            local scrollBar = CreateFrame("Slider", nil, MainPanelSTIK_DM, "UIPanelScrollBarTemplate")
            scrollBar:SetPoint("RIGHT", MainPanelSTIK_DM, "RIGHT", -10, 19);
            AddPlotView:EnableMouse();
            scrollBar:SetSize(30, 140);
            scrollBar:SetMinMaxValues(0, #plots - 4);
            scrollBar:SetValueStep(1);
            scrollBar:SetValue(STIK_MAIN_PANEL_OFFSET);
            
            scrollBar:SetScript("OnValueChanged", function(self, value)
                STIK_MAIN_PANEL_OFFSET = value;
                MainPanelSTIK_DM:Hide();
                MainPanelSTIK_DM = createMainPanel();
            end)
        end;        

        createAddPlotPanel(MainPanelSTIK_DM);
        if (#plots > 0) then
            for index = 1 + STIK_MAIN_PANEL_OFFSET, 4 + STIK_MAIN_PANEL_OFFSET do
                print(plots[index].id);
                createPlotPanel(MainPanelSTIK_DM, plots[index], index);
            end;
        end;

        return MainPanelSTIK_DM;
    end;
  
    local function createAddPlotView()
        AddPlotView = CreateFrame("Frame", "AddPlotView", UIParent);
            AddPlotView:Hide();
            AddPlotView:EnableMouse();
            AddPlotView:SetWidth(320);
            AddPlotView:SetHeight(320);
            AddPlotView:SetToplevel(true);
            AddPlotView:SetBackdropColor(0, 0, 0, 1);
            AddPlotView:SetFrameStrata("FULLSCREEN_DIALOG");
            AddPlotView:SetPoint("CENTER", UIParent, "CENTER", 0, 0);
            AddPlotView:SetBackdrop({
                bgFile = "Interface\\AddOns\\STIK_DM\\IMG\\plot-panel-background.blp",
                edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
                tile = false, tileSize = 32, edgeSize = 32,
                insets = { left = 12, right = 12, top = 12, bottom = 12 },
            });

        local AddPlotViewTitle = AddPlotView:CreateFontString(nil, "OVERLAY", "GameFontHighlight");
            AddPlotViewTitle:SetPoint("CENTER", AddPlotView, "TOP", 0, -25);
            AddPlotViewTitle:SetText(texts.panels.plot.title);
            AddPlotViewTitle:SetTextHeight(14);
            AddPlotViewTitle:Show();

        local AddPlotViewCloseButton = CreateFrame("Button", "AddPlotViewCloseButton", AddPlotView, "UIPanelButtonTemplate");
            AddPlotViewCloseButton:SetPoint("CENTER", AddPlotView, "TOP", 130, -25);
            AddPlotViewCloseButton:SetHeight(24);
            AddPlotViewCloseButton:SetWidth(32);
            AddPlotViewCloseButton:SetText('x');
            AddPlotViewCloseButton:RegisterForClicks("AnyUp");
            AddPlotViewCloseButton:SetScript("OnClick", function() AddPlotView:Hide(); end);

        local AddPlotViewNameInputLabel = AddPlotView:CreateFontString(nil, "OVERLAY", "GameFontHighlight");
            AddPlotViewNameInputLabel:SetPoint("TOPLEFT", AddPlotView, "TOP", -133, -70);
            AddPlotViewNameInputLabel:SetText(texts.panels.plot.name);
            AddPlotViewNameInputLabel:Show();

        local AddPlotViewNameInput = CreateFrame("EditBox", "AddPlotViewNameInput", AddPlotView, "InputBoxTemplate");
            AddPlotViewNameInput:SetAutoFocus(false)
            AddPlotViewNameInput:Show();
            AddPlotViewNameInput:SetWidth(256);
            AddPlotViewNameInput:SetHeight(32);
            AddPlotViewNameInput:SetToplevel(true);
            AddPlotViewNameInput:SetPoint("CENTER", AddPlotView, "TOP", 0, -94);
            AddPlotViewNameInput:SetTextInsets(2, 0, 0, 0);
            AddPlotViewNameInput:SetMaxLetters(26);
            AddPlotViewNameInput:SetBackdrop({
                bgFile = [[Interface\Buttons\WHITE8x8]],
                insets = {left = -1, right = 1, top = 8, bottom = 8},
            })
            AddPlotViewNameInput:SetBackdropColor(0, 0, 0)
            AddPlotViewNameInput:SetScript("OnTabPressed", function() AddPlotViewDescriptionInput:SetFocus(); end)

        local AddPlotViewDescriptionInputLabel = AddPlotView:CreateFontString(nil, "OVERLAY", "GameFontHighlight");
            AddPlotViewDescriptionInputLabel:SetPoint("TOPLEFT", AddPlotView, "TOP", -133, -125);
            AddPlotViewDescriptionInputLabel:SetText(texts.panels.plot.description);
            AddPlotViewDescriptionInputLabel:Show();

        local AddPlotViewDescriptionInput = CreateFrame("EditBox", "AddPlotViewDescriptionInput", AddPlotView);
            AddPlotViewDescriptionInput:SetMultiLine(true);
            AddPlotViewDescriptionInput:SetSize(264, 100)
            AddPlotViewDescriptionInput:SetPoint("TOP", AddPlotView, "TOP", -3, -138)
            AddPlotViewDescriptionInput:SetAutoFocus(false);
            AddPlotViewDescriptionInput:SetFont("Fonts\\FRIZQT__.TTF", 12)
            AddPlotViewDescriptionInput:SetJustifyH("LEFT")
            AddPlotViewDescriptionInput:SetJustifyV("CENTER")
            AddPlotViewDescriptionInput:SetTextInsets(8, 8, 4, 4);
            AddPlotViewDescriptionInput:SetMaxLetters(200);
            AddPlotViewDescriptionInput:SetBackdrop({
                bgFile = [[Interface\Buttons\WHITE8x8]],
                edgeFile = [[Interface\Tooltips\UI-Tooltip-Border]],
                edgeSize = 14,
                insets = {left = 3, right = 3, top = 3, bottom = 3},
            });
            AddPlotViewDescriptionInput:SetBackdropColor(0, 0, 0);
            AddPlotViewDescriptionInput:SetBackdropBorderColor(0.3, 0.3, 0.3);
            AddPlotViewDescriptionInput:SetScript("OnEscapePressed", function() AddPlotViewDescriptionInput:ClearFocus(); end);
            AddPlotViewDescriptionInput:SetScript("OnTabPressed", function() AddPlotViewNameInput:SetFocus(); end);

        local AddPlotViewCreateButton = CreateFrame("Button", "AddPlotViewCreateButton", AddPlotView, "UIPanelButtonTemplate");
            AddPlotViewCreateButton:SetPoint("CENTER", AddPlotView, "TOP", 80, -282);
            AddPlotViewCreateButton:SetHeight(36);
            AddPlotViewCreateButton:SetWidth(92);
            AddPlotViewCreateButton:SetText(texts.panels.plot.submit);
            AddPlotViewCreateButton:RegisterForClicks("AnyUp");
            AddPlotViewCreateButton:SetScript("OnClick", function()
                local plotInfo = {
                    id = UnitName("player").."-"..(#plots + 1).."-"..math.random(999999),
                    name = AddPlotViewNameInput:GetText(),
                    description = AddPlotViewDescriptionInput:GetText(),
                    players = { },
                };

                if (plotInfo.name == '') then
                    AddPlotViewNameInputLabel:SetText(texts.panels.plot.name..' (Не должно быть пустым!)');
                    return nil;
                else AddPlotViewNameInputLabel:SetText(texts.panels.plot.name);
                end;

                if (plotInfo.description == '') then
                    AddPlotViewDescriptionInputLabel:SetText(texts.panels.plot.description..' (Не должно быть пустым!)');
                    return nil;
                else AddPlotViewDescriptionInputLabel:SetText(texts.panels.plot.description);
                end;
                table.insert(plots, plotInfo);
                AddPlotView:Hide();
                MainPanelSTIK_DM = createMainPanel();
                AddPlotViewNameInput:SetText('');
                AddPlotViewDescriptionInput:SetText('');
            end);
    end;

    createAddPlotView();
    MainPanelSTIK_DM = createMainPanel();
end;

function DMAddonReady()
    plots = plots or { };
    if (#plots > 0) then print(plots[1].name) else print('EMPTY') end;
    DM_REGISTER_COMMANDS();
    DM_REGISTER_PANELS();
end;

STIKDMMiniMapButtonPosition = {
	locationAngle = -45,
	x = 52-(80*cos(-45)),
	y = ((80*sin(-45))-52)
};

function STIK_DM_MiniMapButtonPosition_LoadFromDefaults()
	STIKButton:SetPoint("TOPLEFT","Minimap","TOPLEFT",STIKMiniMapButtonPosition.x,STIKMiniMapButtonPosition.y);
end;

function STIKDMMiniMapButton_Reposition()
	STIKDMMiniMapButtonPosition.x = 52-(80*cos(STIKDMMiniMapButtonPosition.locationAngle));
	STIKDMMiniMapButtonPosition.y = ((80*sin(STIKDMMiniMapButtonPosition.locationAngle))-52);
	STIK_DM_MiniMapButton:SetPoint("TOPLEFT","Minimap","TOPLEFT",STIKDMMiniMapButtonPosition.x,STIKDMMiniMapButtonPosition.y);
end;

function STIK_DM_MiniMapButton_Minimap_Update()
	local xpos,ypos = GetCursorPosition();
	local xmin,ymin = Minimap:GetLeft(), Minimap:GetBottom();

	xpos = xmin-xpos/UIParent:GetScale()+70 ;
	ypos = ypos/UIParent:GetScale()-ymin-70;

	STIKDMMiniMapButtonPosition.locationAngle = math.deg(math.atan2(ypos,xpos));
	STIKDMMiniMapButton_Reposition();
end;

function STIK_DM_MiniMapButton_OnClick()
    if MainPanelSTIK_DM:IsVisible() then
        MainPanelSTIK_DM:Hide();
        AddPlotView:Hide();
    else MainPanelSTIK_DM:Show();
    end;
end;