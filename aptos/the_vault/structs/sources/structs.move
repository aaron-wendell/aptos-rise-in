module move_basics::struct_examples{
    // basic struct 
    struct BasicProfile{
        name: vector<u8>,
        age: u8
    }

    //struct with copy ability
    struct Score has copy{
        value: u64
    }

    //struct with drop ability
    struct TemporaryFlag has drop{
        is_active: bool
    }

    //struct with store ability
    struct StorableData has store{
        data: vector<u8>
    }

    //struct with key ability, global storage 
    struct UserAccount has key{
        balance: u64,
        another_field: StorableData
    }

   //struct with many abilities
    struct GameItem has copy, drop, store{
        id: u64,
        name: vector<u8>
    }

    // example of a generic structure 
    struct Container<T> has store{
        item: T
    }
}