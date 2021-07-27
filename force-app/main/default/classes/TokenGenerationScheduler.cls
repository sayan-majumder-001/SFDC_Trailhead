global with sharing class TokenGenerationScheduler implements Schedulable {
    global void execute(SchedulableContext SC) {
        System.enqueueJob(new GenerateTokenForTestSFDCService());
     }
}
