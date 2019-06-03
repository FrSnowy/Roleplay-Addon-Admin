function DM_REGISTER_COMMANDS()
    local function recieveTargetName ()
        return UnitName("target") or nil;
    end;

    local function NotifyPrivate (msg, target, value)
        if (target == nil) then print("У вас нет цели");
        else SendAddonMessage('STIK_SYSTEM', msg.."&"..value, "WHISPER", target);
        end;
    end;

    local function NotifyParty (msg, target, value)
        SendAddonMessage('STIK_SYSTEM', msg.."&"..value, "RAID");
    end;

    local function RegisterExperienceCommands()
        SlashCmdList['giveExpCommand'] = function(msg)
            NotifyPrivate('give_exp', recieveTargetName(), msg or 0);
        end;
        SlashCmdList['giveExpCommandRaid'] = function(msg)
            NotifyParty('give_exp', recieveTargetName(), msg or 0);
        end;

        SLASH_giveExpCommand1 = '/give_exp';
        SLASH_giveExpCommandRaid1 = '/give_exp_raid';
        SLASH_giveExpCommandRaid2 = '/give_exp_r';
    end;

    local function RegsterLevelControllCommanads()
        SlashCmdList['setLevelCommand'] = function(msg)
            NotifyPrivate('set_level', recieveTargetName(), msg or nil);
        end;

        SLASH_setLevelCommand1 = '/set_level';
    end;

    local function RegsterInfoCommand()
        SlashCmdList['getInfoCommand'] = function(msg)
            NotifyPrivate('get_info', recieveTargetName(), UnitName("player"));
        end;

        SLASH_getInfoCommand1 = '/get_info';
    end;

    local function RegisterHealthControllCommands()
        SlashCmdList['setHealthCommand'] = function(msg)
            NotifyPrivate('mod_hp', recieveTargetName(), msg or nil);
        end;

        SLASH_setHealthCommand1 = '/mod_health';
        SLASH_setHealthCommand2 = '/mod_hp';
    end;

    local function RegisterBattleControllCommands()
        SlashCmdList['startBattleCommand'] = function(msg)
            NotifyPrivate('change_battle_state', recieveTargetName(), 1);
        end;
        SlashCmdList['startBattleCommandRaid'] = function(msg)
            NotifyParty('change_battle_state', recieveTargetName(), 1);
        end;
        SlashCmdList['endBattleCommand'] = function(msg)
            NotifyPrivate('change_battle_state', recieveTargetName(), 0);
        end;
        SlashCmdList['endBattleCommandRaid'] = function(msg)
            NotifyParty('change_battle_state', recieveTargetName(), 0);
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
            NotifyPrivate('restore_hp', recieveTargetName(), msg or nil);
        end;

        SlashCmdList['restoreHpCommandRaid'] = function(msg)
            NotifyParty('restore_hp', recieveTargetName(), msg or nil);
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
            if (isAllFilled(msg, category, trackNumber)) then
                NotifyPrivate('play_music', recieveTargetName(), category..'_'..trackNumber)
            end;
        end;

        SlashCmdList['playMusicCommandRaid'] = function(msg)
            local category, trackNumber = strsplit(' ', msg);
            if (isAllFilled(msg, category, trackNumber)) then
                NotifyParty('play_music', recieveTargetName(), category..'_'..trackNumber)
            end;
        end;

        SlashCmdList['stopMusicCommand'] = function(msg)
            NotifyPrivate('stop_music', recieveTargetName(), '');
        end;

        SlashCmdList['stopMusicCommandRaid'] = function(msg)
            NotifyParty('stop_music', recieveTargetName(), '');
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
            NotifyPrivate('mod_barrier', recieveTargetName(), msg or nil);
        end;

        SlashCmdList['setBarrierCommandRaid'] = function(msg)
            NotifyParty('mod_barrier', recieveTargetName(), msg or nil);
        end;

        SLASH_setBarrierCommand1 = '/mod_barrier';
        SLASH_setBarrierCommand2 = '/mod_br';

        SLASH_setBarrierCommandRaid1 = '/mod_barrier_raid';
        SLASH_setBarrierCommandRaid2 = '/mod_barrier_r';
        SLASH_setBarrierCommandRaid3 = '/mod_br_raid';
        SLASH_setBarrierCommandRaid4 = '/mod_br_r';
    end;

    local function RegisterDamageCommands()
        SlashCmdList['damageCommand'] = function(msg)
            local damage = math.abs(tonumber(msg));
            NotifyPrivate('damage', recieveTargetName(), damage);
        end;

        SlashCmdList['damageCommandRaid'] = function(msg)
            local damage = math.abs(tonumber(msg));
            NotifyParty('damage', recieveTargetName(), damage);
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
            NotifyPrivate('kick', recieveTargetName(), '');
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
            if (isAllFilled(msg, category, trackNumber)) then
                NotifyPrivate('play_effect', recieveTargetName(), category..'_'..trackNumber);
            end;
        end;
        
        SlashCmdList['effectCommandRaid'] = function(msg)
            local category, trackNumber = strsplit(' ', msg);
            if (isAllFilled(msg, category, trackNumber)) then
                NotifyParty('play_effect', recieveTargetName(), category..'_'..trackNumber);
            end;
        end;

        SLASH_effectCommand1 = '/play_effect';
        SLASH_effectCommand2 = '/play_ef';
        SLASH_effectCommandRaid1 = '/play_effect_raid';
        SLASH_effectCommandRaid2 = '/play_effect_r';
        SLASH_effectCommandRaid3 = '/play_ef_raid';
        SLASH_effectCommandRaid4 = '/play_ef_r';
    end;

    local function RegisterInviteCommands()
        SlashCmdList['plotInvite'] = function(msg)
            NotifyPrivate('invite_to_plot', recieveTargetName(), msg);
            print('Приглашение отправлено игроку '..recieveTargetName());
        end;

        SlashCmdList['plotInviteRaid'] = function(msg)
            NotifyParty('invite_to_plot', recieveTargetName(), msg);
        end;

        SLASH_plotInvite1 = '/plot_invite';
        SLASH_plotInvite2 = '/plot_inv';
        
        SLASH_plotInviteRaid1 = '/plot_invite_raid';
        SLASH_plotInviteRaid2 = '/plot_invite_r';
        SLASH_plotInviteRaid3 = '/plot_inv_raid';
        SLASH_plotInviteRaid4 = '/plot_inv_r';
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
    RegisterInviteCommands();
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
            plotView = {
                title = "Сюжет",
                submit = "Готово",
                delete = "Удалить",
            },
            players = {
                title = "Игроки",
                invite = "Позвать",
                invite_raid = "Позвать пати",
            },
        },
    };

    local components = {
        plusButton = function(parameters)
            -- parameters = {
            --   parent,
            --   width,
            --   marginTop,
            --   marginLeft,
            --   content,
            --   clickHandler,
            --   withoutImageMargin
            -- };
            local plusButtonMain = CreateFrame("Button", "AddButton", parameters.parent);
                plusButtonMain:Show();
                plusButtonMain:EnableMouse();
                plusButtonMain:SetWidth(parameters.width);
                plusButtonMain:SetHeight(64);
                plusButtonMain:SetToplevel(true);
                plusButtonMain:SetBackdropColor(0, 0, 0, 1);
                plusButtonMain:SetFrameStrata("FULLSCREEN_DIALOG");
                plusButtonMain:SetPoint("CENTER", parameters.parent, "TOP", parameters.marginLeft or 0, -parameters.marginTop);
                plusButtonMain:SetNormalTexture("Interface\\AddOns\\STIK_DM\\IMG\\panel-background.blp");
                plusButtonMain:SetHighlightTexture("Interface\\AddOns\\STIK_DM\\IMG\\panel-background-hover.blp");
                plusButtonMain:SetScript("OnClick", parameters.clickHandler);

            local imageMargin = 16;
            if (parameters.withoutImageMargin) then imageMargin = 0; end;
    
            local plusIcon = CreateFrame("Button", "AddButtonIcon", plusButtonMain);
                plusIcon:Show();
                plusIcon:SetWidth(16);
                plusIcon:SetHeight(16);
                plusIcon:SetToplevel(true);
                plusIcon:SetBackdropColor(0, 0, 0, 1);
                plusIcon:SetFrameStrata("FULLSCREEN_DIALOG");
                plusIcon:SetPoint("LEFT", plusButtonMain, "LEFT", imageMargin, -8);
                plusIcon:SetNormalTexture("Interface\\AddOns\\STIK_DM\\IMG\\add.blp");

            local textMargin = 48;
            if (parameters.withoutImageMargin) then textMargin = 24 end;
    
            local plusText = plusButtonMain:CreateFontString(nil, "OVERLAY", "GameFontHighlight");
                plusText:SetPoint("LEFT", plusButtonMain, "LEFT", textMargin, -8);
                plusText:SetText(parameters.content);
                plusText:Show();
    
            return plusButtonMain;
        end,
        closeButton = function(parameters)
            -- parameters = {
            --   parent,
            --   position = {
            --     x, y
            --   }
            --   clickHandler,
            -- };
            local closeButton = CreateFrame("Button", "CloseButton", parameters.parent, "UIPanelButtonTemplate");
                closeButton:SetPoint("CENTER", parameters.parent, "TOP", parameters.position.x, parameters.position.y);
                closeButton:SetHeight(24);
                closeButton:SetWidth(32);
                closeButton:SetText('x');
                closeButton:RegisterForClicks("AnyUp");
                closeButton:SetScript("OnClick", parameters.clickHandler);
        end,
        titledPanel = function(parameters)
            -- parameters = {
            --    parent,
            --    size = { width, height },
            --    point = { x, y },
            --    backgroundImage,
            --    isVisible,
            --    title = {
            --        content,
            --        marginTop,
            --    }
            -- };

            local titledPanel = CreateFrame("Frame", "titledPanel", parameters.parent);
                if (parameters.isVisible) then titledPanel:Show() else titledPanel:Hide() end;
                titledPanel:EnableMouse();
                titledPanel:SetWidth(parameters.size.width);
                titledPanel:SetHeight(parameters.size.height);
                titledPanel:SetToplevel(true);
                titledPanel:SetBackdropColor(0, 0, 0, 1);
                titledPanel:SetFrameStrata("FULLSCREEN_DIALOG");
                titledPanel:SetPoint("CENTER", parameters.parent, "CENTER", parameters.point.x, parameters.point.y);
                titledPanel:SetBackdrop({
                    bgFile = "Interface\\AddOns\\STIK_DM\\IMG\\"..parameters.backgroundImage..".blp",
                    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
                    tile = false, tileSize = 32, edgeSize = 32,
                    insets = { left = 12, right = 12, top = 12, bottom = 12 },
                });

            local titledPanelTitle = titledPanel:CreateFontString(nil, "OVERLAY", "GameFontHighlight");
                titledPanelTitle:SetPoint("CENTER", titledPanel, "TOP", 0, -parameters.title.marginTop);
                titledPanelTitle:SetText(parameters.title.content);
                titledPanelTitle:SetTextHeight(14);
                titledPanelTitle:Show();

            return titledPanel;
        end,
        textButton = function(parameters)
            -- parameters = {
            --    parent,
            --    size = { width, height },
            --    point = { x, y },
            --    content,
            --    clickHandler,
            -- };

            local textButton = CreateFrame("Button", "textButton", parameters.parent, "UIPanelButtonTemplate");
                textButton:SetPoint("CENTER", parameters.parent, "TOP", parameters.point.x, parameters.point.y);
                textButton:SetHeight(parameters.size.height);
                textButton:SetWidth(parameters.size.width);
                textButton:SetText(parameters.content);
                textButton:RegisterForClicks("AnyUp");
                textButton:SetScript("OnClick", parameters.clickHandler);
        end,
        inputWithLabel = function(parameters)
            -- parameters = {
            --   parent,
            --   input = {
            --     multiline,
            --     size = { width, height },
            --     point = { x, y },
            --     content,
            --     maxLetters,
            --     tabPressHandler 
            --   }
            --   label = {
            --      content,
            --      point = { x, y }
            --   }
            -- };

            local label = parameters.parent:CreateFontString(nil, "OVERLAY", "GameFontHighlight");
                label:SetPoint("TOPLEFT", parameters.parent, "TOP", parameters.label.point.x, parameters.label.point.y);
                label:SetText(parameters.label.content);
                label:Show();

            local input = nil;
            if (parameters.input.multiline) then
                input = CreateFrame("EditBox", "input", parameters.parent);
                    input:SetMultiLine(true);
                    input:SetSize(parameters.input.size.width, parameters.input.size.height);
                    input:SetPoint("TOP", parameters.parent, "TOP", parameters.input.point.x, parameters.input.point.y)
                    input:SetAutoFocus(false);
                    input:SetFont("Fonts\\FRIZQT__.TTF", 12)
                    input:SetJustifyH("LEFT")
                    input:SetJustifyV("CENTER")
                    input:SetTextInsets(8, 8, 4, 4);
                    input:SetMaxLetters(parameters.input.maxLetters or 200);
                    input:SetText(parameters.input.content or '');
                    input:SetBackdrop({
                        bgFile = [[Interface\Buttons\WHITE8x8]],
                        edgeFile = [[Interface\Tooltips\UI-Tooltip-Border]],
                        edgeSize = 14,
                        insets = {left = 3, right = 3, top = 3, bottom = 3},
                    });
                    input:SetBackdropColor(0, 0, 0);
                    input:SetBackdropBorderColor(0.3, 0.3, 0.3);
                    input:SetScript("OnEscapePressed", function() input:ClearFocus(); end);
                    input:SetScript("OnTabPressed", parameters.input.tabPressHandler);
            else
                input = CreateFrame("EditBox", "PlotViewTitle_Input", parameters.parent, "InputBoxTemplate");
                    input:Show();
                    input:SetAutoFocus(false)
                    input:SetSize(parameters.input.size.width, parameters.input.size.height)
                    input:SetToplevel(true);
                    input:SetPoint("CENTER", parameters.parent, "TOP", parameters.input.point.x, parameters.input.point.y);
                    input:SetText(parameters.input.content or '');
                    input:SetMaxLetters(parameters.input.maxLetters or 26);
                    input:SetTextInsets(2, 0, 0, 0);
                    input:SetBackdrop({
                        bgFile = [[Interface\Buttons\WHITE8x8]],
                        insets = {left = -1, right = 1, top = 8, bottom = 8},
                    });
                    input:SetBackdropColor(0, 0, 0);
                    input:SetScript("OnTabPressed", parameters.input.tabPressHandler);
            end;

            input.Label = label;
            return input;        
        end,
    };

    PLOT_PANELS = { };
    PLAYERS_PANELS = { };
    STIK_MAIN_PANEL_OFFSET = 0;
    STIK_PLAYERS_OFFSET = 0;
    SCROLL_BAR = nil;
    PLAYERS_SCROLL_BAR = nil;

    local function createPlotView(index)
        STIK_PLAYERS_OFFSET = 0;
        local function createMainViewPanel()
            local PlotViewPanel = components.titledPanel({
                parent = UIParent,
                size = { width = 320, height = 320 },
                point = { x = 0, y = 0 },
                backgroundImage = 'plot-view-background',
                isVisible = true,
                title = {
                    content = texts.panels.plotView.title,
                    marginTop = 25,
                },
            });            
            local PlotViewCloseButton = components.closeButton({
                parent = PlotViewPanel,
                position = { x = 130, y = -25 },
                clickHandler = function()
                    MainPanelSTIK_DM:Show();
                    PlotViewPanel:Hide();
                    PLAYERS_SCROLL_BAR = nil;
                end,
            });
            
            local PlotViewTitle_Input = components.inputWithLabel({
                parent = PlotViewPanel,
                label = {
                    content = texts.panels.plot.name,
                    point = { x = -133, y = -65 },
                },
                input = {
                    multiline = false,
                    size = { width = 256, height = 32 },
                    point = { x = 0, y = -95 },
                    content = plots[index].name,
                    tabPressHandler = function() PlotViewDescription_Input:SetFocus(); end,
                }
            });

            PlotViewDescription_Input = components.inputWithLabel({
                parent = PlotViewPanel,
                label = {
                    content = texts.panels.plot.description,
                    point = { x = -133, y = -125 }
                },
                input = {
                    multiline = true,
                    size = { width = 262, height = 100 },
                    point = { x = -3, y = -145 },
                    content = plots[index].description,
                    tabPressHandler = function() PlotViewTitle_Input:SetFocus(); end,
                }
            })
            
            local PlotView_SaveButton = components.textButton({
                parent = PlotViewPanel,
                point = { x = 80, y = -282 },
                size = { width = 92, height = 36 },
                content = texts.panels.plotView.submit,
                clickHandler = function()
                    local plotInfo = {
                        name = PlotViewTitle_Input:GetText(),
                        description = PlotViewDescription_Input:GetText(),
                    };

                    if (plotInfo.name == '') then
                        PlotViewTitle_Input.Label:SetText(texts.panels.plot.name..' (Не должно быть пустым!)');
                        return nil;
                    else PlotViewTitle_Input.Label:SetText(texts.panels.plot.name);
                    end;

                    if (plotInfo.description == '') then
                        PlotViewDescription_Input.Label:SetText(texts.panels.plot.description..' (Не должно быть пустым!)');
                        return nil;
                    else PlotViewDescription_Input.Label:SetText(texts.panels.plot.description);
                    end;

                    plots[index].name = plotInfo.name;
                    plots[index].description = plotInfo.description;

                    PlotViewPanel:Hide();
                    PlotViewTitle_Input:SetText('');
                    PlotViewDescription_Input:SetText('');
                    MainPanelSTIK_DM.refresh();
                    MainPanelSTIK_DM:Show();
                end,
            });

            local PlotView_DeleteButton = components.textButton({
                parent = PlotViewPanel,
                point = { x = -90, y = -282 },
                size = { width = 92, height = 36 },
                content = texts.panels.plotView.delete,
                clickHandler = function()
                    PlotViewPanel:Hide();
                    PlotViewTitle_Input:SetText('');
                    PlotViewDescription_Input:SetText('');
                    table.remove(plots, index);
                    MainPanelSTIK_DM.refresh();
                    MainPanelSTIK_DM:Show();
                end,
            });

            return PlotViewPanel;
        end;

        local function createPlayer(parent, player, index)
            local PlayerView = CreateFrame("Button", "PlayerView", parent);
                PlayerView:Show();
                PlayerView:EnableMouse();
                PlayerView:SetWidth(146);
                PlayerView:SetHeight(32);
                PlayerView:SetToplevel(true);
                PlayerView:SetBackdropColor(0, 0, 0, 1);
                PlayerView:SetFrameStrata("FULLSCREEN_DIALOG");
                PlayerView:SetPoint("CENTER", parent, "TOP", -30, -55 - 38 * (index - 1 - STIK_PLAYERS_OFFSET));
                PlayerView:SetNormalTexture("Interface\\AddOns\\STIK_DM\\IMG\\plot-background.blp");
                PlayerView:SetHighlightTexture("Interface\\AddOns\\STIK_DM\\IMG\\plot-background.blp");

            
            local PlayerView_Name = PlayerView:CreateFontString(nil, "OVERLAY", "GameFontHighlight");
                PlayerView_Name:SetPoint("LEFT", PlayerView, "LEFT", 0, 0);
                PlayerView_Name:SetText(player);
                PlayerView_Name:Show();

            return PlayerView;
        end;
        
        local function createPlayersViewPanel(mainPanel)
            local PlayerPanel = components.titledPanel({
                parent = mainPanel,
                size = { width = 256, height = 256 },
                point = { x = -300, y = 0 },
                backgroundImage = 'player-background',
                isVisible = true,
                title = {
                    content = texts.panels.players.title,
                    marginTop = 25,
                },
            });

            PlayerPanel.refresh = function()
                if (plots[index].players and #plots[index].players > 4) then
                    if (PLAYERS_SCROLL_BAR) then
                        PLAYERS_SCROLL_BAR:Show();
                    else
                        PLAYERS_SCROLL_BAR = CreateFrame("Slider", nil, PlayerPanel, "UIPanelScrollBarTemplate")
                            PLAYERS_SCROLL_BAR:SetPoint("RIGHT", PlayerPanel, "RIGHT", -24, 15);
                            PLAYERS_SCROLL_BAR:SetSize(30, 110);
                            PLAYERS_SCROLL_BAR:SetMinMaxValues(0, #plots[index].players - 4);
                            PLAYERS_SCROLL_BAR:SetValueStep(1);
                            PLAYERS_SCROLL_BAR:SetValue(STIK_PLAYERS_OFFSET);
                            
                            PLAYERS_SCROLL_BAR:SetScript("OnValueChanged", function(self, value)
                                STIK_PLAYERS_OFFSET = value;
                                PlayerPanel.refresh();
                            end)
                    end;
                else
                    if (PLAYERS_SCROLL_BAR) then PLAYERS_SCROLL_BAR:Hide(); end;
                end;

                if (#plots[index].players > 0) then
                    for playerIndex = 1, #PLAYERS_PANELS do
                        PLAYERS_PANELS[playerIndex]:Hide();
                    end;
                    for playerIndex = 1 + STIK_PLAYERS_OFFSET, 4 + STIK_PLAYERS_OFFSET do
                        if (plots[index].players[playerIndex]) then
                            PLAYERS_PANELS[playerIndex] = createPlayer(PlayerPanel, plots[index].players[playerIndex], playerIndex);
                        end;
                    end;
                else
                    for playerIndex = 1, #PLAYERS_PANELS do
                        PLAYERS_PANELS[playerIndex]:Hide();
                    end;
                end;
            end;

            local PlayerInviteButton = components.plusButton({
                parent = PlayerPanel,
                width = 80,
                marginTop = 200, marginLeft = -65,
                content = texts.panels.players.invite,
                withoutImageMargin = true,
                clickHandler = function()
                    if (plots[index].players) then
                        for arrIndex, player in pairs(plots[index].players) do
                            if (player == UnitName("target")) then
                                print('Игрок '..player..' уже присоединился к этому сюжету.');
                                return nil;
                            end;
                        end;
                    end;
                    local plotInfo = plots[index].id..'~'..plots[index].name..'~'..plots[index].description;
                    SlashCmdList['plotInvite'](plotInfo);
                end,
            });
            
            local PlayerInviteButton = components.plusButton({
                parent = PlayerPanel,
                width = 100,
                marginTop = 200, marginLeft = 50,
                content = texts.panels.players.invite_raid,
                withoutImageMargin = true,
            });

            return PlayerPanel;
        end;
        
        PlotView = createMainViewPanel();
        local PlayerPanel = createPlayersViewPanel(PlotView);
        PlayerPanel.refresh();
        PlotView.PlayerPanel = PlayerPanel;
        return PlotView;
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
            PlotPanel:SetScript('OnClick', function()
                MainPanelSTIK_DM:Hide();
                if (PlotView) then PlotView:Hide(); end;
                PlotView = createPlotView(index);
            end);

        local PlotName = PlotPanel:CreateFontString(nil, "OVERLAY", "GameFontHighlight");
            PlotName:SetPoint("LEFT", PlotPanel, "LEFT", 0, -8);
            PlotName:SetText(plot.name);
            PlotName:Show();

        return PlotPanel;
    end;

    local function createMainPanel()
        local MainPanelSTIK_DM = components.titledPanel({
            parent = UIParent,
            size = { width = 320, height = 320 },
            point = { x = 0, y = 0 },
            backgroundImage = 'main-panel-background',
            isVisible = true,
            title = {
                content = texts.panels.main.title,
                marginTop = 25,
            },
        })

        MainPanelSTIK_DM.refresh = function()
            if (#plots > 4) then
                if (SCROLL_BAR) then
                    SCROLL_BAR:Show();
                    SCROLL_BAR:SetMinMaxValues(0, #plots - 4);
                else
                    SCROLL_BAR = CreateFrame("Slider", nil, MainPanelSTIK_DM, "UIPanelScrollBarTemplate")
                        SCROLL_BAR:SetPoint("RIGHT", MainPanelSTIK_DM, "RIGHT", -10, 19);
                        AddPlotView:EnableMouse();
                        SCROLL_BAR:SetSize(30, 140);
                        SCROLL_BAR:SetMinMaxValues(0, #plots - 4);
                        SCROLL_BAR:SetValueStep(1);
                        SCROLL_BAR:SetValue(STIK_MAIN_PANEL_OFFSET);
                        
                        SCROLL_BAR:SetScript("OnValueChanged", function(self, value)
                            STIK_MAIN_PANEL_OFFSET = value;
                            MainPanelSTIK_DM.refresh();
                        end)
                end;
            else
                if (SCROLL_BAR) then SCROLL_BAR:Hide(); end;
            end;

            if (#plots > 0) then
                for index = 1, #PLOT_PANELS do
                    PLOT_PANELS[index]:Hide();
                end;
                for index = 1 + STIK_MAIN_PANEL_OFFSET, 4 + STIK_MAIN_PANEL_OFFSET do
                    if (plots[index]) then
                        PLOT_PANELS[index] = createPlotPanel(MainPanelSTIK_DM, plots[index], index);
                    end;
                end;
            else
                for index = 1, #PLOT_PANELS do
                    PLOT_PANELS[index]:Hide();
                end;
            end;
        end;

        local MainPanelAddButton = components.plusButton({
            parent = MainPanelSTIK_DM,
            width = 256,
            marginTop = 260,
            content = texts.panels.addPlot.content,
            clickHandler = function() AddPlotView:Show(); end
        });

        local MainPanelClose = components.closeButton({
            parent = MainPanelSTIK_DM,
            position = { x = 130, y = -25 },
            clickHandler = function() MainPanelSTIK_DM:Hide(); end,
        });

        return MainPanelSTIK_DM;
    end;
  
    local function createAddPlotView()
        AddPlotView = components.titledPanel({
            parent = UIParent,
            size  = { width = 320, height = 320 },
            point = { x = 0, y = 0 },
            backgroundImage = 'plot-panel-background',
            isVisible = false,
            title = {
                content = texts.panels.plot.title,
                marginTop = 25,
            }
        });

        local AddPlotViewCloseButton = components.closeButton({
            parent = AddPlotView,
            position = { x = 130, y = -25 },
            clickHandler = function() AddPlotView:Hide(); end,
        });

        local AddPlotView_NameInput = components.inputWithLabel({
            parent = AddPlotView,
            label = {
                content = texts.panels.plot.name,
                point = { x = -133, y = -70 },
            },
            input = {
                multiline = false,
                size = { width = 256, height = 32 },
                point = { x = 0, y = -94 },
                tabPressHandler = function() AddPlotView.descriptionInput:SetFocus(); end,
            }
        });

        local AddPlotView_DescriptionInput = components.inputWithLabel({
            parent = AddPlotView,
            label = {
                content = texts.panels.plot.description,
                point = { x = -133, y = -125 },
            },
            input = {
                multiline = true,
                size = { width = 264, height = 100 },
                point = { x = -3, y = -138 },
                tabPressHandler = function() AddPlotView.nameInput:SetFocus(); end,
            }
        });

        AddPlotView.nameInput = AddPlotView_NameInput;
        AddPlotView.descriptionInput = AddPlotView_DescriptionInput;

        local AddPlotViewCreateButton = components.textButton({
            parent = AddPlotView,
            point = { x = 80, y = -282 },
            size = { width = 92, height = 36 },
            content = texts.panels.plot.submit,
            clickHandler = function()
                local plotInfo = {
                    id = UnitName("player").."-"..math.random(999999),
                    name = AddPlotView_NameInput:GetText(),
                    description = AddPlotView_DescriptionInput:GetText(),
                    players = { },
                };

                if (plotInfo.name == '') then
                    AddPlotView_NameInput.Label:SetText(texts.panels.plot.name..' (Не должно быть пустым!)');
                    return nil;
                else AddPlotView_NameInput.Label:SetText(texts.panels.plot.name);
                end;

                if (plotInfo.description == '') then
                    AddPlotView_DescriptionInput.Label:SetText(texts.panels.plot.description..' (Не должно быть пустым!)');
                    return nil;
                else AddPlotView_DescriptionInput.Label:SetText(texts.panels.plot.description);
                end;
                table.insert(plots, plotInfo);
                AddPlotView:Hide();
                MainPanelSTIK_DM.refresh();
                AddPlotView_NameInput:SetText('');
                AddPlotView_DescriptionInput:SetText('');
            end,
        });
    end;

    createAddPlotView();
    MainPanelSTIK_DM = createMainPanel();
    MainPanelSTIK_DM.refresh();
end;

function DMAddonReady()
    plots = plots or { };
    DM_REGISTER_COMMANDS();
    DM_REGISTER_PANELS();
end;

function OnPlayerSay(prefix, msg, tp, sender)
    if (not(prefix == 'STIK_PLAYER_ANSWER')) then return end;

    local COMMAND, VALUE = strsplit('&', msg);
    local commandConnector = {
        invite_accept = function(inviteInfo)
            local player, meta = strsplit(' ', inviteInfo);

            local inArray = { };
            for index, plot in pairs(plots) do
                if (plot.id == meta) then
                    inArray.founded = true;
                    inArray.position = index;
                    break;
                else
                    inArray.founded = false;
                end;
            end;

            if (not(inArray.founded)) then
                print('Ключи не совпали, игрок '..player..' не был добавлен в сюжет. Попробуйте выполнить /reload и повторить ещё раз.');
                return nil;
            end;

            if (not(plots[inArray.position].players)) then
                plots[inArray.position].players = { };
            end;

            table.insert(plots[inArray.position].players, player);
            PlotView.PlayerPanel.refresh();
            print('Игрок '..player..' присоединился к сюжету "'..plots[inArray.position].name..'"');
        end,
        invite_decline = function(inviteInfo)
            local player = strsplit(' ', inviteInfo);
            print('Игрок '..player..' отказался присоединиться к сюжету');
        end,
    };

    commandConnector[COMMAND](VALUE);
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