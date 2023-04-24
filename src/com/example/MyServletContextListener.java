package com.example;
import jakarta.servlet.*;
import com.example.model.user.*;
import com.example.model.manager.*;
import java.util.*;
public class MyServletContextListener implements ServletContextListener {
    public void contextInitialized(ServletContextEvent event) {
        ManagerService.products = new ArrayList<ProductForSale>();
        //new product
        ManagerService.newProducts = new ArrayList<ProductForSale>();

        ManagerService.products.add(new ProductForSale("./assets/img/superstar.jpeg", "./assets/img/superstar detail 1.jpeg", "./assets/img/superstar detail 2.jpeg", "./assets/img/superstar detail 3.jpeg", "siêu bền", "SUPERSTAR", "Adidas", 20, 2200000, 1000000, true));
        ManagerService.products.add(new ProductForSale("./assets/img/jordan 1 mid tuft orange.jpeg", "màu cam", "JORDAN 1 MID TUFT ORANGE", "Nike", 10, 5800000, 1000000, true));
        ManagerService.products.add(new ProductForSale("./assets/img/air force 1 shadow multicolor.jpeg", "nhiều màu", "AIR FORCE 1 SHADOW MULTICOLOR", "Nike", 12, 3900000, 1000000, true));
        ManagerService.products.add(new ProductForSale("./assets/img/ultraboost 4.0 dna.jpg", "màu đen", "ULTRABOOST 4.0 DNA", "Adidas", 71, 3800000, 1000000, true));
        ManagerService.products.add(new ProductForSale("./assets/img/day jogger dash green linen.jpg", "không biết màu gì", "DAY JOGGER DASH GREEN LINEN", "Adidas", 21, 2200000, 1000000, true));
        ManagerService.newProducts.add(new ProductForSale("./assets/img/superstar.jpeg", "./assets/img/superstar detail 1.jpeg", "./assets/img/superstar detail 2.jpeg", "./assets/img/superstar detail 3.jpeg", "siêu bền", "SUPERSTAR", "Adidas", 20, 2200000, 1000000, true));
        ManagerService.newProducts.add(new ProductForSale("./assets/img/jordan 1 mid tuft orange.jpeg", "màu cam", "JORDAN 1 MID TUFT ORANGE", "Nike", 10, 5800000, 1000000, true));
        ManagerService.newProducts.add(new ProductForSale("./assets/img/air force 1 shadow multicolor.jpeg", "nhiều màu", "AIR FORCE 1 SHADOW MULTICOLOR", "Nike", 12, 3900000, 1000000, true));
        ManagerService.newProducts.add(new ProductForSale("./assets/img/ultraboost 4.0 dna.jpg", "màu đen", "ULTRABOOST 4.0 DNA", "Adidas", 71, 3800000, 1000000, true));
        ManagerService.newProducts.add(new ProductForSale("./assets/img/day jogger dash green linen.jpg", "không biết màu gì", "DAY JOGGER DASH GREEN LINEN", "Adidas", 21, 2200000, 1000000, true));



        //hot product
        ManagerService.hotProducts = new ArrayList<ProductForSale>();

        ManagerService.products.add(new ProductForSale("./assets/img/adidas ultra 4dfwd.jpg", "màu đen", "ADIDAS ULTRA 4DFWD", "Adidas", 41, 5800000, 1000000));
        ManagerService.products.add(new ProductForSale("./assets/img/falcon pink purple.jpeg", "màu hồng", "FALCON PINK PURPLE", "Adidas", 124, 2600000, 1000000));
        ManagerService.products.add(new ProductForSale("./assets/img/air max bliss.jpeg", "màu xanh lá cây", "AIR MAX BLISS", "Nike", 121, 2900000, 1000000));
        ManagerService.products.add(new ProductForSale("./assets/img/nike zoom fly 5.jpeg", "màu trắng đen", "NIKE ZOOM FLY", "Nike", 63, 2200000, 1000000));
        ManagerService.products.add(new ProductForSale("./assets/img/nike quest 5.jpeg", "màu đen", "NIKE QUEST 5", "Nike", 93, 2200000, 1000000));
        ManagerService.hotProducts.add(new ProductForSale("./assets/img/adidas ultra 4dfwd.jpg", "màu đen", "ADIDAS ULTRA 4DFWD", "Adidas", 41, 5800000, 1000000));
        ManagerService.hotProducts.add(new ProductForSale("./assets/img/falcon pink purple.jpeg", "màu hồng", "FALCON PINK PURPLE", "Adidas", 124, 2600000, 1000000));
        ManagerService.hotProducts.add(new ProductForSale("./assets/img/air max bliss.jpeg", "màu xanh lá cây", "AIR MAX BLISS", "Nike", 121, 2900000, 1000000));
        ManagerService.hotProducts.add(new ProductForSale("./assets/img/nike zoom fly 5.jpeg", "màu trắng đen", "NIKE ZOOM FLY", "Nike", 63, 2200000, 1000000));
        ManagerService.hotProducts.add(new ProductForSale("./assets/img/nike quest 5.jpeg", "màu đen", "NIKE QUEST 5", "Nike", 93, 2200000, 1000000));



        //sale off
        ManagerService.saleOffProducts = new ArrayList<ProductForSale>();

        ManagerService.products.add(new ProductForSale("./assets/img/nike pegasus 39.jpeg", "màu hồng", "NIKE PEGASUS 39", "Nike", 26, 3900000, 1000000, 0.9));
        ManagerService.products.add(new ProductForSale("./assets/img/nike air zoom pegasus 39.jpeg", "màu tím", "NIKE AIR ZOOM PEGASUS 39", "Adidas", 14, 3900000, 1000000, 0.92));
        ManagerService.products.add(new ProductForSale("./assets/img/ultraboost 20 metallic gold.jpeg", "trắng tinh", "ULTRABOOST 20 METALLIC GOLD", "Adidas", 10, 4200000, 1000000, 0.69));
        ManagerService.products.add(new ProductForSale("./assets/img/nike court vision low next nature.jpeg", "màu đỏ", "ULTRABOOST 21", "Adidas", 66, 4200000, 1000000, 0.9));
        ManagerService.products.add(new ProductForSale("./assets/img/jordan series es phantom.jpeg", "màu da người", "JORDAN SERIES ES PHANTOM", "Nike", 6, 3200000, 1000000, 0.9));
        ManagerService.saleOffProducts.add(new ProductForSale("./assets/img/nike pegasus 39.jpeg", "màu hồng", "NIKE PEGASUS 39", "Nike", 26, 3900000, 1000000, 0.9));
        ManagerService.saleOffProducts.add(new ProductForSale("./assets/img/nike air zoom pegasus 39.jpeg", "màu tím", "NIKE AIR ZOOM PEGASUS 39", "Adidas", 14, 3900000, 1000000, 0.92));
        ManagerService.saleOffProducts.add(new ProductForSale("./assets/img/ultraboost 20 metallic gold.jpeg", "trắng tinh", "ULTRABOOST 20 METALLIC GOLD", "Adidas", 10, 4200000, 1000000, 0.69));
        ManagerService.saleOffProducts.add(new ProductForSale("./assets/img/nike court vision low next nature.jpeg", "màu đỏ", "ULTRABOOST 21", "Adidas", 66, 4200000, 1000000, 0.9));
        ManagerService.saleOffProducts.add(new ProductForSale("./assets/img/jordan series es phantom.jpeg", "màu da người", "JORDAN SERIES ES PHANTOM", "Nike", 6, 3200000, 1000000, 0.9));



        // //nothing
        // ManagerService.products.add(new ProductForSale("./assets/img/adidas forum low cl.jpg", "không biết màu", "ADIDAS FORUM LOW CL", "Adidas", 34, 2900000, 1000000));
        // ManagerService.products.add(new ProductForSale("./assets/img/adidas nmd r1 refined.jpg", "màu trắng", "ADIDAS NMD R1 REFINED", "Adidas", 44, 2900000, 1000000));
        // ManagerService.products.add(new ProductForSale("./assets/img/adidas stan smith.jpg", "màu trắng", "adidas stan smith", "Adidas", 26, 2900000, 1000000));
        // ManagerService.products.add(new ProductForSale("./assets/img/adidas x9000l4.jpg", "màu xanh lá", "adidas x9000l4", "Adidas", 31, 2900000, 1000000));
        // ManagerService.hotProducts.add(new ProductForSale("./assets/img/adidas forum low cl.jpg", "không biết màu", "ADIDAS FORUM LOW CL", "Adidas", 34, 2900000, 1000000));
        // ManagerService.hotProducts.add(new ProductForSale("./assets/img/adidas nmd r1 refined.jpg", "màu trắng", "ADIDAS NMD R1 REFINED", "Adidas", 44, 2900000, 1000000));
        // ManagerService.hotProducts.add(new ProductForSale("./assets/img/adidas stan smith.jpg", "màu trắng", "adidas stan smith", "Adidas", 26, 2900000, 1000000));
        // ManagerService.hotProducts.add(new ProductForSale("./assets/img/adidas x9000l4.jpg", "màu xanh lá", "adidas x9000l4", "Adidas", 31, 2900000, 1000000));

        ManagerService.accounting = new Accounting();
        ManagerService.productsName = new ArrayList<String>();
        ManagerService.noOfSolds = new ArrayList<Integer>();
        // ManagerService.productsName = new ArrayList<String>();
        for(int i = 0; i < ManagerService.products.size(); i++) {
            ManagerService.accounting.updateExpense(ManagerService.products.get(i).getInitPrice() * ManagerService.products.get(i).getQuantity());
            ManagerService.productsName.add(ManagerService.products.get(i).getName());
            ManagerService.noOfSolds.add(ManagerService.products.get(i).getNoOfSolds());
        }
        
        ManagerService.users = new ArrayList<User>();
        // event.getServletContext().setAttribute("noOfOrders", noOfOrders);
    }
    
    public void contextDestroyed(ServletContextEvent event) {
        // nothing to do here
    }
}