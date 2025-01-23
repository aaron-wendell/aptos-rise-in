module move_basics::signer_examples{
    use std::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin:: AptosCoin;

    //Resource to represent user data
    struct UserProfile has key{
        name: vector<u8>,
        balance: u64,
    }

    // Initialize a user profile
    public entry fun initialize_profile(user: &signer, name: vector<u8>){
        move_to(user, UserProfile {
            name,
            balance: 0,
        })
    }

    // Update user's balance
    public entry fun update_user_balance(user: &signer) acquires UserProfile{
        let user_addr = signer::address_of(user)
        let profile = borrow_global_mut<UserProfile>(user_addr)
        profile.balance = coin::balance<AptosCoin>(user_addr);
    }

    // Transfer coins using signer
    public entry fun transfer_user_coins(from: &signer, to: address, amount: u64){
        coin::transfer<AptosCoin>(from, to, amount);
    }
}