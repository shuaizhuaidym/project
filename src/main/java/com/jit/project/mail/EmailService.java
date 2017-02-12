package com.jit.project.mail;

public interface EmailService {
	boolean send(String to, String subject, String html);
}