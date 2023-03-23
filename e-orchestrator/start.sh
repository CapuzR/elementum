
. ./settings.sh
. ./config.sh
chmod -R 777 $ELEMENTUM_PATH
#/////////////////////////////////////////////////////////////////////////////////////////////////

#Eng: Start the replica with the clean status dev decide.
#-----------------------------------------
#Esp: Inicia la Replica dependiendo de si se desea de cero o solo activarla.

dfx stop
if [ $CLEAN = "true" ]
then
    dfx start --background --clean
else
    dfx start --background
fi

#En cada caso, se debe editar el webpack de cada proyecto para apuntar si es development o staging.

# if [ $EXECUTION_TYPE = "multiple" ]
# then
    #Qué necesita Ledger? NADA
    if [ $HAS_ICP_LEDGER = "true" ]
    then
        S_ICP_LEDGER_CANID="$(../utilities/ledgers/icp/runner.sh)"
        echo -e "${BPurple}Icp Ledger CanId: $S_ICP_LEDGER_CANID${NC}"
    fi

    #Qué necesita BRS? Ledger (Solo .mo y canId)
    if [ $HAS_E_BR_SERVICE = "true" ]
    then
        S_E_BR_SERVICE_CANID="$(../bounty-rush/e-br-service/runner.sh)"
        echo -e "${BPurple}BR Service CanId: $S_E_BR_SERVICE_CANID${NC}"
    fi

    #Qué necesita EAM? NADA
    if [ $HAS_E_ASSET_MANAGER = "true" ]
    then
        S_E_ASSET_MANAGER_CANID="$(../general/e-asset-manager/runner.sh)"
        echo -e "${BPurple}E Asset M CanId: $S_E_ASSET_MANAGER_CANID${NC}"
    fi
    
    #Qué necesita ETM? EAM (Solo .mo y canId)
    if [ $HAS_E_TOURNAMENT_MANAGER = "true" ]
    then
        S_E_TOURNAMENT_MANAGER_CANID="$(../general/e-tournament-manager/runner.sh)"
        echo -e "${BPurple}E Tournament M CanId: $S_E_TOURNAMENT_MANAGER_CANID${NC}"
    fi
    
    #Qué necesita EP? Nada
    if [ $HAS_E_PROFILE = "true" ]
    then
        S_E_PROFILE_CANID="$(../general/e-profile/runner.sh)"
        echo -e "${BPurple}E Profile CanId: $S_E_PROFILE_CANID${NC}"
    fi
    
    #Qué necesita BRF? EAM, EP, BRS
    if [ $HAS_E_BR_FRONTEND = "true" ]
    then
        ../bounty-rush/e-br-frontend/runner.sh
    fi
    
    #Qué necesita EAF? EAM, ETM
    if [ $HAS_E_ADMIN_FRONTEND = "true" ]
    then
        ../general/e-admin-frontend/runner.sh
    fi
    
    #Qué necesita EW? EAM, EP, BRS, ETM
    if [ $HAS_E_WEBAPP = "true" ]
    then
        ../general/e-webapp/runner.sh
    fi
    
    #Qué necesita BRN? e-br-service
    if [ $HAS_E_BR_NODE = "true" ]
    then
        ../bounty-rush/e-br-node/runner.sh
    fi
    
    # if [ $HAS_E_BR_BACKUP = "true" ]
    # then
    #     ../utilities/backups/e-br-backup/runner.sh
    # fi
    
    # if [ $HAS_FAUCET = "true" ]
    # then
    #     ../utilities/faucet/runner.sh
    # fi
    
    # if [ $HAS_CKBTC_LEDGER = "true" ]
    # then
    #     ../utilities/ledgers/ckbtc/runner.sh
    # fi
# fi


echo -e "${BPurple}Icp Ledger CanId: $S_ICP_LEDGER_CANID${NC}"
echo -e "${BPurple}BR Service CanId: $S_E_BR_SERVICE_CANID${NC}"
echo -e "${BPurple}E Asset M CanId: $S_E_ASSET_MANAGER_CANID${NC}"
echo -e "${BPurple}E Tournament M CanId: $S_E_TOURNAMENT_MANAGER_CANID${NC}"
echo -e "${BPurple}E Profile CanId: $S_E_PROFILE_CANID${NC}"