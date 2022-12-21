public class updateContQueueclass2 implements Queueable {
    List<Contact> Ctlst = new List<Contact>();
    List<Contact> UpCtlst = new List<Contact>();
    public updateContQueueclass2(List<Contact> lst)
    {
      Ctlst = lst;
    }
	public void execute(queueablecontext ct)
	{
        { long timediff = 0;
        DateTime FirstTime = System.now();
        do
        {
            timeDiff = system.now().getTime() - FirstTime.getTime();
        }
        while(timediff<=60000)
            ;}
		for (contact c : Ctlst)
        {
           c.lastname = c.lastname + 'hell';
            UpCtlst.add(c);
        }
        update UpCtlst;
	}
}