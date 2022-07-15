package com.grand.admin.gnb.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.grand.admin.gnb.dao.GnbDAO;
import com.grand.admin.gnb.vo.GnbVO;
import com.grand.util.CommonUtil;

@Service("gnbService")
public class GnbServiceImpl implements GnbService {
	@Resource(name = "gnbDao")
	GnbDAO gnbDao;

	private List<Map<String, Object>> setGnbChildLower( List<GnbVO> list, GnbVO vo) throws Exception {
		List<Map<String, Object>> listMap = null;
		listMap = CommonUtil.convertListToMap(list);
		
		if ( listMap.size() > 0 )
		{
			for(int i = 0 ; i < listMap.size() ; i++)
			{
				String nextLevel 		= "";
				String nextCategory 	= "";
				String nextParent 		= "";
				
				for (String mapkey : listMap.get(i).keySet())
				{
					
					if ( mapkey.equals("tm_level"))
					{
						String nowLevel = listMap.get(i).get(mapkey).toString();
						nextLevel = (Integer.parseInt(nowLevel) + 1) + "";
						
					}

					if ( mapkey.equals("tm_code"))
					{
						nextParent = listMap.get(i).get(mapkey).toString();
					}					
				}
				
				
				GnbVO gnbVO = new GnbVO();
				
				gnbVO.setS_category("GNB01");
				gnbVO.setS_level( Integer.parseInt(nextLevel) + ""  );
				gnbVO.setS_parent(nextParent);
				gnbVO.setS_useyn( vo.getS_useyn() );
					
				
				if ( Integer.parseInt(nextLevel) <= 1)
				{
					
					List<GnbVO> child = null;
					child = gnbDao.selectGnbOnlyClient(gnbVO);
					
					if ( child.size() > 0 )
					{
						List<Map<String, Object>> nextChildMap  = null;
						nextChildMap = this.setGnbChildLower(child, vo);		
						listMap.get(i).put("children", nextChildMap);						
					}	
					
					
				}
			}
		}
		
		return listMap;
	}	
	
	
	private List<Map<String, Object>> setGnbChild( List<GnbVO> list, GnbVO vo) throws Exception {
		List<Map<String, Object>> listMap = null;
		listMap = CommonUtil.convertListToMap(list);
		
		if ( listMap.size() > 0 )
		{
			for(int i = 0 ; i < listMap.size() ; i++)
			{
				String nextLevel 		= "";
				String nextCategory 	= "";
				String nextParent 		= "";
				
				for (String mapkey : listMap.get(i).keySet())
				{
					
					if ( mapkey.equals("tm_level"))
					{
						String nowLevel = listMap.get(i).get(mapkey).toString();
						nextLevel = (Integer.parseInt(nowLevel) + 1) + "";
					}
					
					if ( mapkey.equals("tm_category"))
					{
						nextCategory = listMap.get(i).get(mapkey).toString();
					}
					
					if ( mapkey.equals("tm_code"))
					{
						nextParent = listMap.get(i).get(mapkey).toString();						
					}					
				}

				GnbVO gnbVO = new GnbVO();
				
				gnbVO.setS_category(nextCategory);
				gnbVO.setS_level( Integer.parseInt(nextLevel) + ""  );
				gnbVO.setS_parent(nextParent);
				gnbVO.setS_useyn( vo.getS_useyn() );
				gnbVO.setS_group( vo.getS_group() );
				gnbVO.setS_rule( vo.getS_rule() );
				
				
				
				List<GnbVO> child = null;
				child = gnbDao.selectGnb(gnbVO);
				
				if ( child.size() > 0 )
				{
					List<Map<String, Object>> nextChildMap  = null;
					nextChildMap = this.setGnbChild(child, vo);
					
					listMap.get(i).put("children", nextChildMap);
				}
			}
		}
		
		return listMap;
	}
	
	@Override
	public List<Map<String, Object>> selectGnb(GnbVO vo) throws Exception {
		// TODO Auto-generated method stub
		List<GnbVO> root = gnbDao.selectGnb(vo);
		return setGnbChild(root, vo);
	}

	@Override
	public int insertGnb(GnbVO vo) throws Exception {
		// TODO Auto-generated method stub
		return gnbDao.insertGnb(vo);
	}

	@Override
	public int selectExistsGnb(GnbVO vo) throws Exception {
		// TODO Auto-generated method stub
		return  gnbDao.selectExistsGnb(vo);
	}

	@Override
	public int selectGnbMax(GnbVO vo) throws Exception {
		// TODO Auto-generated method stub
		return gnbDao.selectGnbMax(vo);
	}

	@Override
	public int insertGnbRule(List<Map<String, Object>> param) throws Exception {
		// TODO Auto-generated method stub
		int ruleRecord = 0;
		if ( param.size() > 0 )
		{
			
			for(int i = 0 ; i < param.size() ; i++)
			{
				String setGnbRrpCode = "";
				String setMenuCode    = "";
				String setRule				 = "";
				
				
				for (String mapkey : param.get(i).keySet())
				{
					
					if ( mapkey.equals("gnb_group_code"))
					{
						setGnbRrpCode = param.get(i).get(mapkey).toString();
					}
					
					if ( mapkey.equals("tm_code"))
					{
						setMenuCode = param.get(i).get(mapkey).toString();
					}
					
					if ( mapkey.equals("rule"))
					{
						setRule = param.get(i).get(mapkey).toString();
					}					
				}
				GnbVO gvo = new GnbVO();
				
				gvo.setGnb_group_code( setGnbRrpCode );
				gvo.setTm_code( setMenuCode  );
				gvo.setRule( setRule  );
				
	            int result = gnbDao.insertGnbRule(gvo);
                if ( result > 0 )
                {
                	ruleRecord++;
                }				
			}
		}

		return ruleRecord;

	}

	@Override
	public List<Map<String, Object>> selectGnbLower(GnbVO vo) throws Exception {
		// TODO Auto-generated method stub
		List<GnbVO> root = gnbDao.selectGnbOnlyClient(vo);
		return setGnbChildLower(root, vo);
	}


	@Override
	public List<GnbVO> selectGnbOneData(GnbVO vo) throws Exception {
		// TODO Auto-generated method stub
				
		return gnbDao.selectGnbOneData(vo);
	}


	@Override
	public int deleteGnb(GnbVO vo) throws Exception {
		// TODO Auto-generated method stub
		return gnbDao.deleteGnb(vo);
	}

	
	
}
