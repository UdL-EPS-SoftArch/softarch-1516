package cat.udl.eps.softarch.mydoodle.repository;

import cat.udl.eps.softarch.mydoodle.model.MeetingProposal;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import java.util.List;
import java.util.UUID;

/**
 * Created by http://rhizomik.net/~roberto/
 */

@RepositoryRestResource
public interface MeetingProposalRepository extends PagingAndSortingRepository<MeetingProposal, UUID> {

    // PagingAndSortingRepository provides:
    // exists(ID id), delete(T entity), findAll(Pageable), findAll(Sort), findOne(ID id), save(T entity),...
    // http://docs.spring.io/spring-data/commons/docs/current/api/org/springframework/data/repository/PagingAndSortingRepository.html

    List<MeetingProposal> findByTitle(String title);
}