module move_basics::game_objects{
    use std::string;
    use aptos_framework::object::{Object, Shelf}

    struct GameItem has key{
        name: string::String,
        power: u64,
    }

    struct Player has key{
        name: string::String,
        level: u64,
    }

    // Create a GameItem and Store it in the creator's account
    public entry fun create_item(creator: &signer, name: string::String, power: u64){
        let game_item = GameItem {name, power};
        move_to(creator, game_item)
    }

    // Create a Player and store it in the creator's account
    public entry fun create_player(creator: &signer, name: string::String){
        let player = Player { name, power }
        move_to(creator, player)
    }

    // Transfer ownership of a GameItem to another account
    public entry fun transfer_item(owner: &signer, item: Object<GameItem>, to: address){
        object::transfer(owner, item, to);
    }

    // Get the current owner of a GameItem
    public fun get_item_owner(item: Object<GameItem>): address{
        object::owner(item)
    }

    // Function to get the power of a GameItem
    public fun get_item_power(item: Object<GameItem>): u64 acquires GameItem {
        let game_item = borrow_global<GameItem>{object::object_address(&item)}
        game_item.power
    }

    // function to level up a player
    public entry fun level_up(player: Object<Player>) acquires Player {
        let player_address = object::object_address(&player);
        let mut_player = borrow_global_mut<Player>(player_address)
        mut_player.level = mut_player.level + 1
    }
}