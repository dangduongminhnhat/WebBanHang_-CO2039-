package com.example;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import com.example.model.user.*;
import com.example.model.manager.*;
import com.example.model.*;
import java.util.*;
public class MyServletContextListener implements ServletContextListener {
    public void contextInitialized(ServletContextEvent event) {
    ManagerService.products = new ArrayList<ProductForSale>();
    //new product
    ManagerService.products.add(new ProductForSale("./assets/img/superstar.jpeg", "siêu bền", "SUPERSTAR", "Adidas", 20, 2200000));
    ManagerService.products.add(new ProductForSale("./assets/img/jordan 1 mid tuft orange.jpeg", "màu cam", "JORDAN 1 MID TUFT ORANGE", "Nike", 10, 5800000));
    ManagerService.products.add(new ProductForSale("./assets/img/air force 1 shadow multicolor.jpeg", "nhiều màu", "AIR FORCE 1 SHADOW MULTICOLOR", "Nike", 12, 3900000));
    ManagerService.products.add(new ProductForSale("./assets/img/ultraboost 4.0 dna.jpg", "màu đen", "ULTRABOOST 4.0 DNA", "Adidas", 71, 3800000));
    ManagerService.products.add(new ProductForSale("./assets/img/day jogger dash green linen.jpg", "không biết màu gì", "DAY JOGGER DASH GREEN LINEN", "Adidas", 21, 2200000));
    //hot product
    ManagerService.products.add(new ProductForSale("./assets/img/adidas ultra 4dfwd.jpg", "màu đen", "ADIDAS ULTRA 4DFWD", "Adidas", 41, 5800000));
    ManagerService.products.add(new ProductForSale("./assets/img/falcon pink purple.jpeg", "màu hồng", "FALCON PINK PURPLE", "Adidas", 124, 2600000));
    ManagerService.products.add(new ProductForSale("./assets/img/air max bliss.jpeg", "màu xanh lá cây", "AIR MAX BLISS", "Nike", 121, 2900000));
    ManagerService.products.add(new ProductForSale("./assets/img/nike zoom fly 5.jpeg", "màu trắng đen", "NIKE ZOOM FLY", "Nike", 63, 2200000));
    ManagerService.products.add(new ProductForSale("./assets/img/nike quest 5.jpeg", "màu đen", "NIKE QUEST 5", "Nike", 93, 2200000));
    //sale off
    ManagerService.products.add(new ProductForSale("./assets/img/nike pegasus 39.jpeg", "màu hồng", "NIKE PEGASUS 39", "Nike", 26, 3900000));
    ManagerService.products.add(new ProductForSale("./assets/img/nike air zoom pegasus 39.jpeg", "màu tím", "NIKE AIR ZOOM PEGASUS 39", "Adidas", 14, 3900000));
    ManagerService.products.add(new ProductForSale("./assets/img/puma slipstream green.jpeg", "bự", "PUMA SLIPSTREAM GREEN", "Puma", 10, 2800000));
    ManagerService.products.add(new ProductForSale("./assets/img/nike court vision low next nature.jpeg", "màu đỏ", "NIKE COURT VISION LOW NEXT NATURE", "Nike", 66, 2800000));
    ManagerService.products.add(new ProductForSale("./assets/img/jordan series es phantom.jpeg", "màu da người", "JORDAN SERIES ES PHANTOM", "Nike", 6, 3200000));
    event.getServletContext().setAttribute("products", ManagerService.products);

    ManagerService.accounting = new Accounting();


    }
    
    public void contextDestroyed(ServletContextEvent event) {
    // nothing to do here
    }
}