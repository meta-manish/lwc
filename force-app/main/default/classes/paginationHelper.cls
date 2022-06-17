public class paginationHelper {
    public paginationHelper(ApexPages.StandardSetController controller) {
        controller.setPageSize(10);
    }
}