package com.model2.mvc.web.product;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;

//json 형태로 객체 데이터를 반환하는 것, 기존 컨트롤로에 @ResponseBody가 추가된것.  > 바디로오는걸 도메인 객체로 바인딩해라... 
//==> 상품관리 Controller
// 레스트 컨트롤러 > 스프링에서 컨트롤러 중 뷰로 응답하지않는 컨트롤러를 의미 
// 메소드의 반환결과를 제이슨 형태로 반환 
@RestController 
@RequestMapping("/product/*")
public class ProductRestController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method 구현 않음
		
	public ProductRestController(){
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml 참조 할것
		//==> 아래의 두개를 주석을 풀어 의미를 확인 할것
		//@Value("#{commonProperties['pageUnit']}")
		@Value("#{commonProperties['pageUnit'] ?: 3}")
		int pageUnit;
		
		//@Value("#{commonProperties['pageSize']}")
		@Value("#{commonProperties['pageSize'] ?: 2}")
		int pageSize;
	
	
	@RequestMapping( value="json/addProduct", method=RequestMethod.POST   )
	public Product addProduct( @RequestBody Product product) throws Exception {

		System.out.println("/product/json/addProduct : POST ");
		//Business Logic
		
        productService.addProduct(product);
        
        return product;
	}
	
	// @PathVariable > @RequestParam과 비슷, 파라미터값 가져오는것 
	@RequestMapping( value="json/getProduct/{prodNo}", method=RequestMethod.GET )
	public Product getProduct( @PathVariable int prodNo) throws Exception {
		
		System.out.println("/product/json/getProduct : GET");
		
		//Business Logic
		return productService.getProduct(prodNo);
	}

	
	@RequestMapping( value="json/updateProduct/{prodNo}", method=RequestMethod.GET )
	public Product updateProduct(@PathVariable int prodNo) throws Exception{

		System.out.println("/product/json/updateProduct : GET");
		
		//Business Logic
		return productService.getProduct(prodNo);
		
	}
	
	@RequestMapping( value="json/updateProduct", method=RequestMethod.POST )
	public Product updateProductView( @RequestBody Product product) 
											  throws Exception{
		
		System.out.println("/product/json/updateProduct : POST");
		
		//Business Logic
         productService.updateProduct(product);
        
        return product;
	
	}
	
	@RequestMapping( value="json/listProduct") // 메소드 부분을 지워서, 겟/포스트 방식 모두 가능 
	public Map listProduct(
							@RequestBody Search search, HttpServletRequest request) throws Exception{
		
		System.out.println("/product/json/listProduct : GET / POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String , Object> map=productService.getProductList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);

		return map;
	}
}