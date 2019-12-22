trigger userTrigger1 on User (after update) {
map<id,user> oldmap=trigger.oldmap;
    map<id,user> newmap=trigger.newmap;
    
    for(id i:oldmap.keySet()){
        user old=oldmap.get(i);
        user new1=newmap.get(i);
        user u=[select id,managerid from user where username=:old.Username ];
        if(old.IsActive==true && new1.IsActive==false){
           
        }
    }
}