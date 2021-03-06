type operatorTransferPolicy =
| No_transfer
| Owner_transfer
| Owner_or_operator_transfer // default

type ownerHookPolicy =
| Owner_no_hook // default
| Optional_owner_hook
| Required_owner_hook

type customPermissionPolicy = {
    tag: string,
    config_api: option(address)
}

type permissionsDescriptor = {
    operator: operatorTransferPolicy,
    receiver: ownerHookPolicy,
    sender: ownerHookPolicy,
    custom: option(customPermissionPolicy)
}

// non-standard
type operatorUpdatePolicy =
| No_update
| Owner_update // default
| Owner_or_operator_update