package com.ko2ic.spikespringbootswagger

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.context.annotation.Bean
import springfox.documentation.builders.ApiInfoBuilder
import springfox.documentation.builders.PathSelectors
import springfox.documentation.service.ApiInfo
import springfox.documentation.spi.DocumentationType
import springfox.documentation.spring.web.plugins.Docket
import springfox.documentation.swagger2.annotations.EnableSwagger2

@SpringBootApplication
@EnableSwagger2
class SpikeSpringbootSwaggerApplication {
    @Bean
    fun demoApi(): Docket {
        return Docket(DocumentationType.SWAGGER_2)
                .useDefaultResponseMessages(false)
                .select()
                .paths(PathSelectors.regex("^\\/hello.*"))
                .build()
                .apiInfo(apiInfo())
    }

    fun apiInfo(): ApiInfo {
        return ApiInfoBuilder()
                .title("API Document Demo")
                .description("This is an API document powered by swagger.")
                .version("0.0.0")
                .build()
    }

}

/**
 * @see <a href="http://localhost:8080/v2/api-docs">swagger specification</a>
 * でjson取得できる
 * 上記のjsonを
 * @see <a href="http://oai.swagger.io/">OpenAPI Specification</a>
 * でjsonに変換できる
 * その後、以下のコマンドでflutterコードを生成
 * <pre>
 *     $ openapi-generator generate -i openapi3.json -g dart -DbrowserClient=false -o ./client
 * </pre>
 * AndroidでPCのlocalhostに接続する場合は、10.0.0.2を使う
 *
 * このAPI自体の仕様は以下
 * @see <a href="http://localhost:8080/swagger-ui.html">swagger-ui</a>
 */
fun main(args: Array<String>) {
    runApplication<SpikeSpringbootSwaggerApplication>(*args)
}
