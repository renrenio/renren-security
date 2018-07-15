package ${package}.${moduleName}.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

#if(${hasBigDecimal})
import java.math.BigDecimal;
#end
import java.io.Serializable;
import java.util.Date;

/**
 * ${comments}
 * 
 * @author ${author}
 * @email ${email}
 * @date ${datetime}
 */
@TableName("${tableName}")
public class ${className}Entity implements Serializable {
	private static final long serialVersionUID = 1L;

#foreach ($column in $columns)
	/**
	 * $column.comments
	 */
	#if($column.columnName == $pk.columnName)
@TableId
	#end
private $column.attrType $column.attrname;
#end

#foreach ($column in $columns)
	/**
	 * 设置：${column.comments}
	 */
	public void set${column.attrName}($column.attrType $column.attrname) {
		this.$column.attrname = $column.attrname;
	}
	/**
	 * 获取：${column.comments}
	 */
	public $column.attrType get${column.attrName}() {
		return $column.attrname;
	}
#end
}
