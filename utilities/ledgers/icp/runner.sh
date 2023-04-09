# #/////////////////////////////////////////////////////////////////////////////////////////////////

# #Eng: ICP LEDGER installation.
# #-----------------------------------------
# #Esp: Instalación de la ICP LEDGER.
ICP_LEDGER_PATH=$ELEMENTUM_PATH"/utilities/ledgers/icp"

. ./settings.sh
cd $ICP_LEDGER_PATH

#Eng: Define multiple identities necessary to start Elementum ecosystem.
#-----------------------------------------
#Esp: Define las identidades necesarias para iniciar el ecosistema elementum

dfx identity use default
dfx identity remove minter
dfx identity new --disable-encryption minter
dfx identity use minter
MINT_ACC=$(dfx ledger account-id)

dfx identity use default
LEDGER_ACC=$(dfx ledger account-id)

dfx identity remove testAcc
dfx identity new --disable-encryption testAcc
dfx identity use testAcc
TEST_ACC=$(dfx ledger account-id);

dfx identity use default

rm ./ledger.did;
cp ./ledger.private.did ./ledger.did;

if [ $E_ASSET_MANAGER_ENV = "local" ]
then
    dfx canister create icp_ledger
fi

echo $(dfx canister id icp_ledger);

dfx build icp_ledger;
if [ $INSTALL_MODE = "none" ]
then
    dfx canister install --network=local icp_ledger --argument '(record {
        token_name = opt "Fake ICP";
        token_symbol = opt "FICP";
        minting_account = "'${MINT_ACC}'";
        transfer_fee = opt record{ e8s = 10_000 };
        initial_values = vec { record { "'${LEDGER_ACC}'"; record { e8s=1_000_000_000_000_000_000 } }; record { "'${TEST_ACC}'"; record { e8s=1_000_000_000_000_000_000 } }; };
        send_whitelist = vec {};
    })' >/dev/null
else
    dfx canister install --mode $INSTALL_MODE --network=local icp_ledger --argument '(record {
        token_name = opt "Fake ICP";
        token_symbol = opt "FICP";
        minting_account = "'${MINT_ACC}'";
        transfer_fee = opt record{ e8s = 0 };
        initial_values = vec { record { "'${LEDGER_ACC}'"; record { e8s=1_000_000_000_000_000_000 } }; record { "'${TEST_ACC}'"; record { e8s=1_000_000_000_000_000_000 } }; };
        send_whitelist = vec {};
    })' >/dev/null
fi

rm ./ledger.did;
cp ./ledger.public.did ./ledger.did;

for i in ${ICP_PRINCIPALS[@]}
do
    dfx canister call icp_ledger icrc1_transfer '( record {
        fee = opt 10_000;
        to = record {
            owner = principal "'$i'";
            subaccount = null
        };
        from_subaccount = null;
        created_at_time = null;
        memo = null;
        amount = 2_000_000_000_000
    })' >/dev/null
done

dfx generate icp_ledger

#     dfx canister call icp_ledger icrc1_balance_of '(record {
#         owner = principal "ircn7-g7maa-v2zab-fgz7m-ofkss-eeskj-msyir-alras-riu7w-k5wrm-xqe";
#         subaccount = opt vec { 0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0 }
#     })'