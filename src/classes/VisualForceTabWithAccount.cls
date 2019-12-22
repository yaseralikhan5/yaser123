public class VisualForceTabWithAccount{
    public String accName 		{set;get;}
    public string accRating		{set;get;}
    public String accPhone		{set;get;}
    public String accIndustry	{set;get;}
    public void create(){
/*
 * 
 * Tab example
 * 
 * <apex:page standardController="account">
<apex:form >
    <apex:tabPanel activeTabClass="Two">
    <apex:tab id="one" label="Tab One">
        <apex:pageblock >
        <apex:sectionHeader title="Account details"/>
            <apex:pageBlockButtons location="Top">
            <apex:commandButton action="{!save}" value="Save" />
            </apex:pageBlockButtons>
           <apex:pageBlockSection >
            <apex:pageBlockSectionItem >
                <apex:outputLabel value="Name:"></apex:outputLabel>
                <apex:inputField value="{!account.name}"/>
                </apex:pageBlockSectionItem>
            </apex:pageBlockSection>
          <apex:pageBlockSection >
            <apex:pageBlockSectionItem >
                <apex:outputLabel value="industry:"></apex:outputLabel>
                <apex:inputField value="{!account.industry}"/>
                </apex:pageBlockSectionItem>
            </apex:pageBlockSection>
              <apex:pageBlockSection >
            <apex:pageBlockSectionItem >
                <apex:outputLabel value="phone:"></apex:outputLabel>
                <apex:inputField value="{!account.phone}"/>
                </apex:pageBlockSectionItem>
            </apex:pageBlockSection>
              <apex:pageBlockSection >
            <apex:pageBlockSectionItem >
                <apex:outputLabel value="Description:"></apex:outputLabel>
                <apex:inputField value="{!account.description}"/>
                </apex:pageBlockSectionItem>
            </apex:pageBlockSection>
        </apex:pageblock>
        
        </apex:tab>
    <apex:tab id="Two" label="Tab Two">
       <apex:dataTable value="{!Account.contacts}" var="a" border="5" cellspacing="5" cellpadding="5" rules="cols">
            <apex:column headerValue="Lead Source" value="{!a.Leadsource}"  />
            <apex:column headerValue="Assistant Name" value="{!a.assistantname}"/>
            <apex:column headerValue="Clean Status" value="{!a.cleanstatus}"/>
        </apex:dataTable> 
        
        
        </apex:tab>
    
    
    </apex:tabPanel>
    
    </apex:form>
</apex:page>



*/
        try{
            Account data =new Account();
            //data.Name=accName;
           // data.rating=accRating;
            //data.phone=accPhone;
            //data.industry=accIndustry;
            insert data;
            System.debug('Insertion Success');
            Apexpages.Message msg =new Apexpages.Message(Apexpages.Severity.CONFIRM,'Record saved Successfully');
            Apexpages.addMessage(msg);
        }catch(Exception e){
            Apexpages.Message msg =new Apexpages.Message(Apexpages.Severity.ERROR,''+e.getCause());
            Apexpages.addMessage(msg);
        }
    }
}