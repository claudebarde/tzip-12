#include "../../partials/tzip_12/action/action.ligo"
#include "../../partials/tzip_12/storage/storage.ligo"
#include "../../partials/tzip_12/transfer/transfer.ligo"
#include "../../partials/tzip_12/balance_of/balance_of.ligo"

(* Default function that represents our contract, it's sole purpose here is the entrypoint routing *)
function main (const action : action; var storage : storage) : (list(operation) * storage)
    is (case action of
    (* 
        Unwrap the `Transfer(...)` parameters and invoke the transfer function.
        The return value of `transfer(...)` is then returned as a result of `main(...)` as well.
     *)
    | Transfer(transfer_param) -> transfer(transfer_param, storage)
    | Balance_of(balance_of_param) -> balance_of(balance_of_param, storage)
    end)