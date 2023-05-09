package com.wohaha.dodamdodam.config;

import com.querydsl.sql.types.StringType;
import org.hibernate.dialect.MySQL57Dialect;
import org.hibernate.dialect.MySQL5Dialect;
import org.hibernate.dialect.MySQL5InnoDBDialect;
import org.hibernate.dialect.function.SQLFunctionTemplate;
import org.hibernate.dialect.function.StandardSQLFunction;
import org.hibernate.type.LocalTimeType;
import org.hibernate.type.StandardBasicTypes;

public class HibernateDialectConfig extends MySQL5InnoDBDialect {

    public HibernateDialectConfig() {
        super();
        registerFunction(
                "TIME_FORMAT",
                new SQLFunctionTemplate(StandardBasicTypes.STRING, "time_format(?1, ?2)")
        );
    }
}

