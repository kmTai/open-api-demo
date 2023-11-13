package dev.kinman.openapidemo;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class OpenapiDemoApplication {

	public static void main(String[] args) {
		SpringApplication.run(OpenapiDemoApplication.class, args);
	}


	@Bean
	public OpenAPI springShopOpenAPI() {
		return new OpenAPI()
				.info(new Info().title("REST API Demo")
						.description("by kinman")
						.version("v1"));
	}
}
