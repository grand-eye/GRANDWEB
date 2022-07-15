package com.grand.admin.code.service;

import java.lang.reflect.Field;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.poi.ss.formula.functions.T;
import org.quartz.spi.InstanceIdGenerator;
import org.springframework.stereotype.Service;

import com.grand.admin.code.dao.CodeDAO;
import com.grand.admin.code.vo.CodeDetailVO;
import com.grand.admin.code.vo.CodeVO;
import com.grand.admin.file.dao.FileDAO;
import com.grand.util.CommonUtil;


@Service("codeService")
public class CodeServiceImpl implements CodeService {
	@Resource(name = "codeDao")
	CodeDAO codeDao;

	@Override
	public int selectMasterCodeCount(CodeVO vo) throws Exception {
		// TODO Auto-generated method stub
		return codeDao.selectMasterCodeCount(vo);
	}

	@Override
	public List<CodeVO> selectMasterCode(CodeVO vo) throws Exception {
		// TODO Auto-generated method stub
		return codeDao.selectMasterCode(vo);
	}

	@Override
	public int insertCode(CodeVO vo) throws Exception {
		// TODO Auto-generated method stub
		return codeDao.insertCode(vo);
	}

	@Override
	public int selectExistsCodeID(CodeVO vo) throws Exception {
		// TODO Auto-generated method stub
		return codeDao.selectExistsCodeID(vo);
	}

	@Override
	public List<Map<String, Object>> selectCodeDetail(CodeDetailVO vo) throws Exception {
		List<CodeDetailVO> root = codeDao.selectCodeDetail(vo);
		return setCodeChild(root, vo);
	}

	
	@Override
	public List<Map<String, Object>> selectCodeDetailLower(CodeDetailVO vo) throws Exception {
		// TODO Auto-generated method stub
		List<CodeDetailVO> root = codeDao.selectCodeDetail(vo);
		return setCodeChildLower(root, vo);
	}
	
	
	@Override
	public List<CodeDetailVO> selectCodeDetailChild(CodeDetailVO vo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}	
	
	
	private List<Map<String, Object>> setCodeChildLower( List<CodeDetailVO> list, CodeDetailVO vo) throws Exception {
		
		List<Map<String, Object>> listMap = null;
		listMap = CommonUtil.convertListToMap(list);		
		
		if ( listMap.size() > 0 )
		{
			for(int i = 0 ; i < listMap.size() ; i++)
			{
				
				String nextLevel = "";
				String nextMasterCode = "";
				String nextParent = "";
				
				
				for (String mapkey : listMap.get(i).keySet())
				{
					
					if ( mapkey.equals("tcd_level"))
					{
						String nowLevel = listMap.get(i).get(mapkey).toString();
						nextLevel = (Integer.parseInt(nowLevel) + 1) + "";
						
					}
					
					if ( mapkey.equals("tcd_master_code"))
					{
						nextMasterCode = listMap.get(i).get(mapkey).toString();
					}
					
					if ( mapkey.equals("tcd_code"))
					{
						nextParent = listMap.get(i).get(mapkey).toString();
					}					
				}
				
				CodeDetailVO vvo = new CodeDetailVO();
				
				vvo.setSearch_parent(nextParent);
				vvo.setSearch_level( nextLevel );
				vvo.setSearch_master(nextMasterCode);
				vvo.setSearch_useyn(vo.getSearch_useyn());
				
				if ( Integer.parseInt(nextLevel) <= 1)
				{
					List<CodeDetailVO> childCopy = null;
					childCopy = codeDao.selectCodeDetail(vvo);
					
					
					if ( childCopy.size() > 0 )
					{
						List<Map<String, Object>> child4  = null;
						child4 = this.setCodeChildLower(childCopy, vo);		
						listMap.get(i).put("children", child4);	
					}					
				}
				

				
			}
		}		
		
		
		return listMap;
		
	}	
	
	private List<Map<String, Object>> setCodeChild( List<CodeDetailVO> list, CodeDetailVO vo) throws Exception {
		
		List<Map<String, Object>> listMap = null;
		listMap = CommonUtil.convertListToMap(list);		
		
		if ( listMap.size() > 0 )
		{
			for(int i = 0 ; i < listMap.size() ; i++)
			{
				
				String nextLevel = "";
				String nextMasterCode = "";
				String nextParent = "";
				
				
				for (String mapkey : listMap.get(i).keySet())
				{
					
					if ( mapkey.equals("tcd_level"))
					{
						String nowLevel = listMap.get(i).get(mapkey).toString();
						nextLevel = (Integer.parseInt(nowLevel) + 1) + "";
						
					}
					
					if ( mapkey.equals("tcd_master_code"))
					{
						nextMasterCode = listMap.get(i).get(mapkey).toString();
					}
					
					if ( mapkey.equals("tcd_code"))
					{
						nextParent = listMap.get(i).get(mapkey).toString();
					}					
				}
				
				CodeDetailVO vvo = new CodeDetailVO();
				
				vvo.setSearch_parent(nextParent);
				vvo.setSearch_level( nextLevel );
				vvo.setSearch_master(nextMasterCode);
				vvo.setSearch_useyn(vo.getSearch_useyn());
				
				List<CodeDetailVO> childCopy = null;
				childCopy = codeDao.selectCodeDetail(vvo);
				
				
				if ( childCopy.size() > 0 )
				{
					List<Map<String, Object>> child4  = null;
					child4 = this.setCodeChild(childCopy, vo);		
					listMap.get(i).put("children", child4);	
				}
				
			}
		}		
		
		
		return listMap;
		
	}

	@Override
	public int selectExistsCodeDetail(CodeDetailVO vo) throws Exception {
		// TODO Auto-generated method stub
		return codeDao.selectExistsCodeDetail(vo);
	}

	@Override
	public int insertCodeDetail(CodeDetailVO vo) throws Exception {
		// TODO Auto-generated method stub
		return codeDao.insertCodeDetail(vo);
	}



}
