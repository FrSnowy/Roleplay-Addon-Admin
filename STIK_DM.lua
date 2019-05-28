function DMAddonReady()
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
end;
