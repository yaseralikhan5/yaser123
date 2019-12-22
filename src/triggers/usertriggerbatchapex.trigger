trigger usertriggerbatchapex on User (before update) {
    
/*map<id,user> oldmap=trigger.oldmap;
    map<id,user> newmap=trigger.newmap;
    for(id d:oldmap.keySet()){
        user old=oldmap.get(d);
        user new1=newmap.get(d);
        if(old.IsActive!=false && new1.IsActive==false){
            abc22 abc=new abc22(d,old.ManagerId);
            database.executeBatch(abc);
        }
    }*/
}