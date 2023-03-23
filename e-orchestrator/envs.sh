#/////////////////////////////////////////////////////////////////////////////////////////////////
#ENG: REQUIRES TO USE jq (sudo apt-get install jq | brew install jq)
#ESP: REQUIERE UTILIZAR jq (sudo apt-get install jq | brew install jq)
#/////////////////////////////////////////////////////////////////////////////////////////////////

export ELEMENTUM_PATH=~/development/weavers-lab/elementumTest3/elementum

#/////////////////////////////////////////////////////////////////////////////////////////////////

#Eng: Define if you want to clean replica. Options: true, false. If true, Install_mode should be "none".
#-----------------------------------------
#Esp: Define si quieres borrar toda la réplica (perder toda la data local). Opciones: true, false. Si es tru, Install_mode debe ser "none".
export CLEAN="false"

#/////////////////////////////////////////////////////////////////////////////////////////////////

#Eng: Mode used to install the wasm in the canister. Options: upgrade, reinstall, none
#-----------------------------------------
#Esp: Modo en el que se realizará la instalación del wasm en el canister. Opciones: upgrade, reinstall, none

export INSTALL_MODE="upgrade"

#/////////////////////////////////////////////////////////////////////////////////////////////////

#Eng: Projects that you need to run. Just active and deactive according to your needs. Options: true, false
#-----------------------------------------
#Esp: Proyectos que necesitas correr. Solo actívalos y desactívalos de acuerdo a lo que necesites. Opciones: true, false.

export HAS_ICP_LEDGER="false"
export HAS_E_BR_SERVICE="false"
export HAS_E_PROFILE="false"
export HAS_E_ASSET_MANAGER="false"
export HAS_E_TOURNAMENT_MANAGER="false"
export HAS_E_BR_FRONTEND="true"
export HAS_E_ADMIN_FRONTEND="false"
export HAS_E_WEBAPP="false"
export HAS_E_BR_NODE="false"

export HAS_E_BR_BACKUP="false"
export HAS_FAUCET="false"
export HAS_CKBTC_LEDGER="false"

#/////////////////////////////////////////////////////////////////////////////////////////////////

#Eng: Environment in which the project should run. Options: local, staging, ic
#-----------------------------------------
#Esp: Entorno en el cual el proyecto debe correr. Opciones: local, staging, ic

export E_BR_SERVICE_ENV="local"
export E_BR_FRONTEND_ENV="local"
export E_BR_NODE_ENV="local"
export E_ADMIN_FRONTEND_ENV="local"
export E_ASSET_MANAGER_ENV="local"
export E_TOURNAMENT_MANAGER_ENV="local"
export E_WEBAPP_ENV="local"
export E_BR_BACKUP_ENV="local"
export FAUCET_ENV="local"
export E_PROFILE_ENV="local"

#/////////////////////////////////////////////////////////////////////////////////////////////////

#Eng: Roles lists needed to use the different projects locally. Format: vec { principal "<principal-id>"; prin... }
#-----------------------------------------
#Esp: Listas de roles necesarios para utilizar localmente los distintos proyectos. Formato: vec { principal "<principal-id>"; prin... }

export ALLOW_PRINCIPAL_0="mlvdq-eg2nv-zsiyw-gc5yk-mvwsn-wd3m6-a2d2i-tf2lf-xbpvu-yhfzb-sqe";
export ALLOW_PRINCIPAL_1="lgohr-fe3ao-jglmh-aivsa-7j75w-d3bdc-ycmyi-qwtdn-zvcei-frnsl-oqe";

export ADMINS_PRINCIPAL_0="mlvdq-eg2nv-zsiyw-gc5yk-mvwsn-wd3m6-a2d2i-tf2lf-xbpvu-yhfzb-sqe";
export ADMINS_PRINCIPAL_1="ircn7-g7maa-v2zab-fgz7m-ofkss-eeskj-msyir-alras-riu7w-k5wrm-xqe";

export TURN_MANAGER_PRINCIPAL_0="cygpo-4nsne-nbahj-py2bk-i7mw7-b4wht-iywa5-kdgxz-wvlxy-q64zn-qqe";
export AUTH_PRINCIPAL_0="cygpo-4nsne-nbahj-py2bk-i7mw7-b4wht-iywa5-kdgxz-wvlxy-q64zn-qqe";
#TODO:
# ALLOW_LIST=("mlvdq-eg2nv-zsiyw-gc5yk-mvwsn-wd3m6-a2d2i-tf2lf-xbpvu-yhfzb-sqe" "ircn7-g7maa-v2zab-fgz7m-ofkss-eeskj-msyir-alras-riu7w-k5wrm-xqe")
# ADMINS_LIST="";
# TURN_MANAGER_LIST="";
# AUTH_LIST=""

#/////////////////////////////////////////////////////////////////////////////////////////////////

#Eng: Accounts Ids to transfer fake currencies in local ledgers.
#-----------------------------------------
#Esp: AccountId donde se transferirán monedas falsas en los ledgers locales.

export ICP_PRINCIPALS=(
    "mlvdq-eg2nv-zsiyw-gc5yk-mvwsn-wd3m6-a2d2i-tf2lf-xbpvu-yhfzb-sqe" 
    "ircn7-g7maa-v2zab-fgz7m-ofkss-eeskj-msyir-alras-riu7w-k5wrm-xqe"
    "lgohr-fe3ao-jglmh-aivsa-7j75w-d3bdc-ycmyi-qwtdn-zvcei-frnsl-oqe"
)
export CKBTC_ACCOUNT_IDS=(
    "mlvdq-eg2nv-zsiyw-gc5yk-mvwsn-wd3m6-a2d2i-tf2lf-xbpvu-yhfzb-sqe" 
    "ircn7-g7maa-v2zab-fgz7m-ofkss-eeskj-msyir-alras-riu7w-k5wrm-xqe"
)

#/////////////////////////////////////////////////////////////////////////////////////////////////

export S_E_BR_SERVICE_CANID="NotStarted"
export S_E_BR_FRONTEND_CANID="NotStarted"
export S_E_ADMIN_FRONTEND_CANID="NotStarted"
export S_E_ASSET_MANAGER_CANID="NotStarted"
export S_E_TOURNAMENT_MANAGER_CANID="NotStarted"
export S_E_PROFILE_CANID="NotStarted"
export S_E_WEBAPP_CANID="NotStarted"
export S_ICP_LEDGER_CANID="NotStarted"
export S_ICRC1_LEDGER_CANID="NotStarted"

#/////////////////////////////////////////////////////////////////////////////////////////////////

#Eng: Access: Define Node JS required envs to call the Game Server and the IC securely.
# If you change some values, you have to modify in Unity and in the TM_Principals to have access.
#-----------------------------------------
#Esp: Acceso: Define los envs requeridos para que el Node Js llame al Game Server y al IC de manera segura.
# Si cambias alguno de los valores, debes modificar en Unity y en los TM_Principal para tener acceso.

export GAME_SERVER_KEY="lol"
export NODE_SEEDPHRASE="ricardo ricardo ricardo ricardo ricardo ricardo ricardo ricardo ricardo ricardo ricardo ricardo"

#/////////////////////////////////////////////////////////////////////////////////////////////////

#Eng: Define if you want to start multiple projects or just one. If one, define which.
#-----------------------------------------
#Esp: Define si quieres iniciar varios proyectos o solo uno. Si es silo uno, define cuál.
export EXECUTION_TYPE="individual" # Options: individual, multiple
#TODO:
# export INDIVIDUAL_PROJECT_NAME="E_ASSET_MANAGER" # Options: <PROJECT_FULL_NAME>, *empty* (Is empty in case EXECUTION_TYPE is multiple)

##////////////////////////-------------------------------////////////////////////
##////////////////////////       Troubleshouting         ////////////////////////
##////////////////////////-------------------------------////////////////////////

#Esp: Opening e-br-frontend, if console shows '<' error, you should fix the assets path on your App.jsx.