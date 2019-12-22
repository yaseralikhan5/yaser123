trigger CouponTrigger on coupon__c (before insert) {
    if(trigger.isbefore && trigger.isinsert){
        couponTriggerClass c=new couponTriggerClass();
        c.Insert1(trigger.new);
    }
}