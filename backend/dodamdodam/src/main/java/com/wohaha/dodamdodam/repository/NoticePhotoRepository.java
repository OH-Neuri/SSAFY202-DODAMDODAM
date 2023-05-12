package com.wohaha.dodamdodam.repository;


import com.wohaha.dodamdodam.domain.NoticePhoto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface NoticePhotoRepository extends JpaRepository<NoticePhoto,Long> {
}
