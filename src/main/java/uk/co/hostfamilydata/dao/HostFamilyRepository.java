package uk.co.hostfamilydata.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;
import uk.co.hostfamilydata.domain.HostFamily;

import java.util.List;

@Transactional
public interface HostFamilyRepository extends CrudRepository<HostFamily, Long>{
    List<HostFamily> findByConfirmed (boolean confirmed);
}
