# =============================================
# Stage 1ï¼šä½¿??Maven ç·¨è­¯å°ˆæ?ï¼Œç”¢??JAR æª?# =============================================
FROM maven:3.9-eclipse-temurin-17-alpine AS builder

WORKDIR /sbrest0722

# ?è?è£½å??´å?å§‹ç¢¼ä¸¦ç·¨è­¯ï?è·³é?æ¸¬è©¦ä»¥ç¸®?­å»ºæ§‹æ??“ï?
COPY . .
RUN mvn clean package -DskipTests

# =============================================
# Stage 2ï¼šåªå¸?JAR ?°ç²¾ç°¡ç? JRE ?·è??°å?
# =============================================
FROM eclipse-temurin:17-jre-alpine

WORKDIR /sbrest0722

# å¾?Stage 1 è¤‡è£½ç·¨è­¯å¥½ç? JARï¼ˆç??¬è??¨è¬?¨å??ƒè??†ï?
COPY --from=builder /mythymeleaf0811/target/*.jar sbrest0722.jar

# å®¹å™¨?Ÿå??‚åŸ·è¡?JARï¼Œä¸¦?ç¢º?‡å?ä½¿ç”¨ prod Profile
ENTRYPOINT ["java", "-jar", "sbrest0722.jar"]

# å®???å?ä½¿ç”¨??portï¼ˆRender ?è¨­è®€?–æ­¤?¼ï?
EXPOSE 8090
