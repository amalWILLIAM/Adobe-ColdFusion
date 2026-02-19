component accessors="true" {

    property productServices;

    public function init(fw) {
        variables.fw = fw;
        return this;
    }

    public function index(rc){

       rc.products = productServices.getAll();



        return "productsA/index";
    }

    public function add(rc){

    }

    public function insert(rc){

        var uploadFile = "";
        if (structKeyExists(rc, "image") AND len(rc.image)) 
        { 
        var uploadPath = expandPath("/shopping_website/assets/products/");

        if (!directoryExists(uploadPath)) 
        {
        directoryCreate(uploadPath, true);
        }
        uploadFile = fileUpload(uploadPath,rc.image,"image/jpeg,image/png,image/webp","makeUnique");

        rc.image = uploadFile.serverFile; 

        
        }
        


        productServices.addProduct(rc);  

        variables.fw.redirect("productsA.index");

    }

    public function edit(rc)
    {

       rc.products = productServices.getById(rc);

    }

    public function updateProduct(rc)
    {
        var uploadFile = "";

        // Check if new image uploaded
        if (structKeyExists(rc, "image") AND len(rc.image))
        {
            var uploadPath = expandPath("/shopping_website/assets/products/");

            if (!directoryExists(uploadPath))
            {
                directoryCreate(uploadPath, true);
            }

            uploadFile = fileUpload(
                uploadPath,
                rc.image,
                "image/jpeg,image/png,image/webp",
                "makeUnique"
            );

            rc.image = uploadFile.serverFile;
        }
        else
        {
            // If no new image uploaded, remove image key
            structDelete(rc, "image");
        }

        productServices.updateProducts(rc);

        variables.fw.redirect("productsA.index");
    }


    public function deleteProduct(rc)
    {

        productServices.delete(rc);

        variables.fw.redirect('productsA.index');

    }




}