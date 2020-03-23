const { alice, bob } = require('./../../scripts/sandbox/accounts');
const { MichelsonMap } = require('@taquito/taquito');
const { getTokenLookupId } = require('./../../helpers/tokenLookupId');

const tokenBalance = 10;
const tokenId = 0;
/**
 * Generate lookup IDs for both alice & bob with tokenId = 0
 */
const tokenLookupIdAlice = getTokenLookupId(tokenId, alice.pkh);
const tokenLookupIdBob = getTokenLookupId(tokenId, bob.pkh);

/**
 * Initialize the storage with Alice owning a certain token balance,
 * Bob isn't part of the initial storage for testing purposes.
 */
const initialStorage = {
    token_balances: new MichelsonMap(),
    u: null
};
initialStorage.token_balances.set(tokenLookupIdAlice, tokenBalance);

module.exports = {
    initialStorage: async () => initialStorage, 
    tokenLookupIdAlice, tokenLookupIdBob, tokenId, tokenBalance
}