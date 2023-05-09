package api.proearn;

import com.intuit.karate.junit5.Karate;

public class TestRunnerProearn {

    @Karate.Test
    Karate RunnerProearn() {
        return Karate.run().relativeTo(getClass());
    }
//    @Karate.Test
//    Karate Regression() {
//        return Karate.run().tags("@Regression").relativeTo(getClass());
//    }
    @Karate.Test
    Karate AuthGenerate() {
        return Karate.run().tags("@AuthGenerate").relativeTo(getClass());
    }
    @Karate.Test
    Karate EarnCalculator() {
        return Karate.run().tags("@EarnCalculator").relativeTo(getClass());
    }
    @Karate.Test
    Karate EarnInfoListSku() {
        return Karate.run().tags("@EarnInfoListSku").relativeTo(getClass());
    }
//    @Karate.Test
//    Karate EarnInfoList() {
//        return Karate.run().tags("@EarnInfoList").relativeTo(getClass());
//    }
//    @Karate.Test
//    Karate EarnUserAsset() {
//        return Karate.run().tags("@EarnUserAsset").relativeTo(getClass());
//    }
//    @Karate.Test
//    Karate EarnUserPortfolio() {
//        return Karate.run().tags("@EarnUserPortfolio").relativeTo(getClass());
//    }
//    @Karate.Test
//    Karate EarnUserTransactionHistory() {
//        return Karate.run().tags("@EarnUserTransactionHistory").relativeTo(getClass());
//    }
//    @Karate.Test
//    Karate ExitEarn() {
//        return Karate.run().tags("@ExitEarn").relativeTo(getClass());
//    }
//    @Karate.Test
//    Karate JoinEarn() {
//        return Karate.run().tags("@JoinEarn").relativeTo(getClass());
//    }
}
