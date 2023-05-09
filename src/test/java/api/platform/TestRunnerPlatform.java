package api.platform;

import com.intuit.karate.junit5.Karate;

public class TestRunnerPlatform {
    @Karate.Test
    Karate testUsers() {
        return Karate.run().relativeTo(getClass());
    }
}
