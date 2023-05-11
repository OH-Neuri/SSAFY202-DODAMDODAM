package com.wohaha.dodamdodam.repository;

import com.querydsl.core.types.Projections;
import com.querydsl.core.types.dsl.Expressions;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.wohaha.dodamdodam.dto.response.ClassKidListResponseDto;
import com.wohaha.dodamdodam.dto.response.ClassNoticeResponseDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.web.server.header.ClearSiteDataServerHttpHeadersWriter;

import static com.wohaha.dodamdodam.domain.QClassTeacher.classTeacher;
import static com.wohaha.dodamdodam.domain.QNotice.notice;
import static com.wohaha.dodamdodam.domain.QNoticePhoto.noticePhoto;
import static com.wohaha.dodamdodam.domain.QKid.kid;
import static com.wohaha.dodamdodam.domain.QNoticeKid.noticeKid;
import static com.wohaha.dodamdodam.domain.QUser.user;

import java.util.List;

public class NoticeRepositoryImpl implements NoticeRepositoryCustom {
    @Autowired
    private JPAQueryFactory query;

    @Override
    public List<ClassKidListResponseDto> getKidList(Long classSeq) {
        return query
                .select(Projections.constructor(ClassKidListResponseDto.class,
                        kid.kidSeq, kid.name, kid.photo))
                .from(kid)
                .where(kid.classSeq.eq(classSeq))
                .fetch();
    }

    @Override
    public List<ClassNoticeResponseDto> noticeInfoByTeacher(long classSeq) {
        return query
                .select(Projections.fields(ClassNoticeResponseDto.class,
                        notice.noticeSeq, notice.createdAt.as("date"), notice.content,
                        notice.announcement))
                .from(notice)
                .where(notice.classSeq.eq(classSeq))
                .fetch();

    }
    @Override
    public List<ClassNoticeResponseDto> noticeInfoByParent(long kidSeq) {
        return query
                .select(Projections.fields(ClassNoticeResponseDto.class,
                        notice.noticeSeq, notice.createdAt.as("date"), notice.content,
                        notice.announcement))
                .from(notice)
                .join(noticeKid).on(notice.noticeSeq.eq(noticeKid.noticeSeq))
                .where(noticeKid.kidSeq.eq(kidSeq))
                .fetch();

    }

    @Override
    public List<ClassNoticeResponseDto> noticeSearchByTeacher(int month, int year, long classSeq) {
        return query
                .select(Projections.fields(ClassNoticeResponseDto.class,
                        notice.noticeSeq, notice.createdAt.as("date"), notice.content,
                        notice.announcement))
                .from(notice)
                .where(notice.classSeq.eq(classSeq)
                        .and(Expressions.numberTemplate(Integer.class, "MONTH({0})", notice.createdAt).eq(month))
                        .and(Expressions.numberTemplate(Integer.class, "YEAR({0})", notice.createdAt).eq(year)))
                .fetch();

    }

    @Override
    public List<ClassNoticeResponseDto> noticeSearchByParent(int month, int year, long kidSeq) {
        return query
                .select(Projections.fields(ClassNoticeResponseDto.class,
                        notice.noticeSeq, notice.createdAt.as("date"), notice.content,
                        notice.announcement))
                .from(notice)
                .join(noticeKid).on(notice.noticeSeq.eq(noticeKid.noticeSeq))
                .where(noticeKid.kidSeq.eq(kidSeq)
                        .and(Expressions.numberTemplate(Integer.class, "MONTH({0})", notice.createdAt).eq(month))
                        .and(Expressions.numberTemplate(Integer.class, "YEAR({0})", notice.createdAt).eq(year)))
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

    @Override
    public void deleteNoticePhoto(long noticeSeq) {
        query
                .delete(noticePhoto)
                .where(noticePhoto.noticeSeq.eq(noticeSeq))
                .execute();
    }

    @Override
    public void updateNoticeContent(String content, Long noticeSeq) {
        query
                .update(notice)
                .set(notice.content, content)
                .where(notice.noticeSeq.eq(noticeSeq))
                .execute();
    }

    @Override
    public void deleteNoticeKid(long noticeSeq) {
        query
                .delete(noticeKid)
                .where(noticeKid.noticeSeq.eq(noticeSeq))
                .execute();
    }

    @Override
    public void deleteNotice(long noticeSeq) {
        query
                .delete(notice)
                .where(notice.noticeSeq.eq(noticeSeq))
                .execute();
    }
}
