public class ConditionTestApexClass {
  public String industry;
    public String rating;
    public String status;
    public void call(){
        if(industry=='Energy'){
            rating='Hot';
            status='New';
        }else{
            rating='Cold';
            status='Existing';
        }
    }
}

/*public class ConditionTestApexClass {
public string industry;
    public string rating;
    public integer amount;
    public void call(){
        if(industry=='banking'){
            rating='hot';
            amount=1000;
        }
        else{
            rating='cold';
            amount=5000;
        }
    }
}*/