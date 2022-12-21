public class updateaccts {    
            public static boolean triggeronce = true ;
    public static boolean change = true ;
    public  integer i = 0;   
    public static void createaccmerger()
    {
        system.debug('i am here');
    }
    public void updateaccoutandcontact1()
    {
        change = false;
        system.debug('my integer val:' + i);
        i = i+1;
        system.debug('my triggeronce boolean val:' + triggeronce );
        system.debug('my change boolean val:' + change );
        system.debug('my integer val:' + i);
        
    }
   
    public static void updateaccoutandcontact(set<string> accountids, map<id, contact> accountiddets)
	{
		List<Account> updaccts = new List<Account>();
        List<contact> updconts = new List<contact>();
		List<Account> accts = [select id,shippingCountry,(select id,MailingCountry from contacts) from Account where id in :accountids];
		
	if (accts.size() > 0)
	{
		for (Account a : accts)
			{
				a.shippingCountry = accountiddets.get(a.id).MailingCountry;
                for (contact c : a.contacts) 
                {
                    c.MailingCountry = accountiddets.get(a.id).MailingCountry;
                    updconts.add(c);
                }
				updaccts.add(a);
				
			}        
        updateaccts upd = new updateaccts();
        upd.updateaccoutandcontact1();
        triggeronce = false;
		update updaccts;
        update updconts;        
		upd.updateaccoutandcontact1();

}

}
}