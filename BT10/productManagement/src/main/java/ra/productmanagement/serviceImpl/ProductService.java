package ra.productmanagement.serviceImpl;

import ra.productmanagement.model.Product;
import ra.productmanagement.service.IProductService;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class ProductService implements IProductService {
    private List<Product> products = new ArrayList<>();

    public ProductService() {
        Product prod1 = new Product(1, "Ex650", 100000, "mỏng nhẹ", "Sony");
        products.add(prod1);
    }

    @Override
    public List<Product> findALl() {
        return products;
    }

    @Override
    public Optional<Product> findbyId(Long id) {
        return products.stream().filter(prod -> prod.getId() == id).findFirst();
    }

    @Override
    public void save(Product product) {
        Product oldProd = findbyId(product.getId()).orElse(null);
        if (oldProd != null) {
            //sửa
            products.set(products.indexOf(oldProd), product);
        } else {
            // thêm mới
            products.add(product);
        }
    }

    @Override
    public void deleteById(Long id) {
        findbyId(id).ifPresent(prod -> {
            products.remove(prod);
        });
    }
}
