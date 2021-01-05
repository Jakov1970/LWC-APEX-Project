public with sharing class newsController {
    
    @AuraEnabled    
    public static Map<String, Object> retriveNews(){
        HttpRequest httpRequest = new HttpRequest();
        httpRequest.setEndpoint('http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=181d0f8389fc43eb8c1ec90f20444381');
    
        httpRequest.setMethod('GET');

        Map<String, Object> newsJsonData = new Map<String, Object>();
        String strResponse = null;

        try{
            Http http = new Http();
            HttpResponse HttpResponse = http.send(httpRequest);
            if(HttpResponse.getStatusCode() ==200){
                strResponse = HttpResponse.getBody();
            }
            else {
                throw new CalloutException(HttpResponse.getBody());
            }
        }
        catch(Exception ex){
            throw ex;
        }

        if(!String.isBlank(strResponse)){
            newsJsonData = (Map<String, Object>)JSON.deserializeUntyped(strResponse);
        }
        if(!newsJsonData.isEmpty()){
            return newsJsonData;
        } else{
            return null;
        }
    
    }
    
}
