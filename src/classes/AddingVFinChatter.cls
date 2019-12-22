public with sharing class AddingVFinChatter {
    public AddingVFinChatter(){
   
     
      // the contentdocument is for versioning
          contentdocument d=[select id from contentdocument where title='abc' limit 1];
        
       contentversion cv=new contentversion();
        pagereference p=page.abc2;
        cv.versionData = p.getContent();
        cv.title = 'abc';
        cv.SharingOption='A';
        cv.ContentDocumentId=d.id;
        cv.IsMajorVersion=false;
        cv.pathOnClient ='xyz.xls';
        cv.Description = 'description';
        insert cv;           
       
        feeditem post=new feeditem();
        post.Body='This is a programmatically generated feed';
        post.Title='xyz';
        post.ParentId='0010o00002TU6f7';
        insert post;
        
        feedattachment attach=new feedattachment();
        attach.FeedEntityId=post.id;
        attach.RecordId=cv.id;
        attach.Title='abc';
        attach.Type='content';
        insert attach;
    }
}