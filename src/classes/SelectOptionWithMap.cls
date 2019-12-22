public class SelectOptionWithMap {
    public list<selectoption> cities {set;get;}
    public list<selectoption> places {set;get;}
    public map<string,list<string>> mapcity {set;get;}
    public string selected {set;get;}
    public SelectOptionWithMap()
    {
        cities=new list<selectoption>();
        places=new list<selectoption>();
        mapcity=new map<string,list<string>>();
        list<string> c=new list<string>{'golconda','charminar'};
            list<string> h= new list<string>{'bolivali','bandra'};
                mapcity.put('hyd', c);
        mapcity.put('mumbai',h);
        set<string> s=mapcity.keySet();
        selectoption o=new selectoption('none','none');
            cities.add(o);
        places.add(o);
        for(string st:s)
        {
            selectoption ot=new selectoption(st,st);
                cities.add(ot);
        }
            
    }
    public void fetch()
    {
        places.clear();
        if(selected=='none')
        {
            selectoption o1=new selectoption('none','none');
                places.add(o1);
            
        }
        else
        {
        list<string> fetch=mapcity.get(selected);
        for(string s:fetch)
        {
            selectoption o=new selectoption(s,s);
            places.add(o);
        }
        }
            
    }

}