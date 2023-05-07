package com.wohaha.dodamdodam.repository;

import com.querydsl.core.types.Projections;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.wohaha.dodamdodam.dto.response.ClassNoticeResponseDto;
import org.springframework.beans.factory.annotation.Autowired;
import static com.wohaha.dodamdodam.domain.QNotice.notice;
import static com.wohaha.dodamdodam.domain.QNoticePhoto.noticePhoto;
import static com.wohaha.dodamdodam.domain.QKid.kid;
import static com.wohaha.dodamdodam.domain.QNoticeKid.noticeKid;
import java.util.List;

public class NoticeRepositoryImpl implements NoticeRepositoryCustom{
    @Autowired
    private JPAQueryFactory query;

    @Override
    public List<ClassNoticeResponseDto> noticeInfo(long classSeq) {
        return query
                .select(Projections.fields(ClassNoticeResponseDto.class,
                        notice.noticeSeq, notice.createdAt.as("date"), notice.content,
                        notice.announcement))
                .from(notice)
                .where(notice.classSeq.eq(classSeq))
                .fetch();

    }

    @Override
    public List<String> noticePhoto(long noticeSeq) {
        return query
                .select(noticePhoto.photo)
                .from(noticePhoto)
                .where(noticePhoto.noticeSeq.eq(noticeSeq))
                .fetch();
    }

    @Override
    public List<String> noticeKid(long noticeSeq) {
        return query
                .select(kid.name)
                .from(noticeKid)
                .join(kid)
                .on(noticeKid.kidSeq.eq(kid.kidSeq))
                .where(noticeKid.noticeSeq.eq(noticeSeq))
                .fetch();
    }

    @Override
    public ClassNoticeResponseDto oneNoticeInfo(long noticeSeq) {
        return query
                .select(Projections.fields(ClassNoticeResponseDto.class,
                        notice.noticeSeq, notice.createdAt.as("date"), notice.content,
                        notice.announcement))
                .from(notice)
                .where(notice.noticeSeq.eq(noticeSeq))
                .fetchOne();
    }
}
