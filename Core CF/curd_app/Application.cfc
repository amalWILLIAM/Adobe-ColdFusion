component {

    this.name = "cf_crud_app";
    this.applicationTimeout = createTimespan(1,0,0,0);

    this.sessionManagement = true;
    this.sessionTimeout = createTimespan(0,1,0,0);

    this.datasource = "cf_curd";

}