package com.jit.project.base;

public class OperationResult {
	private int status;
	private String message;

	
	public OperationResult() {
		super();
	}

	public OperationResult(int status, String message) {
		super();
		this.status = status;
		this.message = message;
	}

	public int getStatus() {
		return status;
	}

	public OperationResult setStatus(int status) {
		this.status = status;
		return this;
	}

	public String getMessage() {
		return message;
	}

	public OperationResult setMessage(String message) {
		this.message = message;
		return this;
	}

}
