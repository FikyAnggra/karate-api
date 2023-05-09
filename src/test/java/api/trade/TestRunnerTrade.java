package api.trade;

import com.intuit.karate.junit5.Karate;

public class
TestRunnerTrade {
    @Karate.Test
    Karate testUsers() {
        return Karate.run().relativeTo(getClass());
    }
}
