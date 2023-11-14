package ra.productmanagement.service;

import java.util.List;
import java.util.Optional;

public interface IGenericService <T,E>{
    List<T> findALl ();

    Optional<T> findbyId(E id);

    void save(T t);

    void deleteById(E id);
}
