package uk.co.hostfamilydata.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import uk.co.hostfamilydata.dao.HostFamilyRepository;
import uk.co.hostfamilydata.domain.HostFamily;

import java.util.List;

@Service
public class SearchService {

	@Autowired
	private HostFamilyRepository hostFamilyRepository;

	public List<HostFamily> search(String queryString) {

		return hostFamilyRepository.findByAddressLikeOrAddress2LikeOrAddress3LikeOrFirstNameLikeOrLastNameLikeOrFirstName2LikeOrLastName2Like(

				"%" + queryString.replace(" ","%") + "%",
				"%" + queryString.replace(" ","%") + "%",
				"%" + queryString.replace(" ","%") + "%",
				"%" + queryString.replace(" ","%") + "%",
				"%" + queryString.replace(" ","%") + "%",
				"%" + queryString.replace(" ","%") + "%",
				"%" + queryString.replace(" ","%")  + "%"

		);
	}
}

