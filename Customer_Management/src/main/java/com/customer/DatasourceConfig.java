package com.customer;

import javax.sql.DataSource;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * This class is for configure database connection
 * @author Darshit Patel
 */

@Configuration
public class DatasourceConfig {

	@Bean
	public DataSource datasource() {
		return DataSourceBuilder.create()
			.driverClassName("com.mysql.cj.jdbc.Driver")
			.url("jdbc:mysql://localhost:3306/customer_crud_operation")
			.username("root")
			.password("root")
			.build();
	}

}
