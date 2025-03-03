script;

use balance_test_abi::BalanceTest;

#[cfg(experimental_new_encoding = false)]
const CONTRACT_ID = 0x3120fdd1b99c0c611308aff43a99746cc2c661c69c22aa56331d5f3ce5534ee9;
#[cfg(experimental_new_encoding = true)]
const CONTRACT_ID = 0x2393ab4d437acea9f3e916ddd728218ac2dca45dcfabe3b2fe83926a4dc0e737;

fn main() -> bool {
    let balance_test_contract = abi(BalanceTest, CONTRACT_ID);
    let number = balance_test_contract.get_42 {
        gas: u64::max()
    }
    ();

    let balance = asm(asset_bal, asset: AssetId::base(), id: CONTRACT_ID) {
        bal asset_bal asset id;
        asset_bal: u64
    };
    assert(balance == 0);
    assert(number == 42);

    true
}
