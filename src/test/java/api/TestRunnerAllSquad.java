package api;

import com.intuit.karate.junit5.Karate;

public class TestRunnerAllSquad {
    @Karate.Test
    Karate testUsers() {
        return Karate.run().relativeTo(getClass());
    }
}
