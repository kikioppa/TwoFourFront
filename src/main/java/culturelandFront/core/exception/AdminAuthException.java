package culturelandFront.core.exception;


public class AdminAuthException extends RuntimeException {

	private static final long serialVersionUID = 1L;

	public AdminAuthException() {
		super("no auth this work");
	}
}
