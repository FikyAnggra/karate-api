package api.wallet;

import com.intuit.karate.junit5.Karate;

public class TestRunnerWallet {
//    @Karate.Test
//    Karate testUsers() {
//        return Karate.run().relativeTo(getClass());
//    }

    @Karate.Test
    Karate Validate() {
        return Karate.run().tags("@test").relativeTo(getClass());
    }
}
