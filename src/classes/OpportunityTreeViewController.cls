public class OpportunityTreeViewController{
     
    public Map<String, Map<String, List<MINIProject4Wrapper>>> mapOpportunities{get;set;}
    public list<MINIProject4Wrapper> wrap;
    public string externalid {set;get;}
    public string accountname {set;get;}
    public date closedate {set;get;}
    public string stagename {set;get;}
    public boolean createselect {set;get;}
    public boolean blockflag {set;get;}
    public integer count {set;get;}
    public list<opportunity> opp;
     
    // Get opportunity records - Calling it a page action attribute.
    public  OpportunityTreeViewController(){
        count=0;
         		closedate=null ;
                externalid='';
                stagename='';
        createselect=false;
        blockflag=false;
        wrap=new list<MINIProject4Wrapper>();
        mapOpportunities = new Map<String, Map<String, List<MINIProject4Wrapper>>>();
         opp=[select id,name,closedate,stagename from opportunity];
        list<Opty_temp__c> opty=[select name,account_name__r.name,stage__c,close_date__c,oppid__c from opty_temp__c order by close_date__c];
        for(opty_temp__c c:opty){
            MINIProject4Wrapper w=new MINIProject4Wrapper();
            w.temp=c;
            //w.flag=false;
            wrap.add(w);
        }
         
        for(MINIProject4Wrapper oppRecord:wrap)
        {
                                       
            String closeDate =oppRecord.temp.close_date__c.format();
            if(mapOpportunities.get(closeDate) != null){
                if(mapOpportunities.get(closeDate).get(oppRecord.temp.account_name__r.name) != null)
                    mapOpportunities.get(closeDate).get(oppRecord.temp.account_name__r.name).add(oppRecord);
                else
                    mapOpportunities.get(closeDate).put(oppRecord.temp.account_name__r.name, new List<MINIProject4Wrapper>{oppRecord});
            }
            else{
                mapOpportunities.put(closeDate, new Map<String, List<MINIProject4Wrapper>>{oppRecord.temp.account_name__r.name => new List<MINIProject4Wrapper>{oppRecord}});
            }                                                                            
        }   
    } 
    public void populate()
    {
        count++;
     blockflag=true;
        
    			 closedate=null ;
                externalid='';
                stagename='';
        
         for(MINIProject4Wrapper w1:wrap){
            if(w1.flag==true){
                //accountname=w1.temp.account_name__r.name;
                closedate=w1.temp.close_date__c;
                externalid=w1.temp.oppid__c;
                stagename=w1.temp.stage__c;
               // w1.flag=false;
                /*for(opportunity p:opp){
            
                    if(p.name==w1.temp.oppid__c){
                       createselect=false;
                    }
                    else
                    {
                        createselect=true;
                    }
            }*/
         }
    }
        
    }
    public void update1()
    {
        //list<opportunity> opp=[select id,name,closedate,stagename from opportunity];
        list<opportunity> opp1=new list<opportunity>();
        
                for(opportunity p:opp){
            
                    if(p.name==externalid){
                        p.closedate=closedate;
                        p.stagename=stagename;
                        update p;
                    }
        				}
           					 }
        
    public void delete1()
    {
        for(MINIProject4Wrapper w1:wrap){
            if(w1.flag==true){
                delete w1.temp;
            }
        }
    }
        public void create1()
        {
            opportunity p=new opportunity();
            p.Name=externalid;
            p.StageName=stagename;
            p.closedate=closedate;
            insert p;
        }
}