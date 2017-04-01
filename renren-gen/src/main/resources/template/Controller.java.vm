package ${package}.controller;

import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import ${package}.entity.${className}Entity;
import ${package}.service.${className}Service;
import ${package}.utils.PageUtils;
import ${package}.utils.Query;
import ${package}.utils.R;


/**
 * ${comments}
 * 
 * @author ${author}
 * @email ${email}
 * @date ${datetime}
 */
@RestController
@RequestMapping("${pathName}")
public class ${className}Controller {
	@Autowired
	private ${className}Service ${classname}Service;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("${pathName}:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<${className}Entity> ${classname}List = ${classname}Service.queryList(query);
		int total = ${classname}Service.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(${classname}List, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{${pk.attrname}}")
	@RequiresPermissions("${pathName}:info")
	public R info(@PathVariable("${pk.attrname}") ${pk.attrType} ${pk.attrname}){
		${className}Entity ${classname} = ${classname}Service.queryObject(${pk.attrname});
		
		return R.ok().put("${classname}", ${classname});
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("${pathName}:save")
	public R save(@RequestBody ${className}Entity ${classname}){
		${classname}Service.save(${classname});
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("${pathName}:update")
	public R update(@RequestBody ${className}Entity ${classname}){
		${classname}Service.update(${classname});
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("${pathName}:delete")
	public R delete(@RequestBody ${pk.attrType}[] ${pk.attrname}s){
		${classname}Service.deleteBatch(${pk.attrname}s);
		
		return R.ok();
	}
	
}
