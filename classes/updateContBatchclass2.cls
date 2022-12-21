public class updateContBatchclass2 implements database.Batchable<sObject> {

    public database.QueryLocator start (database.BatchableContext BC)
    {
       return database.getQueryLocator('select id, lastname from contact limit 60') ;
    }
    public void execute (database.BatchableContext BC,List<sObject> scope)
    {
        system.enqueueJob(new updateContQueueclass2(scope));
    }
    public void Finish (database.BatchableContext BC)
    {
        
    }    
}