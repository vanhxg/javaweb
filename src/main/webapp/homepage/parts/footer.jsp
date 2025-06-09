<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<footer class="modern-footer">
	    <div class="footer-container">
	        <!-- Main Footer Content -->
	        <div class="footer-grid">
	            <!-- Company Info -->
	            <div class="footer-section">
	                <a href="index.html" class="footer-logo">
	                    <img src="${pageContext.request.contextPath}/assets/img/logo/logo2_footer.png" alt="Company Logo">
	                </a>
	                <p class="footer-description">
	                    Chúng tôi cam kết mang đến những sản phẩm chất lượng và dịch vụ tốt nhất cho khách hàng.
	                </p>
	            </div>
	
	            <!-- Quick Links -->
	            <div class="footer-section">
	                <h3 class="footer-title">Liên kết nhanh</h3>
	                <ul class="footer-links">
	                    <li><a href="/about">Về chúng tôi</a></li>
	                    <li><a href="/products">Sản phẩm</a></li>
	                    <li><a href="/promotions">Khuyến mãi</a></li>
	                    <li><a href="/blog">Tin tức</a></li>
	                    <li><a href="/contact">Liên hệ</a></li>
	                </ul>
	            </div>
	
	            <!-- Support -->
	            <div class="footer-section">
	                <h3 class="footer-title">Hỗ trợ</h3>
	                <ul class="footer-links">
	                    <li><a href="/faq">Câu hỏi thường gặp</a></li>
	                    <li><a href="/shipping">Chính sách vận chuyển</a></li>
	                    <li><a href="/returns">Đổi trả & Hoàn tiền</a></li>
	                    <li><a href="/privacy">Chính sách bảo mật</a></li>
	                    <li><a href="/terms">Điều khoản dịch vụ</a></li>
	                </ul>
	            </div>
	
	            <!-- Contact Info -->
	            <div class="footer-section">
	                <h3 class="footer-title">Liên hệ</h3>
	                <ul class="footer-contact">
	                    <li>
	                        <i class="fas fa-map-marker-alt"></i>
	                        <span>Bắc Từ Liêm - Hà Nội</span>
	                    </li>
	                    <li>
	                        <i class="fas fa-phone"></i>
	                        <span>(+84) 123 456 789</span>
	                    </li>
	                    <li>
	                        <i class="fas fa-envelope"></i>
	                        <span>info@gmail.com</span>
	                    </li>
	                    <li>
	                        <i class="fas fa-clock"></i>
	                        <span>Thứ 2 - Thứ 7: 8:00 - 17:00</span>
	                    </li>
	                </ul>
	            </div>
	        </div>
	
	        <!-- Footer Bottom -->
	        <div class="footer-bottom">
	            <div class="copyright">
	                &copy; <script>document.write(new Date().getFullYear())</script> Bản quyền thuộc về Nhom9.
	            </div>
	            <div class="payment-methods">
	                <i class="fab fa-cc-visa"></i>
	                <i class="fab fa-cc-mastercard"></i>
	                <i class="fab fa-cc-paypal"></i>
	                <i class="fab fa-cc-amazon-pay"></i>
	            </div>
	            <div class="social-links">
	                <a href="#" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
	                <a href="#" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
	                <a href="#" aria-label="Instagram"><i class="fab fa-instagram"></i></a>
	                <a href="#" aria-label="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
	                <a href="#" aria-label="YouTube"><i class="fab fa-youtube"></i></a>
	            </div>
	        </div>
	    </div>
	</footer>

	<style>
	.modern-footer {
	    background-color: #2c3e50;
	    color: #ecf0f1;
	    padding: 60px 0 0;
	    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	}
	
	.footer-container {
	    max-width: 1200px;
	    margin: 0 auto;
	    padding: 0 20px;
	}
	
	.footer-grid {
	    display: grid;
	    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
	    gap: 30px;
	    margin-bottom: 40px;
	}
	
	.footer-section {
	    margin-bottom: 30px;
	}
	
	.footer-logo img {
	    max-width: 180px;
	    margin-bottom: 20px;
	}
	
	.footer-description {
	    color: #bdc3c7;
	    line-height: 1.6;
	    margin-bottom: 20px;
	    font-size: 14px;
	}
	
	.footer-title {
	    color: #fff;
	    font-size: 18px;
	    margin-bottom: 20px;
	    position: relative;
	    padding-bottom: 10px;
	}
	
	.footer-title::after {
	    content: '';
	    position: absolute;
	    left: 0;
	    bottom: 0;
	    width: 50px;
	    height: 2px;
	    background-color: #3498db;
	}
	
	.footer-links {
	    list-style: none;
	    padding: 0;
	}
	
	.footer-links li {
	    margin-bottom: 10px;
	}
	
	.footer-links a {
	    color: #bdc3c7;
	    text-decoration: none;
	    transition: color 0.3s;
	    font-size: 14px;
	}
	
	.footer-links a:hover {
	    color: #3498db;
	    padding-left: 5px;
	}
	
	.footer-contact {
	    list-style: none;
	    padding: 0;
	}
	
	.footer-contact li {
	    display: flex;
	    align-items: flex-start;
	    margin-bottom: 15px;
	    font-size: 14px;
	    color: #bdc3c7;
	}
	
	.footer-contact i {
	    margin-right: 10px;
	    color: #3498db;
	    margin-top: 3px;
	}
	
	.footer-newsletter h4 {
	    color: #fff;
	    font-size: 16px;
	    margin-bottom: 15px;
	}
	
	.newsletter-form {
	    display: flex;
	}
	
	.newsletter-form input {
	    flex: 1;
	    padding: 10px;
	    border: none;
	    border-radius: 4px 0 0 4px;
	    font-size: 14px;
	}
	
	.newsletter-form button {
	    background-color: #3498db;
	    color: white;
	    border: none;
	    padding: 0 15px;
	    border-radius: 0 4px 4px 0;
	    cursor: pointer;
	    transition: background-color 0.3s;
	}
	
	.newsletter-form button:hover {
	    background-color: #2980b9;
	}
	
	.footer-bottom {
	    border-top: 1px solid rgba(255, 255, 255, 0.1);
	    padding: 20px 0;
	    display: flex;
	    flex-wrap: wrap;
	    justify-content: space-between;
	    align-items: center;
	}
	
	.copyright {
	    color: #bdc3c7;
	    font-size: 13px;
	}
	
	.payment-methods i {
	    font-size: 24px;
	    margin: 0 8px;
	    color: #bdc3c7;
	}
	
	.social-links a {
	    display: inline-block;
	    width: 36px;
	    height: 36px;
	    background-color: rgba(255, 255, 255, 0.1);
	    color: #fff;
	    border-radius: 50%;
	    text-align: center;
	    line-height: 36px;
	    margin-left: 8px;
	    transition: all 0.3s;
	}
	
	.social-links a:hover {
	    background-color: #3498db;
	    transform: translateY(-3px);
	}
	
	@media (max-width: 768px) {
	    .footer-grid {
	        grid-template-columns: 1fr 1fr;
	    }
	    
	    .footer-bottom {
	        flex-direction: column;
	        text-align: center;
	    }
	    
	    .copyright, .payment-methods, .social-links {
	        margin: 10px 0;
	    }
	}
	
	@media (max-width: 480px) {
	    .footer-grid {
	        grid-template-columns: 1fr;
	    }
	}
	</style>