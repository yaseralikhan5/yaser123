public class nov29ex1 {
    public string email1 {set;get;}
    public void invoke(){
        try
        {
            String emailRegex = '([a-zA-Z0-9_\\-\\.]+)@((\\[a-z]{1,3}\\.[a-z]{1,3}\\.[a-z]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})';
			Pattern MyPattern = Pattern.compile(emailRegex);

			// Then instantiate a new Matcher object "MyMatcher"
			Matcher MyMatcher = MyPattern.matcher(email1);

			if (!MyMatcher.matches()) {
			apexpages.Message msg=new apexpages.Message(apexpages.Severity.ERROR,'Email format is not correct');
   			 apexpages.addmessage(msg);
		}
            
        }
       		 catch(exception e){
            	apexpages.Message msg1=new apexpages.Message(apexpages.Severity.ERROR,'The problem is '+e.getMessage());
            	apexpages.addMessage(msg1);
        }

    }
}