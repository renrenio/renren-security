package ${package}.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import ${package}.dao.${className}Dao;
import ${package}.entity.${className}Entity;
import ${package}.service.${className}Service;



@Service("${classname}Service")
public class ${className}ServiceImpl implements ${className}Service {
	@Autowired
	private ${className}Dao ${classname}Dao;
	
	@Override
	public ${className}Entity queryObject(${pk.attrType} ${pk.attrname}){
		return ${classname}Dao.queryObject(${pk.attrname});
	}
	
	@Override
	public List<${className}Entity> queryList(Map<String, Object> map){
		return ${classname}Dao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return ${classname}Dao.queryTotal(map);
	}
	
	@Override
	public void save(${className}Entity ${classname}){
		${classname}Dao.save(${classname});
	}
	
	@Override
	public void update(${className}Entity ${classname}){
		${classname}Dao.update(${classname});
	}
	
	@Override
	public void delete(${pk.attrType} ${pk.attrname}){
		${classname}Dao.delete(${pk.attrname});
	}
	
	@Override
	public void deleteBatch(${pk.attrType}[] ${pk.attrname}s){
		${classname}Dao.deleteBatch(${pk.attrname}s);
	}
	
}
