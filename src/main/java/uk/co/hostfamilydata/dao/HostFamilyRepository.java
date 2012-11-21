package uk.co.hostfamilydata.dao;

import org.springframework.data.repository.CrudRepository;
import uk.co.hostfamilydata.domain.HostFamily;

public interface HostFamilyRepository extends CrudRepository<HostFamily, Long>{
}
