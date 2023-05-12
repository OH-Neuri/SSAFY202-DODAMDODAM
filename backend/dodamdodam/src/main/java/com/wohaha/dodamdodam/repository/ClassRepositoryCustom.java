package com.wohaha.dodamdodam.repository;

import org.jetbrains.annotations.Nullable;

import java.util.Optional;

public interface ClassRepositoryCustom {
    Optional<String> findNameById(Long classSeq);
}
