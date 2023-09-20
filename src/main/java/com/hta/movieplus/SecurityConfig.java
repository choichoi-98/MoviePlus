package com.hta.movieplus;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import com.hta.security.CustomAccessDeniedHandler;
//import com.hta.security.CustomUserDetailsService;
import com.hta.security.LoginFailHandler;
import com.hta.security.LoginSuccessHandler;

@EnableWebSecurity
@Configuration
public class SecurityConfig {

	@Autowired
	private DataSource datasouce;

	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

		http.authorizeRequests()
				.antMatchers("/resources/**/**").permitAll()
				.antMatchers("/**").permitAll();

		http.formLogin().loginPage("/member/login").loginProcessingUrl("/member/loginProcess").usernameParameter("id")
				.passwordParameter("password").successHandler(loginSuccessHandler()).failureHandler(loginFailHandler());

		http.logout().logoutSuccessUrl("/member/login").logoutUrl("/member/logout").invalidateHttpSession(true)
				.deleteCookies("remember-me", "JSESSION_ID");

		http.rememberMe().rememberMeParameter("remember-me").rememberMeCookieName("remember-me")
				.tokenValiditySeconds(2419200);

		http.exceptionHandling().accessDeniedHandler(accessDeniedHandler());

		return http.build();
	}

	AuthenticationManager authenticationManager(AuthenticationConfiguration authenticationConfiguration)
			throws Exception {
		return authenticationConfiguration.getAuthenticationManager();
	}

	@Bean
	public AuthenticationSuccessHandler loginSuccessHandler() {
		return new LoginSuccessHandler(); // 패키지 com.naver.securiity에 존재하는 모든 클래스 파일에 @Service
	}

//	@Bean
//	public UserDetailsService customUserService() {
//		return new CustomUserDetailsService();
//	}

	@Bean
	public AccessDeniedHandler accessDeniedHandler() {
		return new CustomAccessDeniedHandler();
	}

	@Bean
	public AuthenticationFailureHandler loginFailHandler() {
		return new LoginFailHandler();
	}

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Bean
	public PersistentTokenRepository tokenRepository() {
		// PersistentTokenRepository의 구현체인 JdbcTokenRepositoryImpl 클래스 사용
		JdbcTokenRepositoryImpl jdbcTokenRepository = new JdbcTokenRepositoryImpl();
		jdbcTokenRepository.setDataSource(datasouce);

		return jdbcTokenRepository;
	}

}
