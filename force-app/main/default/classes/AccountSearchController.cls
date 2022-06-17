public class AccountSearchController {
    public Integer searchRecords{get;set;}
    public String billingCity{get;set;}
    public String billingState{get;set;}
    public String billingCountry{get;set;}
    public List<Account> result{get;set;}
    Public Integer totalRecords = 0;
    Public Integer pageSize = 10;
    Public Integer offsetSize = 0;
    Public Integer pageNumber = 0;
    
    public Integer getTotalRecords(){
        return totalRecords;
    }
    
    public Integer getOffsetSize(){
        return offsetSize;
    }
    
    public Integer getpageSize(){
        return pageSize;
    }
    
    public Integer getPageNumber(){
        return pageNumber;
    }
    
    public void search(){
        totalRecords = [SELECT count() FROM Account WHERE BillingCity = :this.BillingCity AND BillingState = :this.BillingState 
                        AND BillingCountry = :this.BillingCountry];
        if(searchRecords != null){
            pageSize = searchRecords;
        }
        if(pageNumber==0){
            pageNumber=1;
        }
        string query = 'SELECT Id, Name, BillingCity, BillingState, BillingCountry FROM Account WHERE ' +
                      'BillingCity = :billingCity AND BillingState = :billingState AND ' +
                      'BillingCountry = :billingCountry LIMIT :pageSize OFFSET :offsetSize';
        result = Database.query(query);
    }
    
    public void FirstPage() {
		OffsetSize = 0;
        this.search();
        pageNumber = 1;
	}

    public void previous() {
		OffsetSize = OffsetSize - pageSize;
        this.search();
        pageNumber--;
	}
    
    public void next() {
		OffsetSize = OffsetSize + pageSize;
        this.search();
        pageNumber++;
	}
    
    public void LastPage() {
		OffsetSize = totalRecords - math.mod(totalRecords, pageSize);
        this.search();
        pageNumber = (Integer)math.floor(OffsetSize/pageSize) + 1;
	}

    public boolean getPrev() {
		if(OffsetSize == 0)
			return true;
		else
            return false;
    }
    
    public boolean getNxt() {
        if((OffsetSize + pageSize) > totalRecords)
            return true;
        else
            return false;
    }
}