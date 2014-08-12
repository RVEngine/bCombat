sleep 1;
_i = 0;

while { true } do 
{
	_t1 = time;
	_count = count allUnits;
	
	{
		_unit = _x;
		
		if( bcombat_enable && { [_unit] call bcombat_fnc_is_active } )  then //&& { [_unit] call bcombat_fnc_is_alive }
		{
			if( isNil { _unit getvariable ["bcombat_init_done", nil ] } ) then 
			{
				// player globalchat format["Initializing %1 ...", _unit];
				// diag_log format["unit:%1 - side:%2 - vehicle:%3 - skill:%4 - skillFinal:%5", _unit, side _unit, vehicle _unit, _unit skill "general", _unit skillfinal "general"];
	
				_unit setvariable ["bcombat_init_done", true ];
				
				if( bcombat_remove_nvgoggles ) then
				{
					_unit unassignitem "NVGoggles"; 
					_unit unassignitem "NVGoggles_OPFOR"; 
					_unit unassignitem "NVGoggles_INDEP"; 
					_unit removeitem "NVGoggles";
					_unit removeitem "NVGoggles_OPFOR";
					_unit removeitem "NVGoggles_INDEP";
				};

				if( !(bcombat_allow_fatigue) ) then
				{
					_unit enableFatigue false;
				};
				
				/*
				if( !(bcombat_allow_fatigue) && !isPlayer(_unit)) then
				{
					_unit enableFatigue false;
				}
				else
				{
					_unit enableFatigue true;
				};
				*/
				
				[_unit, skill _unit] call bcombat_fnc_unit_skill_set;

				if( isNil { _unit getvariable ["bcombat_eh_fired", nil ] } ) then {
					_e = _unit addEventHandler ["Fired", bcombat_fnc_eh_fired];
					_unit setvariable ["bcombat_eh_fired", _e ];
				};

				if( isNil { _unit getvariable ["bcombat_fnc_eh_hit", nil ] } ) then {
					_e = _unit addEventHandler ["Hit", bcombat_fnc_eh_hit];
					_unit setvariable [ "bcombat_eh_hit", _e ];
				};

				if( isNil { _unit getvariable ["bcombat_fnc_eh_killed", nil ] } ) then {
					_e = _unit addEventHandler ["Killed", bcombat_fnc_eh_killed];
					_unit setvariable [ "bcombat_eh_killed", _e ];
				};

				if( isNil { _unit getvariable ["bcombat_eh_handledamage", nil ] } ) then {
					_e = _unit addEventHandler ["HandleDamage", bcombat_fnc_eh_handledamage]; 
					_unit setvariable ["bcombat_eh_handledamage", _e ];
				};
				
				if( [_unit] call bcombat_fnc_is_active
					&& bcombat_allow_grenades 
					&& bcombat_grenades_additional_number > 0) then
				{
					for "_n" from 0 to bcombat_grenades_additional_number step 1 do 
					{
						_unit addMagazine "HandGrenade"; 
					};
				};
				
				if( [_unit] call bcombat_fnc_is_active
					&& bcombat_allow_smoke_grenades 
					&& bcombat_smoke_grenades_additional_number > 0) then
				{
					for "_n" from 0 to bcombat_smoke_grenades_additional_number step 1 do 
					{
						_unit addMagazine "SmokeShell"; 
					};
				};
			};
			
			/*
			if(  _unit ammo (currentweapon _unit) ==0) then
			{
			hintc format["%1 ... %2 ... %3", _unit, (currentweapon _unit), _unit ammo (currentweapon _unit)];
			};
			
			*/
			
			_unit setskill [ "SpotDistance", ( _unit getVariable [ "bcombat_skill_sd", 0] )  * ( [_unit] call bcombat_fnc_visibility_multiplier ) ];
			
			if( bcombat_min_player_group_skill > 0 ) then
			{
				if ( player in (units group _unit)
					&& { bcombat_min_player_group_skill > _unit getVariable [ "bcombat_skill", skill _unit ] }
				) then {
				
					[_unit, bcombat_min_player_group_skill ] call bcombat_fnc_unit_skill_set;
					//player globalchat format ["%1 is given %2 skill", _unit, bcombat_min_player_group_skill];
				}
				else
				{
					if ( !( player in (units group _unit) )
						&& { _unit getVariable [ "bcombat_skill_orig", skill _unit ] < _unit getVariable [ "bcombat_skill", skill _unit ] }
					) then {
						[_unit, _unit getVariable [ "bcombat_skill_orig", skill _unit ] ] call bcombat_fnc_unit_skill_set;
						//player globalchat format ["%1 has skill reset to %2", _unit, _unit getVariable [ "bcombat_skill_orig", skill _unit ]];
					};
				};
			};
			
			
			
		//	player globalchat format["%4 - %3 --> %1 / %2", _i, _i mod 3, _unit, time];
			
			if( _unit distance player < bcombat_degradation_distance  && { !(isPlayer _unit) } ) then
			{
				

				_enemy = _unit findnearestEnemy _unit;
				
				/*
				if( !(isNull _enemy) ) then
				{
					[ _unit, _enemy ] call bcombat_fnc_set_firemode;
				};
				*/
				
				// CQB
				if( !(isNull _enemy) 
					&& { bcombat_cqb_radar }
					&& { !(fleeing _unit) } 
					&& { !(captive _unit) } 
					&& { _unit distance _enemy < bcombat_cqb_radar_max_distance * 1.1}  	
					&& { random 1 <= (_unit skill "general" ) }
					&& { isNil { _unit getVariable ["bcombat_cqb_lock", nil] } }
					) then
				{
					_unit setVariable ["bcombat_cqb_lock", true];
					//hintc format["%1 CQB activated", _unit]; sleep .5;
					[_unit, bcombat_cqb_radar_clock, bcombat_cqb_radar_max_distance, bcombat_cqb_radar_params] spawn bcombat_fnc_cqb;
				};
				
				if( _unit == leader _unit) then
				{
					_blacklist = (group _unit) getVariable ["bcombat_cover_blacklist", [] ];
					
					if( count _blacklist > 0 ) then
					{
						for "_n" from 0 to (count _blacklist) - 1 step 2 do 
						{
							if( _blacklist select (_n + 1) < time) then
							{
								_blacklist set[_n , -1];
								_blacklist set[ _n + 1  , -1];
							};	
						};
						
						_blacklist = _blacklist - [-1];
						(group _unit) setVariable ["bcombat_cover_blacklist", _blacklist];
					};

					if( !(fleeing _unit) ) then
					{
						if( !(isNull _enemy) ) then
						{
							if (_unit distance _enemy <= 250) then
							{
								_unit enableAttack true;
								//_unit enableAttack false;
							}
							else
							{
								_unit enableAttack false;
							}
						}
						else
						{
							_unit enableAttack false;
						};
					};
				};
				
				if( 
					bcombat_allow_fleeing
					&& { !(player in (units (group _unit))) }
					&& { !(fleeing _unit) }
				) then {
					[_unit] call bcombat_fnc_unit_handle_fleeing;
				}
				else
				{
					_unit allowFleeing 0;
				};

				if( 
					!([_unit] call bcombat_fnc_has_task)
					&& { !(fleeing _unit) }
					&& { !(captive _unit) }
				) then 
				{
				
					if( bcombat_allow_grenades 
						&& { combatmode _unit in ["RED", "YELLOW"] }
						//&& { _i mod 2 == 0}
						&& { !(isNull _enemy) } 
						&& { _unit distance _enemy < ( bcombat_grenades_distance select 1 ) }
						&& { "HandGrenade" in (magazines _unit) }
						&& { random 1 <= (_unit skill "general" ) ^ 0.5}
						&& { random 100 > (_unit getVariable ["bcombat_suppression_level", 0]) }
					) then {
						// player globalchat format["grenade check %1 - %2 %3", _unit distance _enemy, _unit, _enemy];
						[_unit] call bcombat_fnc_handle_grenade;
					}
					else
					{
					
						if( bcombat_allow_fast_move || isPlayer (leader _unit) ) then //  && isPlayer (leader _unit) 
						{
							[_unit] call bcombat_fnc_fast_move;
							
						}
						else
						{
							if( bcombat_allow_tightened_formation ) then //  && isPlayer (leader _unit) 
							{
								[_unit] call bcombat_fnc_fall_into_formation;
							};
						};
					};
				};
			};
		};

	} foreach allUnits;

	_i = _i + 1;
	//player globalchat format["*** %1 ***", _i];
	// if( _i mod 10 == 0) then { sleep 0.01; };
		
	sleep bcombat_features_clock;
};