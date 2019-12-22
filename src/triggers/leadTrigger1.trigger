trigger leadTrigger1 on Lead (after insert) {
    if(trigger.isinsert && trigger.isafter){
         list<database.LeadConvert> convert=new list<database.LeadConvert>();
        for(lead i:trigger.new){
           database.LeadConvert l1=new database.LeadConvert();
            leadstatus st=[select id,masterlabel from leadstatus where isconverted=true limit 1];
            l1.setLeadId(i.Id);
            l1.setConvertedStatus(st.MasterLabel);
            l1.setDoNotCreateOpportunity(true);
            convert.add(l1);
            
        }
        list<database.LeadConvertResult> result=database.convertLead(convert);
    }
}