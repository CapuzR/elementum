
##TO DO


# source ./envs.sh
# # #/////////////////////////////////////////////////////////////////////////////////////////////////

# # #Eng: ICP LEDGER installation.
# # #-----------------------------------------
# # #Esp: Instalación de la ICP LEDGER.
# ICP_LEDGER_PATH=$ELEMENTUM_PATH"/utilities/ledgers/icp"

# cd $ICP_LEDGER_PATH

# #Eng: Define multiple identities necessary to start Elementum ecosystem.
# #-----------------------------------------
# #Esp: Define las identidades necesarias para iniciar el ecosistema elementum

# dfx identity use default
# dfx identity remove minter
# dfx identity new --disable-encryption minter
# dfx identity use minter
# export MINT_ACC=$(dfx ledger account-id)

# dfx identity use default;
# export LEDGER_ACC=$(dfx ledger account-id);

# dfx identity remove testAcc;
# dfx identity new --disable-encryption testAcc;
# dfx identity use testAcc;
# export TEST_ACC=$(dfx ledger account-id);

# dfx identity use default;

# rm ./ledger.did;
# cp ./ledger.private.did ./ledger.did;

# dfx canister create ledger;
# dfx build ledger;
# dfx canister install --mode reinstall --network=local ledger --argument '(record {
#     token_name = opt "Fake ICP";
#     token_symbol = opt "FICP";
#     minting_account = "'${MINT_ACC}'";
#     transfer_fee = opt record{ e8s = 10_000 };
#     initial_values = vec { record { "'${LEDGER_ACC}'"; record { e8s=100_000_000_000 } }; record { "'${TEST_ACC}'"; record { e8s=100_000_000_000 } }; };
#     send_whitelist = vec {};
# })'

# rm ./ledger.did;
# cp ./ledger.public.did ./ledger.did;

# for i in ${ICP_PRINCIPALS[@]}
# do
#     # dfx canister call ledger icrc1_name
#     dfx canister call ledger icrc1_transfer '( record {
#         fee = opt 10_000;
#         to = record {
#             owner = principal "'$i'";
#             subaccount = opt vec { 0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0 }
#         };
#         from_subaccount = null;
#         created_at_time = null;
#         memo = null;
#         amount = 2_000_000_000
#     })';
# done

# #     dfx canister call ledger icrc1_balance_of '(record {
# #         owner = principal "ircn7-g7maa-v2zab-fgz7m-ofkss-eeskj-msyir-alras-riu7w-k5wrm-xqe";
# #         subaccount = opt vec { 0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0 }
# #     })'
